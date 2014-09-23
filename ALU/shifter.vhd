library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter is
    Port ( data_in	: in	STD_LOGIC_VECTOR (31 downto 0);	--	data_in(31) is MSB
           sel			: in	STD_LOGIC_VECTOR (4 downto 0);	--	sel(0) = '1' means shift by 1 bit
           left		: in	STD_LOGIC;								--	left = '1' means shift left
           arith		: in	STD_LOGIC;								--	arith = '1' means arithmetic shift
           data_out	: out	STD_LOGIC_VECTOR (31 downto 0));	--	data_out(31) is MSB
end shifter;

architecture Combi_Cascade of shifter is	--	200 MHz => 5ns clock periods (delay should be < 5ns)

begin
	process(data_in, sel, left, arith)
		variable dat1	: std_logic_vector (31 downto 0);	--	Result out of 1-bit shifter
		variable dat2	: std_logic_vector (31 downto 0);	--	Result out of 2-bit shifter
		variable dat4	: std_logic_vector (31 downto 0);	--	Result out of 4-bit shifter
		variable dat8	: std_logic_vector (31 downto 0);	--	Result out of 8-bit shifter
		variable dat16	: std_logic_vector (31 downto 0);	--	Result out of 16-bit shifter
	begin
--========================1-bit shifter========================
	--	LSBs
		for i in 0 to 0 loop
			if		(sel(0) = '1' AND left = '0' AND arith = '0') OR
					(sel(0) = '1' AND left = '0' AND arith = '1') then
				dat1(i) := data_in(i+1);	--	Shift right
			elsif	(sel(0) = '1' AND left = '1' AND arith = '0') OR
					(sel(0) = '1' AND left = '1' AND arith = '1') then
				dat1(i) := '0';				--	Fill with zeros
			else
				dat1(i) := data_in(i);
			end if; 
		end loop;
	--	Middle
		for i in 1 to 30 loop
			if		(sel(0) = '1' AND left = '0' AND arith = '0') OR
					(sel(0) = '1' AND left = '0' AND arith = '1') then
				dat1(i) := data_in(i+1);	--	Shift right
			elsif	(sel(0) = '1' AND left = '1' AND arith = '0') OR
					(sel(0) = '1' AND left = '1' AND arith = '1') then
				dat1(i) := data_in(i-1);	--	Shift left
			else
				dat1(i) := data_in(i);
			end if;
		end loop;
	--	MSBs
		for i in 31 to 31 loop
			if		(sel(0) = '1' AND left = '0' AND arith = '0') then
				dat1(i) := '0';				--	Shift in zeros	(Logical)
			elsif	(sel(0) = '1' AND left = '0' AND arith = '1') then
				dat1(i) := data_in(31);		--	Duplicate MSB	(Arithmetic)
			elsif	(sel(0) = '1' AND left = '1' AND arith = '0') OR
					(sel(0) = '1' AND left = '1' AND arith = '1') then
				dat1(i) := data_in(i-1);	--	Shift left
			else
				dat1(i) := data_in(i);
			end if;
		end loop;
--========================2-bit shifter========================
	--	LSBs
		for i in 0 to 1 loop
			if		(sel(1) = '1' AND left = '0' AND arith = '0') OR
					(sel(1) = '1' AND left = '0' AND arith = '1') then
				dat2(i) := dat1(i+2);		--	Shift right
			elsif	(sel(1) = '1' AND left = '1' AND arith = '0') OR
					(sel(1) = '1' AND left = '1' AND arith = '1') then
				dat2(i) := '0';				--	Fill with zeros
			else
				dat2(i) := dat1(i);
			end if;
		end loop;
	--	Middle
		for i in 2 to 29 loop
			if		(sel(1) = '1' AND left = '0' AND arith = '0') OR
					(sel(1) = '1' AND left = '0' AND arith = '1') then
				dat2(i) := dat1(i+2);		--	Shift right
			elsif	(sel(1) = '1' AND left = '1' AND arith = '0') OR
					(sel(1) = '1' AND left = '1' AND arith = '1') then
				dat2(i) := dat1(i-2);		--	Shift left
			else
				dat2(i) := dat1(i);
			end if;
		end loop;
	--	MSBs
		for i in 30 to 31 loop
			if		(sel(1) = '1' AND left = '0' AND arith = '0') then
				dat2(i) := '0';				--	Shift in zeros	(Logical)
			elsif	(sel(1) = '1' AND left = '0' AND arith = '1') then
				dat2(i) := dat1(31);			--	Duplicate MSB	(Arithmetic)
			elsif	(sel(1) = '1' AND left = '1' AND arith = '0') OR
					(sel(1) = '1' AND left = '1' AND arith = '1') then
				dat2(i) := dat1(i-2);		--	Shift left
			else
				dat2(i) := dat1(i);
			end if;
		end loop;
