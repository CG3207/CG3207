--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:38:28 09/23/2014
-- Design Name:   
-- Module Name:   Z:/git/CG3207/ALU/FULL_ADD_SUB_TEST.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FULL_ADD_SUB
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
 
ENTITY FULL_ADD_SUB_TEST IS
END FULL_ADD_SUB_TEST;
 
ARCHITECTURE behavior OF FULL_ADD_SUB_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FULL_ADD_SUB
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Binv : IN  std_logic;
         C_in : IN  std_logic;
         S : OUT  std_logic_vector(31 downto 0);
         TEST : OUT  std_logic_vector(31 downto 0);
         C_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal Binv : std_logic := '0';
   signal C_in : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(31 downto 0);
   signal TEST : std_logic_vector(31 downto 0);
   signal C_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FULL_ADD_SUB PORT MAP (
          A => A,
          B => B,
          Binv => Binv,
          C_in => C_in,
          S => S,
          TEST => TEST,
          C_out => C_out
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

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
