----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/07 14:32:43
-- Design Name: 
-- Module Name: DEF_CONST_PKG - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;    --ieee library���� std_logic_1164 package ���
use ieee.std_logic_arith.all;   --ieee library���� std_logic_arith package ���

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package DEF_CONST_PKG is
    constant width : integer := 8;
    constant No_MSBs : integer; --No MSB ��� ���� �̷��
    function AND_MSBs (A : unsigned(width - 1 downto 0)) return std_logic;
end package DEF_CONST_PKG;

package body DEF_CONST_PKG is
    -- ���� No_MSBs ��� ����
    constant No_MSBs : integer := 3;   
    function AND_MSBs (A : unsigned(width -1 downto 0)) return std_logic is 
    variable V : std_logic;
    
    begin
        V := '1';
        
        for N in 7 downto 8 - No_MSBs loop
            V := V and A(N);
        end loop;
        
        return V;
    end function AND_MSBs;
end package body DEF_CONST_PKG;

-- package <Package �̸�> is
--      {<����> (type, component, function, procedure ����)}
-- end package <Package �̸�>;

-- package body <Package �̸�> is
--      {<���۱����>}
-- end package body <Package �̸�>;


-- Function �� Procedure
-- �����(Declaration Part)
-- function <Function �̸�> (<�Ű����� ���>) return <��������>;

-- ��ü��(Body Part)
-- function <Function �̸�> (<�Ű����� ���>) return <��������> is
--  {<����>}
-- begin
-- {<������>}
-- end function <Function �̸�>;