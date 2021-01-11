----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 13:10:06
-- Design Name: 
-- Module Name: MUX_4to1 - Behavioral
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
use IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


----------------------------------------------------------------------------------
--MUX : N���� �Էµ� �� M���� ���� ��ȣ �Է��� ���� �ϳ��� ����� ����
--M���� ���� ��ȣ �Է��� ���� ��Ƽ�÷����� N =< 2M���� �Է� ��ȣ �� �ϳ��� ����� �Ҵ��� �� �ִ�.

entity MUX_4to1 is
  Port (INPUT : IN std_logic_vector (3 downto 0);
        SEL   : IN std_logic_vector (1 downto 0);
        OUTPUT: OUT std_logic);
end MUX_4to1;

architecture Behavioral of MUX_4to1 is

begin
    OUTPUT <= INPUT(0) when SEL = "00" 
     else     INPUT(1) when SEL = "01" 
     else     INPUT(2) when SEL = "10" 
     else     INPUT(3) when SEL = "11";
end Behavioral;
