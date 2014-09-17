----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:59:36 09/17/2014 
-- Design Name: 
-- Module Name:    ADD_SUB - ADD_SUB_ARCH 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADD_SUB is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
	     Binv : in  STD_LOGIC;
	     C_in: in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (31 downto 0);
           C_out : out  STD_LOGIC
           );
end ADD_SUB;

architecture ADD_SUB_ARCH of ADD_SUB is
signal S_wider : std_logic_vector(31 downto 0);
begin

	S_wider <= ('0'& A) + ('0'& B) + C_in;
	S <= S_wider(31 downto 0);
	C_out <= S_wider(32);

end ADD_SUB_ARCH;

