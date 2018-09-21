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
-- Generated on "11/10/2017 11:26:51"
                                                            
-- Vhdl Test Bench template for design  :  registerD
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY registerD_vhd_tst IS
END registerD_vhd_tst;
ARCHITECTURE registerD_arch OF registerD_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL countEnable : STD_LOGIC;
SIGNAL input : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL loadEnable : STD_LOGIC;
SIGNAL output : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
COMPONENT registerD
	PORT (
	clock : IN STD_LOGIC;
	countEnable : IN STD_LOGIC;
	input : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	loadEnable : IN STD_LOGIC;
	output : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : registerD
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	countEnable => countEnable,
	input => input,
	loadEnable => loadEnable,
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
        -- code executes for every event on sensitivity list  
		  clock <= '0'; WAIT FOR 10ns;
		  reset <= '0';
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  reset <= '1';
		  clock <= '1'; WAIT FOR 10ns;
		 
		  clock <= '0'; WAIT FOR 10ns;
		  loadEnable <= '1';
		  countEnable <= '0';
		  input <= "1111";
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  loadEnable <= '0';
		  countEnable <= '1';
		  input <= "1111";
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  loadEnable <= '0';
		  countEnable <= '1';
		  input <= "0111";
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  loadEnable <= '0';
		  countEnable <= '1';
		  input <= "0011";
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  loadEnable <= '0';
		  countEnable <= '1';
		  input <= "0001";
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  loadEnable <= '0';
		  countEnable <= '1';
		  input <= "0000";
		  clock <= '1'; WAIT FOR 10ns;
WAIT;                                                        
END PROCESS always;                                          
END registerD_arch;
