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
			  clk : in std_logic;
           result1 : out  STD_LOGIC_VECTOR (31 downto 0);
           result2 : out  STD_LOGIC_VECTOR (31 downto 0);
           enable : in  STD_LOGIC);
end mult;


architecture Behavioral of mult is
signal a_reg :  std_logic_vector(31 downto 0);
signal b_reg :  std_logic_vector(31 downto 0);
signal c_reg :  std_logic_vector(63 downto 0);
signal busy : std_logic:= '0';

begin
--	 shifter1: entity work.shifter(combi_cascade)
--    port map(
--        data_in=> c_reg(63 downto 32),			-- : in	STD_LOGIC_VECTOR (31 downto 0);	--	data_in(31) is MSB
--		  sel=> "00001",           	--	: in	STD_LOGIC_VECTOR (4 downto 0);	--	sel(0) = '1' means shift by 1 bit
--		  left=> '0',           	--	: in	STD_LOGIC;								--	left = '1' means shift left
--		  arith=> '0',           --	: in	STD_LOGIC;								--	arith = '1' means arithmetic shift
--        data_out =>c_reg    --	: out	STD_LOGIC_VECTOR (31 downto 0));	--	data_out(31) is MSB
--    );
--	 shifter2: entity work.shifter(combi_cascade)
--    port map(
--        data_in=> c_reg(31 downto 0),			-- : in	STD_LOGIC_VECTOR (31 downto 0);	--	data_in(31) is MSB
--		  sel=> "00001",           	--	: in	STD_LOGIC_VECTOR (4 downto 0);	--	sel(0) = '1' means shift by 1 bit
--		  left=> '0',           	--	: in	STD_LOGIC;								--	left = '1' means shift left
--		  arith=> '0',           --	: in	STD_LOGIC;								--	arith = '1' means arithmetic shift
--        data_out =>c_reg    --	: out	STD_LOGIC_VECTOR (31 downto 0));	--	data_out(31) is MSB
--    );	 
	process(clk)
	begin
-- load new arguments when rising, notbusy, and enabled
		if rising_edge(clk) then
			if busy='0' then
				if enable='1' then
					a_reg<=op1;
					b_reg<=op2;
				end if;
			end if;		
		end if;
	
	end process;
	
	--mult algorithm
	process(a_reg,b_reg)
	begin
		c_reg(31 downto 0)<=b_reg;
		busy<='1';
		for I in 1 to 32 loop
		if c_reg(0) ='1' then	--check b_0.
			c_reg(63 downto 32) <= a_reg + c_reg(63 downto 32); --add op1 to high bits
			c_reg<=std_logic_vector(unsigned(c_reg)/2);--shift c-reg

		else
			c_reg<=std_logic_vector(unsigned(c_reg)/2);--shift c-reg
		end if;
		end loop;
		
		result1<=c_reg(31 downto 0);
		result2<=c_reg(63 downto 32);
		busy<='0';
	end process;


end Behavioral;
