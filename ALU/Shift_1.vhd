----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:53:42 09/17/2014 
-- Design Name: 
-- Module Name:    Shift_1 - Combinational 
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

entity Shift_1 is
    Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end Shift_1;

architecture Combinational of Shift_1 is

begin
	process(sel,input)
	begin
		
		if (sel = '0') then
			output <= input;
		else	--	Shift right by 1
			for i in 0 to 30 loop
			output(i) <= input(i+1);
			end loop;
		end if;
	end process;
end Combinational;

