----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 18:05:20
-- Design Name: 
-- Module Name: SYNC_RAM - Behavioral
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
--    8. ������ �������� (Enumeration Data Type)
--    ������ �������� : ����ڰ� ������ ���� ����. �̶�, ��� ���� "Red", "Multiply"�� ���� �ĺ����̰ų�,
--                    '0', '1', 'U', 'Z'�� ���� ���� ���ͷ��̴�.
    
--    type �������� �̸��� is (�����Ű���);
--    ex) type Rainbow is (Red, Orange, Yellow, Green, Blue, Indigo, Violet);
--        Red = 000, Ornage = 001, Yellow = 010, Green = 011, Blue = 100, Indigo = 101, Violet = 110


--    9. ���� ��������(Integer Data Type)
--    ������ ���� : ���������� ������ �����ϸ� �� ������ �׻� ��õǾ�� �Ѵ�.
--    ���� ������� �ʴ´ٸ� -2^31 + 1���� 2^31 - 1 ������ �����ȴ�.
    
--    type �������� �̸��� is range ������������;
--    ��)  type CountValue is range 0 to 15;
--         type Thirties is range 30 to 39;
--         type Seventies is range 79 downto 70;
    
    
--    10. ���� ��������(Composite Data Type)
--    ���� �������� : ���� ������ �����ϴµ� ����ϸ�, �̷��� ������ �迭(Array)�̳� ���ڵ�(Record)�� �����Ѵ�.
--    Array�� �� ���Ҵ� ���� ���������̾�� �ϰ�, Record�� ���Ҵ� �ٸ� �������� �� �� �ִ�.
    
--    �迭���� RAM�̳� ROM�� ���� ������ �𵨸��ϴµ� �ſ� ���ϴ�. 
--    �迭�� ���Ҵ� � ���������� ����ص� �ǳ�, ��� ���Ұ� ������ ���������̾�� �Ѵ�.
--    �̷��� �迭���� �������� �迭(Unconstrained Array)�� ������ �迭(Constrained Array)�� �ִ�.
    
--    1)�������� �迭
--    type unsigned is array(natural range<>) of std_logic;
    
--    2)������ �迭
--    type unsigned is array(natural range 7 downto 0) of std_logic;


entity SYNC_RAM is
  Port (ADDRESS     : in unsigned (7 downto 0);
        CLOCK       : in std_logic;
        WRITE_ENABLE: in std_logic;
        DATA        : in std_logic_vector(7 downto 0);
        O           : out std_logic_vector(7 downto 0));
end SYNC_RAM;

architecture Behavioral of SYNC_RAM is
    subtype RAM_WORD is std_logic_vector(7 downto 0);   -- 8 bit vector subtype
    type RAM_TABLE is array(0 to 255) of RAM_WORD;        -- 256 RAM_WORD array type
    signal RAM_DATA : RAM_TABLE;
begin
    WRITE_PROCESS :
    process(CLOCK)
        variable TEMP : integer;
    begin
        if rising_edge(CLOCK) then
            TEMP := conv_integer(ADDRESS);  --convert the arg argument to an integer
            
            if (WRITE_ENABLE = '1') then
                RAM_DATA(TEMP) <= DATA;
                O <= (others => 'Z');
            else
                O <= RAM_DATA(TEMP);
            end if;
         end if;
     end process;
end Behavioral;
