--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:58:01 09/22/2014
-- Design Name:   
-- Module Name:   C:/Users/jw/Dropbox/EE4/CG3207/LAB/LAB2_joey/testnewmult.vhd
-- Project Name:  LAB2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: newmult
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testnewmult IS
END testnewmult;
 
ARCHITECTURE behavior OF testnewmult IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT newmult
    PORT(
         op1 : IN  std_logic_vector(31 downto 0);
         op2 : IN  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         enable : IN  std_logic;
         result1 : OUT  std_logic_vector(31 downto 0);
         result2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal op2 : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal enable : std_logic := '0';

 	--Outputs
   signal result1 : std_logic_vector(31 downto 0);
   signal result2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: newmult PORT MAP (
          op1 => op1,
          op2 => op2,
          clk => clk,
          enable => enable,
          result1 => result1,
          result2 => result2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 
		enable<='1';
		op1<= std_logic_vector(to_unsigned(10,32));
		op2<= std_logic_vector(to_unsigned(11,32));
		
		wait for 100 ns;	
		
		
		
      wait;
   end process;

END;
