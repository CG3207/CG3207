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
use IEEE.numeric_std.all;

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
	     Binv : in  STD_LOGIC; --'1' means a-b , '0' = a+b
	     C_in: in  STD_LOGIC;	--carry in
           S : out  STD_LOGIC_VECTOR (31 downto 0); --sum
           C_out : out  STD_LOGIC
           );
end ADD_SUB;

architecture ADD_SUB_ARCH of ADD_SUB is
signal S_wider : std_logic_vector(32 downto 0);
begin

--Perform OP (WORKS)
process (A,B,C_in,Binv)
        variable X,Y,Z: std_logic_vector (33 downto 0);
    begin
        X := A(31) & A & '1'; -- We had 1 here so if C_in was added, it would get carried over to Z(1)
	  
        if Binv = '0' then
            Y := B(31) & B & C_in;
        elsif Binv = '1' then
            Y := not B(31) & not B & not C_in;
        else 
            Y := (others => 'X');
        end if;

        Z := std_logic_vector( unsigned(X) + unsigned(Y));

        C_out <= Z(33);
        S <= Z(32 downto 1); -- Ignore the last bit, it was only used for the carry

end process;


end ADD_SUB_ARCH;

