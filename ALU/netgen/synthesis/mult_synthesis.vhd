--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: mult_synthesis.vhd
-- /___/   /\     Timestamp: Mon Sep 22 20:21:35 2014
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm mult -w -dir netgen/synthesis -ofmt vhdl -sim mult.ngc mult_synthesis.vhd 
-- Device	: xc3s400a-4-ft256
-- Input file	: mult.ngc
-- Output file	: C:\Users\jw\Dropbox\EE4\CG3207\LAB\LAB2_joey\netgen\synthesis\mult_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: mult
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity mult is
  port (
    enable : in STD_LOGIC := 'X'; 
    result1 : out STD_LOGIC_VECTOR ( 31 downto 0 ); 
    result2 : out STD_LOGIC_VECTOR ( 31 downto 0 ); 
    op1 : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    op2 : in STD_LOGIC_VECTOR ( 31 downto 0 ) 
  );
end mult;

architecture Structure of mult is
  signal result2_0_OBUF_64 : STD_LOGIC; 
begin
  XST_GND : GND
    port map (
      G => result2_0_OBUF_64
    );
  result1_31_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(31)
    );
  result1_30_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(30)
    );
  result1_29_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(29)
    );
  result1_28_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(28)
    );
  result1_27_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(27)
    );
  result1_26_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(26)
    );
  result1_25_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(25)
    );
  result1_24_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(24)
    );
  result1_23_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(23)
    );
  result1_22_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(22)
    );
  result1_21_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(21)
    );
  result1_20_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(20)
    );
  result1_19_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(19)
    );
  result1_18_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(18)
    );
  result1_17_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(17)
    );
  result1_16_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(16)
    );
  result1_15_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(15)
    );
  result1_14_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(14)
    );
  result1_13_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(13)
    );
  result1_12_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(12)
    );
  result1_11_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(11)
    );
  result1_10_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(10)
    );
  result1_9_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(9)
    );
  result1_8_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(8)
    );
  result1_7_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(7)
    );
  result1_6_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(6)
    );
  result1_5_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(5)
    );
  result1_4_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(4)
    );
  result1_3_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(3)
    );
  result1_2_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(2)
    );
  result1_1_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(1)
    );
  result1_0_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result1(0)
    );
  result2_31_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(31)
    );
  result2_30_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(30)
    );
  result2_29_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(29)
    );
  result2_28_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(28)
    );
  result2_27_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(27)
    );
  result2_26_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(26)
    );
  result2_25_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(25)
    );
  result2_24_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(24)
    );
  result2_23_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(23)
    );
  result2_22_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(22)
    );
  result2_21_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(21)
    );
  result2_20_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(20)
    );
  result2_19_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(19)
    );
  result2_18_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(18)
    );
  result2_17_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(17)
    );
  result2_16_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(16)
    );
  result2_15_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(15)
    );
  result2_14_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(14)
    );
  result2_13_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(13)
    );
  result2_12_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(12)
    );
  result2_11_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(11)
    );
  result2_10_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(10)
    );
  result2_9_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(9)
    );
  result2_8_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(8)
    );
  result2_7_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(7)
    );
  result2_6_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(6)
    );
  result2_5_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(5)
    );
  result2_4_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(4)
    );
  result2_3_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(3)
    );
  result2_2_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(2)
    );
  result2_1_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(1)
    );
  result2_0_OBUF : OBUF
    port map (
      I => result2_0_OBUF_64,
      O => result2(0)
    );

end Structure;

