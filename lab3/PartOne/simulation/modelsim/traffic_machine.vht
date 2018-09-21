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
-- Generated on "10/14/2017 20:42:59"
                                                            
-- Vhdl Test Bench template for design  :  traffic_machine
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY traffic_machine_vhd_tst IS
END traffic_machine_vhd_tst;
ARCHITECTURE traffic_machine_arch OF traffic_machine_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL input : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL ivalid : STD_LOGIC;
SIGNAL output : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
COMPONENT traffic_machine
	PORT (
	clock : IN STD_LOGIC;
	input : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	ivalid : IN STD_LOGIC;
	output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : traffic_machine
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	input => input,
	ivalid => ivalid,
	output => output,
	reset => reset
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
        -- Sets ivalid to consant of '1' as well as reset 
		  reset <= '1'; 		
		  ivalid <= '1'; 	
		  
		  -- Starts at "flash_red" goes to "red"
		  clock <= '1'; 	WAIT FOR 10ns;
		  input <= "000";	
		  clock <= '0';	WAIT FOR 10ns;
		  
		  -- Goes from "red" to "left_turn"
		  clock <= '1'; 	WAIT FOR 10ns;
		  input <= "100";	
		  clock <= '0';	WAIT FOR 10ns;
		  
		  -- Goes from "left_turn" to "green"
		  clock <= '1'; 	WAIT FOR 10ns;
		  input <= "010";	
		  clock <= '0';	WAIT FOR 10ns;
		  
		  -- Goes from "green" to "yellow"
		  clock <= '1'; 	WAIT FOR 10ns;
		  input <= "111";	
		  clock <= '0';	WAIT FOR 10ns;
		  
		  -- Goes from "yellow" to "right_turn"
		  clock <= '1'; 	WAIT FOR 10ns;
		  input <= "001";	
		  clock <= '0';	WAIT FOR 10ns;
		  
		  -- Goes from "right_turn" to "red"
		  clock <= '1'; 	WAIT FOR 10ns;
		  clock <= '0';	WAIT FOR 10ns;
		  clock <= '1'; 	WAIT FOR 10ns;
		  clock <= '0'; 	WAIT FOR 10ns;
		  
		  -- Resets to "flash_red" 
		  reset <= '0';
		  
	
WAIT;                                                        
END PROCESS always;                                          
END traffic_machine_arch;