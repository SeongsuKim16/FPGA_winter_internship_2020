----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 16:30:43
-- Design Name: 
-- Module Name: BLACK_BOX_loop - Behavioral
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
use ieee.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;



----------------------------------------------------------------------------------

--    7. ���������� ������ ��ȣ�� �Ҵ繮
--    ��������� �𵨸��ϴµ� �־ ���� �Ҵ繮�� ��ȣ �Ҵ繮�� �ռ� ��� ��.
--    ����Ʈ ���������� ��°� ���� ���������� ����� �и��Ǿ� �ִ� ��ȸ�� ����

entity BLACK_BOX_loop is
    Port (CLOCK, DATA : in  std_logic;
          O           : out std_logic_vector(3 downto 0));  --��¿� ����Ʈ ��������
end BLACK_BOX_loop;

architecture Behavioral_1 of BLACK_BOX_loop is

begin
    variable_for :
    process(CLOCK)
        -- ���� ����
           variable pipe : std_logic_vector (3 downto 0); --���� ���� ����Ʈ ��������
       begin
            if rising_edge(clock) then
                for N in 3 downto 1 loop        
                    pipe(N) := pipe(N - 1);     -- Pipe(3) := Pipe(2); 
                end loop;                       -- Pipe(2) := Pipe(1); 
                                                -- Pipe(1) := Pipe(0); 
                pipe(0) := DATA;                -- Pipe(0) := DATA;    
                O <= pipe;                      -- OUT := Pipe;        
            end if;
        end process;          
end Behavioral_1;


-- for loop�� ������������ �ϸ�
architecture Behavioral_2 of BLACK_BOX_loop is

begin
    variable_for :
    process(CLOCK)
        -- ���� ����
           variable pipe : std_logic_vector (3 downto 0);--���� ���� d_FlipFlop
       begin
            if rising_edge(clock) then
                for N in 1 to 3 loop        
                    pipe(N) := pipe(N - 1);     -- Pipe(1) := Pipe(0); 
                end loop;                       -- Pipe(2) := Pipe(1); 
                                                -- Pipe(3) := Pipe(2); 
                pipe(0) := DATA;                -- Pipe(0) := DATA;    
                O <= pipe;                      -- OUT := Pipe;        
            end if;                             -- ������ Pipe(0) = Pipe(1) = Pipe(2) = Pipe(3) �̹Ƿ� �ϳ��� dff������ �����.
        end process;          
end Behavioral_2;


-- signal �� �̿��� ����Ʈ �������� ����
-- Behavioral_1 �� ������ ����
architecture Behavioral_3 of BLACK_BOX_loop is
    signal pipe : std_ulogic_vector(3 downto 0);
begin
    variable_for :
    process(clock)
    begin
        if rising_edge(clock) then
            for N in 1 to 3 loop
                pipe(N) <= pipe(N - 1);
            end loop;
        end if;
    end process;
end Behavioral_3;

configuration Config of BLACK_BOX_loop is
    for Behavioral_1
    end for;
end Config;