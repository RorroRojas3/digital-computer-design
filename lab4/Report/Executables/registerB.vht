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
-- Generated on "11/15/2017 06:27:36"
                                                            
-- Vhdl Test Bench template for design  :  registerB
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY registerB_vhd_tst IS
END registerB_vhd_tst;
ARCHITECTURE registerB_arch OF registerB_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL bitsToMul : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL clock : STD_LOGIC;
SIGNAL input : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL inputS : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL loadEnable : STD_LOGIC;
SIGNAL output : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL shiftEnable : STD_LOGIC;
SIGNAL twoBits : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT registerB
	PORT (
	bitsToMul : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	clock : IN STD_LOGIC;
	input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	inputS : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	loadEnable : IN STD_LOGIC;
	output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	reset : IN STD_LOGIC;
	shiftEnable : IN STD_LOGIC;
	twoBits : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : registerB
	PORT MAP (
-- list connections between master ports and signals
	bitsToMul => bitsToMul,
	clock => clock,
	input => input,
	inputS => inputS,
	loadEnable => loadEnable,
	output => output,
	reset => reset,
	shiftEnable => shiftEnable,
	twoBits => twoBits
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
		  -- Test Case for Reset
		  clock <= '0'; WAIT FOR 10ns;
		  reset <= '0';
		  loadEnable <= '0';
		  shiftEnable <= '0';
		  clock <= '1'; WAIT FOR 10ns;
		  
		  -- Test Case for Load
		  clock <= '0'; WAIT FOR 10ns;
		  reset <= '1';
		  loadEnable <= '1';
		  shiftEnable <= '0';
		  input <= "00000111";
		  clock <= '1'; WAIT FOR 10ns;
		  
		  -- Test Case for Shift 
		  clock <= '0'; WAIT FOR 10ns;
		  reset <= '1';
		  loadEnable <= '0';
		  shiftEnable <= '1';
		  inputS <= "00000111";
		  twoBits <= "11";
		  clock <= '1'; WAIT FOR 10ns;
		  
WAIT;                                                        
END PROCESS always;                                          
END registerB_arch;
