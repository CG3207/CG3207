----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:27:57 09/23/2014 
-- Design Name: 
-- Module Name:    FULL_ADD_SUB - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FULL_ADD_SUB is
generic (N : integer := 32);
    Port ( A : in  STD_LOGIC_VECTOR (N-1 downto 0);
           B : in  STD_LOGIC_VECTOR (N-1 downto 0);
	     Binv : in  STD_LOGIC;
	     C_in: in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (N-1 downto 0);
	     TEST : out  STD_LOGIC_VECTOR (N-1 downto 0);
           C_out : out  STD_LOGIC
           );
end FULL_ADD_SUB;

architecture Behavioral of FULL_ADD_SUB is

signal ADDER_0_A: std_logic_vector (7 downto 0) := std_logic_vector(to_unsigned(0,8));
signal ADDER_0_B: std_logic_vector (7 downto 0) := std_logic_vector(to_unsigned(0,8));
signal ADDER_0_SUM: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_0_CARRY_IN: std_logic := '0';
signal ADDER_0_CARRY_OUT: std_logic := '0';
signal ADDER_0_TEST: std_logic_vector (7 downto 0) := (others=>'0');

signal ADDER_1_A: std_logic_vector (7 downto 0) := std_logic_vector(to_unsigned(0,8));
signal ADDER_1_B: std_logic_vector (7 downto 0) := std_logic_vector(to_unsigned(0,8));
signal ADDER_1_SUM: std_logic_vector (7 downto 0) := (others=>'0');
signal ADDER_1_CARRY_IN: std_logic := '0';
signal ADDER_1_CARRY_OUT: std_logic := '0';
signal ADDER_1_TEST: std_logic_vector (7 downto 0) := (others=>'0');

signal TOADD_A : std_logic_vector (15 downto 0) := std_logic_vector(to_signed(50,16));
signal TOADD_B : std_logic_vector (15 downto 0) := std_logic_vector(to_signed(-300,16));
signal TOADD_CARRY_IN : std_logic := '0';
signal TOADD_BINV : std_logic := '0';

begin

u_ADDER_0: entity work.CLA_ADD_SUB(CLA_ADD_SUB_ARCH)
    port map(
           A => ADDER_0_A,
           B => ADDER_0_B,
	     Binv => TOADD_BINV,
	     C_in => ADDER_0_CARRY_IN,
           S => ADDER_0_SUM,
	     TEST => ADDER_0_TEST,
           C_out => ADDER_0_CARRY_OUT
    );
    
u_ADDER_1: entity work.CLA_ADD_SUB(CLA_ADD_SUB_ARCH)
    port map(
           A => ADDER_1_A,
           B => ADDER_1_B,
	     Binv => TOADD_BINV,
	     C_in => TOADD_BINV xor ADDER_0_CARRY_OUT,
           S => ADDER_1_SUM,
	     TEST => ADDER_1_TEST,
           C_out => ADDER_1_CARRY_OUT
    );

ADDER_0_A <= TOADD_A(7 downto 0);
ADDER_0_B <= TOADD_B(7 downto 0);
ADDER_0_CARRY_IN <= TOADD_CARRY_IN;

ADDER_1_A <= TOADD_A(15 downto 8);
ADDER_1_B <= TOADD_B(15 downto 8);

S <= "11111111" 
	& "11111111"
	--& "00000000"
	& ADDER_1_SUM
	& ADDER_0_SUM;

--http://stackoverflow.com/questions/25999296/vhdl-cla-subtractor-module-cascade/25999820#25999820
--If i pass in -250, it cannot figure out
	
C_out <= ADDER_1_CARRY_OUT;

end Behavioral;

