entity shifter is
    Port ( data_in	: in	STD_LOGIC_VECTOR (31 downto 0);	--	data_in(31) is MSB
           sel		: in	STD_LOGIC_VECTOR (4 downto 0);	--	sel(0) = '1' means shift by 1 bit
           left		: in	STD_LOGIC;			--	left = '1' means shift left
           arith	: in	STD_LOGIC;			--	arith = '1' means arithmetic shift
           data_out	: out	STD_LOGIC_VECTOR (31 downto 0));--	data_out(31) is MSB
end shifter;

Ref:
200 MHz = 5 ns period (Fastest possible clock period)

Performance:
178 blocks used
5 logic levels (5 X 0.124 = 0.62ns logic delay; 4.291ns route delay)
