----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 15:30:30
-- Design Name: 
-- Module Name: BLACK_BOX - Behavioral
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
--    1. VHDL�� ǥ��(Expression)
--    Y <= A + B + C
--    Operator : +,-
--    Operand : A, B, C
    
--    2. �ǿ�����(Operand)
--    1) ���ڿ� ���ͷ�(String Literals)
--    - ���ڿ� ���ͷ��� �Ϸ��� ������ �׷��� �ǹ�
--    ex) "ABC"
--    - ���� ��Ʈ : '1', '0;
--    - ��Ʈ�� ���ͷ� : B"1100", 0"15", X"BF" (2��, 8��, 16��)
--    2) ���� ���ͷ�(Numeric Literals)
--    ex) 1234, 2#1010_1111#, 8#132#, 16#FF#
--        16#F.01#E+2 : 15.00390625 �� 162
--        12 ft : �Ÿ� 12 ft
--        3 kohm : ���� 3K��
        
--    3. �ǿ����� ����(Operand Declaration Statement)
--    ���� : ���(constant), ��������(Type), ��ü(Object),�������α׷�(Subprogram) ���� �����ϴµ� ���
--         ��� : ���� ���ͷ�, ���ڿ� ���ͷ�
--         �������� : �迭, ���ڵ�
--         ��ü : ����(Variable), ��ȣ(Signal), �ܺ� ������Ʈ(Component)
--    �������α׷� : �Լ�(Function), ���ν���(procedure)
    
--    4. ����ó����(Concurrent Statement)
--    �ϳ��� Architecture�� �������� Process���� �ִٸ�, ������ Process���� ���ÿ� ���ķ� �����ϴ� ����� �ȴ�.
    
--    5. ����ó����(Sequential Statement)
--    ����� ������� �����.
--    �׻� Process, �Լ�, ���ν������� ������. 
    
--    6. ����(variable) �� ��ȣ(signal)
--    ���� : ���μ���, �Լ�, ���ν����� ���� �������α׷� �������� ���𰡴��� ������
--           ���� �Ҵ� �ÿ� �Ҵ�� ���ÿ� ��� ���� ����.
--    ��ȣ : Entity, Architecture, Package, Block���� ����.
--          Port�� ���� ���� �Ҵ� �ÿ� ���� ���� �Ŀ� ���� ���ŵȴ�.
          
--        -- ���� ����
--        variable ������ �̸��� : ������������ := ���ʱⰪ��
--        -- ���� �Ҵ�
--        ������ �̸��� := ���Ҵ簪��
        
--        -- ��ȣ ����
--        signal ����ȣ �̸��� : ������������ := ���ʱⰪ��
--        -- ��ȣ �Ҵ�
--        ����ȣ �̸��� <= ���Ҵ簪��
    
--    ������ ��ȣ�� �Ҵ��� ������ ���� ��� ����� �� �ִ�.
--    �׷��� ������ ���� ������ ���� ������ ������ ����ϴ� ���� ����.
--     - �ùķ��̼��� ������.
--     - �ռ������ ������ ȸ�θ� ���� ������ �� �ִ�.

entity BLACK_BOX is
    Port (A, B, C : in  std_logic;
          D       : out std_logic);
end BLACK_BOX;

architecture Behavioral of BLACK_BOX is
begin
    process(A, B, C)    --Sensitive List
    -- ���� ����
    variable Temp : std_logic;
    begin
        Temp := A and B;           --����
        D <= Temp or C after 1 ns; -- ��ȣ -- �����ð� 1 ns�� �ռ� �ÿ� ������� ����. �ùķ��̼ǿ����� �����ð� ��������
    end process;
end Behavioral;
