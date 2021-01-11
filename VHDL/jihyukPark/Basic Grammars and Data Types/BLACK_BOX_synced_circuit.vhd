----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 16:11:00
-- Design Name: 
-- Module Name: BLACK_BOX_synqed_circuit - Behavioral
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

-- ���� ȸ�� ����
entity BLACK_BOX_synced_circuit is
    Port (CLOCK, A, B, C : in   std_logic;
          D              : out  std_logic);
end BLACK_BOX_synced_circuit;

architecture Behavioral1 of BLACK_BOX_synced_circuit is
 begin
        process(CLOCK)
        -- ���� ����
        variable Temp : std_logic;
        begin
            if rising_edge(CLOCK) then
                Temp := A and B;
                D <= Temp or C after 1 ns; -- d flipflop with 1 ns delay time
            end if;
        end process;
end Behavioral1;


--    ����ȸ�� : Ŭ���� ��� ���� Ȥ�� �ϰ� ������ �������� ��� ��ȣ�� ���޵Ǵ� ȸ��
--    ��ȣ D�� D flip flop�� ������� ����Ǿ� 1 ns ���� �Ŀ� ��Ÿ��.

architecture Behavioral2 of BLACK_BOX_synced_circuit is
         -- ��ȣ ����
        signal Temp : std_logic;
 begin
        process(CLOCK)
        begin
            if rising_edge(CLOCK) then
                Temp <= A and B after 3 ns; -- dff with 3 ns delay time
                D <= Temp or C after 1 ns;  -- dff with 1 ns delay time
            end if;
        end process;
end Behavioral2;
--    ��ȣ Temp�� D flip flop�� ������� ����Ǿ� 3 ns ���� �Ŀ� ��Ÿ��.
--    ��ȣ D�� D flip flop�� ������� ����Ǿ� 1 ns ���� �Ŀ� ��Ÿ��.

configuration Conf of BLACK_BOX_synced_circuit is
    for Behavioral2
    end for;
end configuration Conf;