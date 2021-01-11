----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 23:09:57
-- Design Name: 
-- Module Name: RECORD_example2 - Behavioral
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
use IEEE.std_logic_arith.all;

use work.record_type.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RECORD_example2 is
  Port (Si      : in std_logic;             --Sign
        Ex      : in unsigned(6 downto 0);  --Exponent
        Fr      : in unsigned(23 downto 0); --Fraction
        A, B    : in std_logic;
        F1, F2  : in FLOAT_POINT_TYPE;      --RECORD FIELD ��ü�� �ǿ����ڿ� ����.
        C       : out unsigned(31 downto 0);
        D       : out std_logic;
        E       : out FLOAT_POINT_TYPE     --RECORD FIELD ��ü�� �ǿ����ڿ� ����.
        );
end RECORD_example2;

architecture Behavioral of RECORD_example2 is

begin
    process(Si, Ex, Fr)
        variable F : FLOAT_POINT_TYPE;      --RECORD FIELD ��ü�� �ǿ����ڿ� ����.
     begin
        F.Sign      := Si;
        F.Exponent  := Ex;
        F.Fraction  := Fr;
    end process;
    
    process(A, F1, F2)
    begin
        if( F1 = F2) then
            D <= A;
            E <= F1;
        else
            D <= B;
            E <= F2;
        end if;
     end process;
end Behavioral;

--    11. �Ǽ���(Floating Point Type)
--    �ռ��� ���� ȸ�ο��� ��� �Ұ���.
--    ���� ������ ���� �𵨸������� ���.
--    ǥ�������� -1.0��1038���� 1.0��1038�����̸�, �� ǥ�� ������ �̸� ���ǵ� �ε��Ҽ�����.
--    ��) type Real_number is range -1.0E38 to 1.0E38;
    
    
--    12. �Ҵ����(Boolean Type)
--    ���� ���� ������ ��Ÿ���� ������ ����.
--    �� ���¸� ��Ÿ���� 0, 1���� �ٸ� �ǹ�.
--    ��) type boolean_type is (false, true);transport

entity BOOL is 
    port(TRUE_FALSE : in boolean;
         O         : out bit);
end entity BOOL;

architecture behavioral of BOOL is
begin
    O <= '1' when (TRUE_FALSE) else '0';
end behavioral;















