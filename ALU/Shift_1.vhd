library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Shift_1 is
    Port ( input	: in	STD_LOGIC_VECTOR (31 downto 0);	--	input(0) is LSB
           sel		: in	STD_LOGIC;
			  dir		: in	STD_LOGIC;	--	'0' means left, '1' means right
           output	: out	STD_LOGIC_VECTOR (31 downto 0));
end Shift_1;

architecture Combinational of Shift_1 is

begin
	process(input, sel, dir)	--	Needs Arithmetic/logical selection input in future
	begin
		if (sel = '0') then
			output <= input;
		else	--	Enabled shift
			if (dir = '1') then	--	Shift right
				for i in 0 to 30 loop
				output(i) <= input(i+1);
				end loop;
			else	--	(dir = '0') -- Shift left
				for i in 31 downto 1 loop
				output(i) <= input(i-1);
				end loop;
			end if;
		end if;
	end process;
end Combinational;

