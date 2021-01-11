----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 22:16:39
-- Design Name: 
-- Module Name: RECORD_TYPE - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

----------------------------------------------------------------------------------


--    ���ڵ���(RECORD) : ���� ���ų� �ٸ� �������� ��ü�� ����.
--    ���ڵ����� ���������ν� ���� �ٸ� ���������� �ϳ��� ���ڵ������� ����� �� �ִ�.
--    �ʵ�(FIELD) : ���ڵ��� �� ���ҵ�, �� ���ڵ带 �����ϰ� �ִ� ���� ������ ��ü�� �ʵ�� �θ���.
    
--    type �����ڵ� �̸��� is record
--        �����ڵ� �ʵ� �̸��� : ������������;
--    end record;

package RECORD_TYPE is
    type Record1_Type is record
        I : integer range 7 to 0;
        J : std_logic;
    end record;
        
    type Record2_Type is record
        I : integer range 0 to 7;
        J : unsigned(1 downto 0);
    end record;
    
    type FLOAT_POINT_TYPE is record
        sign     : std_logic;
        Exponent : unsigned(6 downto 0);
        Fraction : unsigned(23 downto 0);
     end record;
 end RECORD_TYPE;