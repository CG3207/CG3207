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


architecture mult_arch of mult is
type state_type is (idle,load,doing,done);
signal state,n_state:state_type;

signal r64 :  std_logic_vector(63 downto 0);
signal carry_reg :  std_logic;
signal add_rslt :  std_logic_vector(31 downto 0);
signal shift_rslt :  std_logic_vector(63 downto 0);
signal busy : std_logic:= '0';
signal shiftright : std_logic_vector (4 downto 0);
signal mult_cnt : unsigned(4 downto 0);

begin

	 adder1: entity work.ADD_SUB(ADD_SUB_ARCH)
    port map(
        A=>op1						,
		  B=>r64(63 downto 32)	, 
		  Binv=>'0'					,			 	--'1' means a-b , '0' = a+b
		  C_in=>'0'				 	,        	--carry in
        S => add_rslt			,    			--sum
        C_out=>carry_reg
		  );	 
		  
	 shifter1: entity work.shifter(Combi_Cascade)
    port map(
		data_in=>r64						,--	data_in(31) is MSB(31 downto 0)
		sel=>shiftright	, --	sel(0) = '1' means shift by 1 bit(4 downto 0)
		left=>'0'					,			--	left = '1' means shift left
      arith=>'0'				 	,        	--	arith = '1' means arithmetic shift
		data_out => shift_rslt			    		--	data_out(31) is MSB(31 downto 0)
		  );	 
	--state transition
	process(state,busy,op1,op2,enable,r64)
	begin
		
		case state is
		
			when  idle=>
				result1<=op1;
				result2<=op2;
				if enable='1' then
					n_state<= load;
				else
					n_state<= idle;
				end if;
				
			when	load=>
				result1<=op1;
				result2<=op2;
				if busy='1' then
					n_state<= doing;
				else
					n_state<= load;
				end if;
				
			when	doing=>
				result1<=op1;
				result2<=op2;
				if busy ='0' then
					n_state<=done;
				else
					n_state<=doing;
				end if;
				
			when	done=>	
				result1<=r64(31 downto 0);
				result2<=r64(63 downto 32);
				n_state<=idle;
		end case;				
	end process;
	
process(state,op2,add_rslt)
begin
	case state is
	
		when load=>	
			r64(31 downto 0)<=op2;
			mult_cnt<=to_unsigned(31,5);
			busy<='1';
			
			shiftright<="00000";

		when doing=>
		if (mult_cnt="00000")then
				busy<='0';
		else
			if r64(0)='1' then
				r64(63 downto 32)<=add_rslt;
				
				shiftright<="00001";
				r64<=shift_rslt;
				shiftright<="00000";
				r64(63)<=carry_reg;
				mult_cnt<=mult_cnt-1;	
				
			else
				shiftright<="00001";
				r64<=shift_rslt;
				shiftright<="00000";

			end if;

		end if;
		when done=>
		
		shiftright<="00000";
		busy<='0';

	end case;
end process;

	process(clk)
	begin
		if rising_edge(clk) then
			state<=n_state;
		end if;
	end process;

end mult_arch;