--========================4-bit shifter========================
	--	LSBs
		for i in 0 to 3 loop
			if		(sel(2) = '1' AND left = '0' AND arith = '0') OR
					(sel(2) = '1' AND left = '0' AND arith = '1') then
				dat4(i) := dat2(i+4);		--	Shift right
			elsif	(sel(2) = '1' AND left = '1' AND arith = '0') OR
					(sel(2) = '1' AND left = '1' AND arith = '1') then
				dat4(i) := '0';				--	Fill with zeros
			else
				dat4(i) := dat2(i);
			end if;
		end loop;
	--	Middle
		for i in 4 to 27 loop
			if		(sel(2) = '1' AND left = '0' AND arith = '0') OR
					(sel(2) = '1' AND left = '0' AND arith = '1') then
				dat4(i) := dat2(i+4);		--	Shift right
			elsif	(sel(2) = '1' AND left = '1' AND arith = '0') OR
					(sel(2) = '1' AND left = '1' AND arith = '1') then
				dat4(i) := dat2(i-4);		--	Shift left
			else
				dat4(i) := dat2(i);
			end if;
		end loop;
	--	MSBs
		for i in 28 to 31 loop
			if		(sel(2) = '1' AND left = '0' AND arith = '0') then
				dat4(i) := '0';				--	Shift in zeros	(Logical)
			elsif	(sel(2) = '1' AND left = '0' AND arith = '1') then
				dat4(i) := dat2(31);			--	Duplicate MSB	(Arithmetic)
			elsif	(sel(2) = '1' AND left = '1' AND arith = '0') OR
					(sel(2) = '1' AND left = '1' AND arith = '1') then
				dat4(i) := dat2(i-4);		--	Shift left
			else
				dat4(i) := dat2(i);
			end if;
		end loop;
--========================8-bit shifter========================
	--	LSBs
		for i in 0 to 7 loop
			if		(sel(3) = '1' AND left = '0' AND arith = '0') OR
					(sel(3) = '1' AND left = '0' AND arith = '1') then
				dat8(i) := dat4(i+8);		--	Shift right
			elsif	(sel(3) = '1' AND left = '1' AND arith = '0') OR
					(sel(3) = '1' AND left = '1' AND arith = '1') then
				dat8(i) := '0';				--	Fill with zeros
			else
				dat8(i) := dat4(i);
			end if;
		end loop;
	--	Middle
		for i in 8 to 23 loop
			if		(sel(3) = '1' AND left = '0' AND arith = '0') OR
					(sel(3) = '1' AND left = '0' AND arith = '1') then
				dat8(i) := dat4(i+8);		--	Shift right
			elsif	(sel(3) = '1' AND left = '1' AND arith = '0') OR
					(sel(3) = '1' AND left = '1' AND arith = '1') then
				dat8(i) := dat4(i-8);		--	Shift left
			else
				dat8(i) := dat4(i);
			end if;
		end loop;
	--	MSBs
		for i in 24 to 31 loop
			if		(sel(3) = '1' AND left = '0' AND arith = '0') then
				dat8(i) := '0';				--	Shift in zeros	(Logical)
			elsif	(sel(3) = '1' AND left = '0' AND arith = '1') then
				dat8(i) := dat4(31);			--	Duplicate MSB	(Arithmetic)
			elsif	(sel(3) = '1' AND left = '1' AND arith = '0') OR
					(sel(3) = '1' AND left = '1' AND arith = '1') then
				dat8(i) := dat4(i-8);		--	Shift left
			else
				dat8(i) := dat4(i);
			end if;
		end loop;
--========================16-bit shifter========================
--	LSBs
		for i in 0 to 15 loop
			if		(sel(4) = '1' AND left = '0' AND arith = '0') OR
					(sel(4) = '1' AND left = '0' AND arith = '1') then
				dat16(i) := dat8(i+16);		--	Shift right
			elsif	(sel(4) = '1' AND left = '1' AND arith = '0') OR
					(sel(4) = '1' AND left = '1' AND arith = '1') then
				dat16(i) := '0';				--	Fill with zeros
			else
				dat16(i) := dat8(i);
			end if;
		end loop;
--	MSBs
		for i in 16 to 31 loop
			if		(sel(4) = '1' AND left = '0' AND arith = '0') then
				dat16(i) := '0';				--	Shift in zeros	(Logical)
			elsif	(sel(4) = '1' AND left = '0' AND arith = '1') then
				dat16(i) := dat8(31);		--	Duplicate MSB	(Arithmetic)
			elsif	(sel(4) = '1' AND left = '1' AND arith = '0') OR
					(sel(4) = '1' AND left = '1' AND arith = '1') then
				dat16(i) := dat8(i-16);		--	Shift left
			else
				dat16(i) := dat8(i);
			end if;
		end loop;
		
		data_out <= dat16;
		
	end process;
end Combi_Cascade;