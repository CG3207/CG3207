LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY test_shifter IS
END test_shifter;
 
ARCHITECTURE behavior OF test_shifter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shifter
    PORT(
         data_in : IN  std_logic_vector(31 downto 0);
         sel : IN  std_logic_vector(4 downto 0);
         left : IN  std_logic;
         arith : IN  std_logic;
         data_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data_in : std_logic_vector(31 downto 0) := (others => '0');
   signal sel : std_logic_vector(4 downto 0) := (others => '0');
   signal left : std_logic := '0';
   signal arith : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shifter PORT MAP (
          data_in => data_in,
          sel => sel,
          left => left,
          arith => arith,
          data_out => data_out
        );

   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for 100 ns;
		data_in <= "11110101000101111111111111111101";
		
		--	Shift right logical (0 to 31 bits)
		for i in 0 to 31 loop
			wait for 100 ns;
			arith <= '0';		--	Logical
			left <= '0';		--	Right
			sel <= std_logic_vector(to_unsigned(i, sel'length));
		end loop;
		
		--	Shift left logical (0 to 31 bits)
		for i in 0 to 31 loop
			wait for 100 ns;
			arith <= '0';		--	Logical
			left <= '1';		--	Right
			sel <= std_logic_vector(to_unsigned(i, sel'length));
		end loop;
				
		--	Shift right arithmetic (0 to 31 bits)
		for i in 0 to 31 loop
			wait for 100 ns;
			arith <= '1';		--	Logical
			left <= '0';		--	Right
			sel <= std_logic_vector(to_unsigned(i, sel'length));
		end loop;			
		
		--	Shift left arithmetic (0 to 31 bits)
		for i in 0 to 31 loop
			wait for 100 ns;
			arith <= '1';		--	Logical
			left <= '1';		--	Right
			sel <= std_logic_vector(to_unsigned(i, sel'length));
		end loop;
		wait for 100 ns;
		
		--	No shifting
		sel <= "00000";
		
--	Simulate for 13 us more
		
      wait;
   end process;

END;