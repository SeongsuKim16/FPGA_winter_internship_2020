----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 14:04:20
-- Design Name: 
-- Module Name: DECODER_3x8 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--    DECODER :
--    N���� �Է¿� ���� �ִ� 2^N���� ����� ���´�.
--    N���� �Է� ��Ʈ�� ������ M���� ��Ÿ���� ��, ���ڴ��� ����� �ٸ� ����� 0���� �����Ǹ� M��°�� ��¸� 1�� �ȴ�.
entity DECODER_3x8 is
  Port (INPUT : IN std_logic_vector(2 downto 0);
        OUTPUT : OUT std_logic_vector(7 DOWNTO 0) );
end DECODER_3x8;

architecture Behavioral of DECODER_3x8 is
begin
    process(INPUT) 
    begin
        IF(INPUT = "000") THEN
            OUTPUT <= "00000001";
        elsif(INPUT = "001") THEN
            OUTPUT <= "00000010";
        elsif(INPUT = "010") THEN
            OUTPUT <= "00000100";
        elsif(INPUT = "011") THEN
            OUTPUT <= "00001000";
        elsif(INPUT = "100") THEN
            OUTPUT <= "00010000";
        elsif(INPUT = "101") THEN
            OUTPUT <= "00100000";
        elsif(INPUT = "110") THEN
            OUTPUT <= "01000000";
        elsif(INPUT = "111") THEN
            OUTPUT <= "10000000";    
        END IF;
    END process;
end Behavioral;
