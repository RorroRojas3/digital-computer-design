-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "11/15/2017 08:56:46"
                                                            
-- Vhdl Test Bench template for design  :  multiplexer
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY multiplexer_vhd_tst IS
END multiplexer_vhd_tst;
ARCHITECTURE multiplexer_arch OF multiplexer_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL output : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL registerA : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL selectPin : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL signBit : STD_LOGIC;
COMPONENT multiplexer
	PORT (
	output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	registerA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	selectPin : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	signBit : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : multiplexer
	PORT MAP (
-- list connections between master ports and signals
	output => output,
	registerA => registerA,
	selectPin => selectPin,
	signBit => signBit
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once    
		  -- Test Case when is 0
		  selectPin <= "000";
		  registerA <= "00000101";
		  
		  -- Test Case when is 1
		  WAIT FOR 10ns;
		  selectPin <= "010";
		  registerA <= "00000101";
		  
		  -- Test Case when is 2
		  WAIT FOR 10ns;
		  selectPin <= "011";
		  registerA <= "00000101";
		   
		  -- Test Case when -1
		  WAIT FOR 10ns;
		  selectPin <= "110";
		  registerA <= "00000101";
		  
		  
		  -- Test Case when -2 
		  WAIT FOR 10ns;
		  selectPin <= "100";
		  registerA <= "00000101";
		  
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END multiplexer_arch;
