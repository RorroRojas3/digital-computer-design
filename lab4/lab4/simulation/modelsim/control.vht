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
-- Generated on "11/12/2017 15:16:28"
                                                            
-- Vhdl Test Bench template for design  :  control
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY control_vhd_tst IS
END control_vhd_tst;
ARCHITECTURE control_arch OF control_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL add : STD_LOGIC;
SIGNAL busy : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL countO : STD_LOGIC;
SIGNAL load : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL resetO : STD_LOGIC;
SIGNAL shift : STD_LOGIC;
SIGNAL start : STD_LOGIC;
SIGNAL timeCount : STD_LOGIC;
COMPONENT control
	PORT (
	add : BUFFER STD_LOGIC;
	busy : BUFFER STD_LOGIC;
	clock : IN STD_LOGIC;
	countO : BUFFER STD_LOGIC;
	load : BUFFER STD_LOGIC;
	reset : IN STD_LOGIC;
	resetO : BUFFER STD_LOGIC;
	shift : BUFFER STD_LOGIC;
	start : IN STD_LOGIC;
	timeCount : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : control
	PORT MAP (
-- list connections between master ports and signals
	add => add,
	busy => busy,
	clock => clock,
	countO => countO,
	load => load,
	reset => reset,
	resetO => resetO,
	shift => shift,
	start => start,
	timeCount => timeCount
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
        -- code executes for every event on sensitivity list  
		  reset <= '0';
		  start <= '1';
		  timeCount <= '0';
		  
		  clock <= '0'; WAIT FOR 10ns;
		  reset <= '0';
		  start <= '1';
		  timeCount <= '0';
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  reset <= '1';
		  start <= '0';
		  timeCount <= '1';
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  reset <= '1';
		  start <= '0';
		  timeCount <= '1';
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  reset <= '1';
		  start <= '0';
		  timeCount <= '1';
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  reset <= '1';
		  start <= '0';
		  timeCount <= '1';
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  reset <= '1';
		  start <= '0';
		  timeCount <= '1';
		  clock <= '1'; WAIT FOR 10ns;
		  
		   clock <= '0'; WAIT FOR 10ns;
		  reset <= '1';
		  start <= '0';
		  timeCount <= '1';
		  clock <= '1'; WAIT FOR 10ns;
		  
		   clock <= '0'; WAIT FOR 10ns;
		  reset <= '1';
		  start <= '0';
		  timeCount <= '1';
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  reset <= '1';
		  start <= '0';
		  timeCount <= '1';
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  reset <= '1';
		  start <= '0';
		  timeCount <= '1';
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  reset <= '1';
		  start <= '0';
		  timeCount <= '0';
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  
		  clock <= '1'; WAIT FOR 10ns;
		  
WAIT;                                                        
END PROCESS always;                                          
END control_arch;
