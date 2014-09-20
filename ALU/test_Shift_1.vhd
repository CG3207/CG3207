--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:20:04 09/20/2014
-- Design Name:   
-- Module Name:   C:/Users/Dashe/Desktop/CG3207/Git/ALU/test_Shift_1.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Shift_1
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_Shift_1 IS
END test_Shift_1;
 
ARCHITECTURE behavior OF test_Shift_1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Shift_1
    PORT(
         input		: in	STD_LOGIC_VECTOR (31 downto 0);
			sel		: in	STD_LOGIC;
			dir		: in	STD_LOGIC;	--	'0' means left, '1' means right
			output	: out	STD_LOGIC_VECTOR (31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input	: std_logic_vector(31 downto 0) := (others => '0');
   signal sel		: std_logic := '0';
	signal dir		: std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Shift_1 PORT MAP (
          input => input,
          sel => sel,
			 dir => dir,
          output => output
        );

   -- Stimulus process
   stim_proc: process
   begin
		
		sel <= '0';			--	Disabled
		dir <= '0';			--	Shift left
		input(3) <= '1';	--	4th bit '1'
		wait for 100 ns;
		sel <= '1';			--	Enable
		dir <= '0';			--	Shift left by 1
		wait for 100 ns;
		sel <= '0';			--	Disable
		wait for 100 ns;
		sel <= '1';			--	Enable
		dir <= '1';			--	Shift right by 1
		wait for 100 ns;
		sel <= '0';			--	Disable
		
      wait;
   end process;

END;
