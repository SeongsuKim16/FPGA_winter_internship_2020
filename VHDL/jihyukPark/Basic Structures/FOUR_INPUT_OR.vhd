----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 13:50:54
-- Design Name: 
-- Module Name: FOUR_INPUT_OR - Behavioral
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
----------------------------------------------------------------------------------

--entity <Entity �̸�> is
--    port( <Port �̸�> : <���> <��������> ;
--          <Port �̸�> : <���> <��������>);
--end entity <Entity �̸�>; 

-- entity ����
entity FOUR_INPUT_OR is
  Port (A1, A2, A3, A4 : in std_logic;
        O : out std_logic );
end entity FOUR_INPUT_OR;



--architecture <Architecture �̸�> of <Entity �̸�> is
--    <����>
--    begin
--        <Architecture�� ������ ���>
--    end architecture <Architecture�� �̸�>

-- architecture ���� 
architecture Behavioral of FOUR_INPUT_OR is

    -- component ����
    component test
        port(A, B : in std_logic ;
             C    : out std_logic);
    end component test;
    
    -- �� component�� �����ϴ� ���� ��ȣ�� ����
        signal N1, N2 : std_logic;
begin
    U1 : test port map(A => N1, B => N2, C => O);
    U2 : test port map(A => N1, B => A2, C => N1);
    U3 : test port map(A => A3, B => A4, C => N2);
end architecture Behavioral;
