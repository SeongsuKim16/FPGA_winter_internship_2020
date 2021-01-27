----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/22 18:26:10
-- Design Name: 
-- Module Name: UART_RX - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- UART_TX Component�� UART TX ��� �Ծ�
-- ��żӵ� : CLOCK_PER_BIT ���� ���� ���� ����
-- 1200bps : 41666.67 = 41666
-- 2400bps : 20833.33 = 20833
-- 4800bps : 10416.67 = 10416
-- 9600bps : 5208.33 = 5208
-- 14400bps : 3472.22 = 3472
-- 19200bps : 2604.17 = 2604
-- 38400bps : 1302.08 = 1302
-- 57600bps : 868.06 = 868
-- 115200bps : 434.03 = 434
-- 230400bps : 217.01 = 217
-- 460800bps : 108.51 = 108
-- 921600bps : 54.25 = 54
-- ���� Bit : 1 Bit
-- ������ Bit : 8 Bit
-- �и�Ƽ Bit : �и�Ƽ ����
-- ���� Bit : 1 Bit

entity UART_RX is
-- ������ CLOCK_PER_BIT�� �ʱ� �������� �Ʒ��� �������� ����
-- CLOCK_PER_BIT = (FPGA ���� Ŭ�� ���ļ�) / (UART ��� �ӵ�)
-- ��) FPGA ���� Ŭ�� ���ļ� : 50MHz
-- UART ��� �ӵ� : 115,200bps
-- CLOCK_PER_BIT = 50000000 / 115200
-- = 434.03
  generic(CLOCK_PER_BIT : integer := 434);
  Port (CLOCK : in std_logic;
        UART_RX_DATA_INPUT : in std_logic;
        -----------------------------------------
        UART_RX_DATA_OUTPUT_DONE : out std_logic;
        UART_RX_DATA_OUTPUT : out std_logic_vector(7 downto 0) 
        );  
end UART_RX;

architecture Behavioral of UART_RX is
    type UART_RX_STATES is (UART_RX_IDLE, UART_RX_START_BIT, 
    UART_RX_DATA_BIT, UART_RX_STOP_BIT, UART_RX_COMPLETE);
    
    signal UART_RX_STATE : UART_RX_STATES := UART_RX_IDLE;
    signal UART_RX_DATA_DOUBLE_BUFFER : std_logic := '0';
    signal UART_RX_DATA_BUFFER : std_logic := '0';
    signal CLOCK_COUNT : integer range 0 to CLOCK_PER_BIT - 1 := 0;
    -- 8 bit ������ ���� --
    signal UART_RX_BIT_INDEX : integer range 0 to 7 := 0;
    signal UART_RX_DATA : std_logic_vector(7 downto 0) := "0000000";
    signal UART_RX_DATA_OUTPUT_COMPLETE : std_logic := '0';
begin
    -- �Է� ��ȣ�� ���� ���� ���۸� ó�� --
    -- �ش� process�� �񵿱�� �Է� ��ȣ�� FPGA�� CLOCK �����ΰ� ����ȭ ��Ű�� ������ ���� --
    -- Tristate ������ �Է½�ȣ ������ ���� --
    
    BUFFERING : process(CLOCK)
    begin
        if rising_edge (CLOCK) then
            UART_RX_DATA_DOUBLE_BUFFER <= UART_RX_DATA_INPUT;
            UART_RX_DATA_BUFFER <= UART_RX_DATA_DOUBLE_BUFFER;
        end if;
    end process;
    
    MAIN : process(CLOCK)
    begin
        if rising_edge(CLOCK) then
            ---- [STATE IDLE] : UART RX ��� ���� ----
            if (UART_RX_STATE = UART_RX_IDLE) then
                UART_RX_DATA_OUTPUT_COMPLETE <= '0';
                CLOCK_COUNT <= 0;
                UART_RX_BIT_INDEX <= 0;
                
                -- move to next state --
                if (UART_RX_DATA_BUFFER = '0') then
                    UART_RX_STATE <= UART_RX_START_BIT;
                -- stay in current state --
                else
                    UART_RX_STATE <= UART_RX_IDLE;
                end if;
                
            
            ---- [STATE START BIT] : UART Start Bit ���� ���� ----    
            elsif (UART_RX_STATE = UART_RX_START_BIT) then
                -- select to move next state or past state --
                if (CLOCK_COUNT = ((CLOCK_PER_BIT - 1) / 2)) then
                
                    -- move to next state --
                    if (UART_RX_DATA_BUFFER = '0') then
                        CLOCK_COUNT <= 0;
                        UART_RX_STATE <= UART_RX_DATA_BIT;
                    -- move to past state --    
                    else
                        UART_RX_STATE <= UART_RX_IDLE;
                    end if;
                    
                -- stay in current state --    
                else
                    CLOCK_COUNT <= CLOCK_COUNT + 1;
                    UART_RX_STATE <= UART_RX_START_BIT;
                end if;
            
            ---- [STATE DATA BIT] : UART RX Data Bit ���� ����(8 bit ����) ----
            elsif (UART_RX_STATE = UART_RX_DATA_BIT) then
                -- count up the clock till a bit is received --
                if (CLOCK_COUNT < (CLOCK_PER_BIT - 1)) then
                    CLOCK_COUNT <= CLOCK_COUNT + 1;
                    UART_RX_STATE <= UART_RX_DATA_BIT;
                -- if a bit is received, reset the clock and pass the received bit from DATA BUFFER to DATA --    
                else
                    CLOCK_COUNT <= 0;
                    UART_RX_DATA(UART_RX_BIT_INDEX) <= UART_RX_DATA_BUFFER;
                    
                    -- select to move to next state or to stay in current state --
                    -- stay in current state --
                    if (UART_RX_BIT_INDEX < 7) then
                        UART_RX_BIT_INDEX <= UART_RX_BIT_INDEX + 1;
                        UART_RX_STATE <= UART_RX_DATA_BIT;
                    -- move to next state --    
                    else
                        UART_RX_BIT_INDEX <= 0;
                        UART_RX_STATE <= UART_RX_STOP_BIT;
                    end if;
                end if;
            
            
            ---- [STATE STOP BIT] : UART RX Stop Bit ���� ���� ----
            elsif (UART_RX_STATE = UART_RX_STOP_BIT) then
                -- stay in current state --
                if (CLOCK_COUNT < (CLOCK_PER_BIT - 1)) then
                    CLOCK_COUNT <= CLOCK_COUNT + 1;
                    UART_RX_STATE <= UART_RX_STOP_BIT;
                else
                    -- move to next state --
                    CLOCK_COUNT <= 0;
                    UART_RX_DATA_OUTPUT_COMPLETE <= '0';
                    UART_RX_STATE <= UART_RX_COMPLETE;  
                end if;
                
            ---- [STATE COMPLETE] : UART RX ������ ������ ���� �Ϸ� ���� ----
            elsif (UART_RX_STATE = UART_RX_COMPLETE) then
                UART_RX_STATE <= UART_RX_IDLE;
                UART_RX_DATA_OUTPUT_COMPLETE <= '1';
                UART_RX_DATA_OUTPUT <= UART_RX_DATA;
                
                
            ---- [STATE DEFAULT] ----    
            else
                UART_RX_STATE <= UART_RX_IDLE;       
            end if;
        end if;  
    end process;
    UART_RX_DATA_OUTPUT_DONE <= UART_RX_DATA_OUTPUT_COMPLETE; 

end Behavioral;
