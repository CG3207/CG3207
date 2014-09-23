----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:57:00 09/22/2014 
-- Design Name: 
-- Module Name:    CLA_ADD_SUB - CLA_ADD_SUB_ARCH 
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

entity CLA_ADD_SUB is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
	     Binv : in  STD_LOGIC;
	     C_in: in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (31 downto 0);
	     TEST : out  STD_LOGIC_VECTOR (31 downto 0);
           C_out : out  STD_LOGIC
           );
end CLA_ADD_SUB;

architecture CLA_ADD_SUB_ARCH of CLA_ADD_SUB is

SIGNAL    h_sum              :    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL    carry_generate     :    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL    carry_propagate    :    STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL    carry_in_internal  :    STD_LOGIC_VECTOR(31 DOWNTO 1);

signal S_wider : std_logic_vector(32 downto 0);

begin

	-- Sum, P and G
	h_sum <= A XOR B;
	carry_generate <= A AND B;
	carry_propagate <= A OR B;
	
	PROCESS (carry_generate,carry_propagate,carry_in_internal)
	BEGIN
		carry_in_internal(1) <= carry_generate(0) OR (carry_propagate(0) AND C_in);
		inst: FOR i IN 1 TO 30 LOOP
			carry_in_internal(i+1) <= carry_generate(i) OR (carry_propagate(i) AND carry_in_internal(i));
		END LOOP;
		C_out <= carry_generate(31) OR (carry_propagate(31) AND carry_in_internal(31));
	END PROCESS;

	S(0) <= h_sum(0) XOR C_in;
	S(31 DOWNTO 1) <= h_sum(31 DOWNTO 1) XOR carry_in_internal(31 DOWNTO 1);

--process (A,B,C_in,Binv)
--        variable X,Y,Z: std_logic_vector (33 downto 0);
--    begin
--        X := A(31) & A & '1'; -- We had 1 here so if C_in was added, it would get carried over to Z(1)
--	  
--        if Binv = '0' then
--            Y := B(31) & B & C_in;
--        elsif Binv = '1' then
--            Y := not B(31) & not B & not C_in;
--        else 
--            Y := (others => 'X');
--        end if;
--
--        Z := std_logic_vector( unsigned(X) + unsigned(Y));
--
--        C_out <= Z(33);
--        S <= Z(32 downto 1); -- Ignore the last bit, it was only used for the carry
--end process;

end CLA_ADD_SUB_ARCH;

