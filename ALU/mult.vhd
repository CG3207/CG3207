----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:50:21 09/17/2014 
-- Design Name: 
-- Module Name:    mult - Behavioral 
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mult is
    Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           result1 : out  STD_LOGIC_VECTOR (31 downto 0);
           result2 : out  STD_LOGIC_VECTOR (31 downto 0);
           enable : in  STD_LOGIC);
end mult;

architecture Behavioral of mult is

begin
	process(enable,op1,op2)
	variable result_64 :  std_logic_vector (64 downto 0):= (others=>'0');

	begin
		if enable='1' then

			result_64(31 downto 0) := op2;
			
			for I in 1 to 32 loop
			if result_64(0)='1' then
					result_64(64 downto 32) := op1 + result_64(64 downto 32); --add op1 to high side
					result_64 := std_logic_vector(to_unsigned(result_64) srl natural(1));
			else
				result_64 := std_logic_vector(to_unsigned(result_64) srl natural(1));
			end if;
			end loop;
			
			result1 <= result_64(31 downto 0);
			result2 <= result_64(63 downto 32);
			 
		else
			 result1 <= (others=>'0');
			 result2 <= (others=>'0');
		end if;
	end process;


end Behavioral;

--library IEEE;
--use IEEE.std_logic_1164.all;
--
--entity mul32c is  -- 32 x 32 = 64 bit unsigned product multiplier
--  port(a    : in  std_logic_vector(31 downto 0);  -- multiplicand
--       b    : in  std_logic_vector(31 downto 0);  -- multiplier
--       prod : out std_logic_vector(63 downto 0)); -- product
--end mul32c;
--
--architecture circuits of mul32c is
--  signal zero : std_logic_vector(31 downto 0) := X"00000000";
--  signal nc1  : std_logic;
--  type arr32 is array(0 to 31) of std_logic_vector(31 downto 0);
--  signal s    : arr32; -- partial sums
--  signal c    : arr32; -- partial carries
--  signal ss   : arr32; -- shifted sums
--
--  component add32csa is  -- duplicate entity port
--    port(b       : in  std_logic;
--         a       : in  std_logic_vector(31 downto 0);
--         sum_in  : in  std_logic_vector(31 downto 0);
--         cin     : in  std_logic_vector(31 downto 0);
--         sum_out : out std_logic_vector(31 downto 0);
--         cout    : out std_logic_vector(31 downto 0));
--  end component add32csa;
--  component add32 -- duplicate entity port
--    port(a    : in  std_logic_vector(31 downto 0);
--         b    : in  std_logic_vector(31 downto 0);
--         cin  : in  std_logic; 
--         sum  : out std_logic_vector(31 downto 0);
--         cout : out std_logic);
--  end component add32;
--begin  -- circuits of mul32c
--  st0: add32csa port map(b(0), a, zero , zero, s(0), c(0));  -- CSA stage
--  ss(0) <= '0'&s(0)(31 downto 1) after 1 ns;
--  prod(0) <= s(0)(0) after 1 ns;
--
--  stage: for I in 1 to 31 generate
--    st: add32csa port map(b(I), a, ss(I-1) , c(I-1), s(I), c(I));  -- CSA stage
--    ss(I) <= '0'&s(I)(31 downto 1) after 1 ns;
--    prod(I) <= s(I)(0) after 1 ns;
--  end generate stage;
--  
--  add: add32 port map(ss(31), c(31), '0' , prod(63 downto 32), nc1);  -- adder
--end architecture circuits; -- of mul32c
