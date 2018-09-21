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
-- Generated on "09/19/2017 09:58:12"
                                                            
-- Vhdl Test Bench template for design  :  Lab1a
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab1a_vhd_tst IS
END Lab1a_vhd_tst;
ARCHITECTURE Lab1a_arch OF Lab1a_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL V : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT Lab1a
	PORT (
	HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	V : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Lab1a
	PORT MAP (
-- list connections between master ports and signals
	HEX0 => HEX0,
	HEX1 => HEX1,
	V => V
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
       -- Will set the input V to value of 0 on binary and wait 10 ns  
		  V <= "0000";
		  WAIT FOR 50ns;
		  -- Will set the input V to value of 3 on binary and wait 10 ns
		  V <= "0011";
		  WAIT FOR 50ns;
		  -- Will set the input V to value of 8 on binary and wait 10 ns
		  V <= "1000";
		  WAIT FOR 50ns;
		  -- Will set the input V to value of 10 on binary and wait 10 ns
		  V <= "1010";
		  WAIT FOR 50ns;
		  -- Will set the input V to value of 13 on binary and wait 10 ns
		  V <= "1101";
		  WAIT FOR 50ns;
		  -- Will set the input V to value of 15 on binary and wait 10 ns
		  V <= "1111";
		  WAIT FOR 50ns;  
WAIT;                                                        
END PROCESS always;                                          
END Lab1a_arch;
