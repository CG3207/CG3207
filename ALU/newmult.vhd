----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:33:19 09/22/2014 
-- Design Name: 
-- Module Name:    newmult - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity newmult is
    Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           result1 : out  STD_LOGIC_VECTOR (31 downto 0);
           result2 : out  STD_LOGIC_VECTOR (31 downto 0));
end newmult;

architecture Behavioral of newmult is
signal result_64 : std_logic_vector ( 63 downto 0);
signal a : std_logic_vector ( 31 downto 0);
signal b : std_logic_vector ( 31 downto 0);
begin
	
		process(clk,enable)
		variable op2_tmp : std_logic_vector ( 31 downto 0 );
		begin
			if	rising_edge(clk) then
				a<=op1;
				b<=op2;
				if enable='1' then
					result_64 <= a * b;
					result1<=result_64(31 downto 0);
					result2<=result_64(63 downto 32);
				end if;			
			end if;
		end process;

end Behavioral;

