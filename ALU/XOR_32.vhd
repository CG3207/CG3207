----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:04:21 09/17/2014 
-- Design Name: 
-- Module Name:    XOR_32 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity XOR_32 is
    Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           result1 : out  STD_LOGIC_VECTOR (31 downto 0);
           enable : in  STD_LOGIC);
end XOR_32;

architecture Behavioral of XOR_32 is

begin
process(enable,op1,op2)
begin
	if enable='1' then
	 result1<= op1 AND op2;
	 else
	 result1<= (others=>'0');
	end if;
end process;

end Behavioral;

