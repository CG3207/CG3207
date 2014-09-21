--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:58:22 09/21/2014
-- Design Name:   
-- Module Name:   C:/Users/jw/Dropbox/EE4/CG3207/LAB/lab2/ALU/testnor32.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: nornot_32
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
 
ENTITY testnor32 IS
END testnor32;
 
ARCHITECTURE behavior OF testnor32 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nornot_32
    PORT(
         op1 : IN  std_logic_vector(31 downto 0);
         op2 : IN  std_logic_vector(31 downto 0);
         enable : IN  std_logic;
         result1 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal op2 : std_logic_vector(31 downto 0) := (others => '0');
   signal enable : std_logic := '0';

 	--Outputs
   signal result1 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nornot_32 PORT MAP (
          op1 => op1,
          op2 => op2,
          enable => enable,
          result1 => result1
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

--      wait for <clock>_period*10;
      -- insert stimulus here 
		op1<= (others=>'0');
		op2<= (others=>'0');
		enable<='1';
      wait for 100 ns;	

		op1<= (others=>'0');
		op2<= (others=>'1');
      wait for 100 ns;	

		op1<= (others=>'1');
		op2<= (others=>'0');
      wait for 100 ns;	

		op1<= (others=>'1');
		op2<= (others=>'1');
      wait for 100 ns;	

      wait;
   end process;

END;
