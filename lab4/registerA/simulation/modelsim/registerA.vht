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
-- Generated on "11/15/2017 04:06:52"
                                                            
-- Vhdl Test Bench template for design  :  registerA
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY registerA_vhd_tst IS
END registerA_vhd_tst;
ARCHITECTURE registerA_arch OF registerA_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL input : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL loadEnable : STD_LOGIC;
SIGNAL multiplicand : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
COMPONENT registerA
	PORT (
	clock : IN STD_LOGIC;
	input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	loadEnable : IN STD_LOGIC;
	multiplicand : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : registerA
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	input => input,
	loadEnable => loadEnable,
	multiplicand => multiplicand,
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
		  
		  -- Test Case to reset Register A
		  clock <= '0'; WAIT FOR 10ns;
		  reset <= '0';
		  clock <= '1'; WAIT FOR 10ns;
		  
		  -- Test Case of storing a positive number in Register A
		  clock <= '0'; WAIT FOR 10ns;
		  input <= "00001000";
		  reset <= '1';
		  loadEnable <= '1';
		  clock <= '1'; WAIT FOR 10ns;
		  
		  -- Test Case of reseting Register A after input stored
		  clock <= '0'; WAIT FOR 10ns;
		  reset <= '0';
		  loadEnable <= '0';
		  clock <= '1'; WAIT FOR 10ns;
		  
		  -- Test Case of storing negative number in Register A
		  clock <= '0'; WAIT FOR 10ns;
		  input <= "10100111";
		  reset <= '1';
		  loadEnable <= '1';
		  clock <= '1'; WAIT FOR 10ns;
		  
WAIT;                                                        
END PROCESS always;                                          
END registerA_arch;
