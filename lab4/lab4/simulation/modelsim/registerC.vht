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
-- Generated on "11/09/2017 19:15:08"
                                                            
-- Vhdl Test Bench template for design  :  registerC
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY registerC_vhd_tst IS
END registerC_vhd_tst;
ARCHITECTURE registerC_arch OF registerC_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL addEnable : STD_LOGIC;
SIGNAL bitsToB : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL clock : STD_LOGIC;
SIGNAL input : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL loadEnable : STD_LOGIC;
SIGNAL output : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL shiftEnable : STD_LOGIC;
SIGNAL signBit : STD_LOGIC;
COMPONENT registerC
	PORT (
	addEnable : IN STD_LOGIC;
	bitsToB : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	clock : IN STD_LOGIC;
	input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	loadEnable : IN STD_LOGIC;
	output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	reset : IN STD_LOGIC;
	shiftEnable : IN STD_LOGIC;
	signBit : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : registerC
	PORT MAP (
-- list connections between master ports and signals
	addEnable => addEnable,
	bitsToB => bitsToB,
	clock => clock,
	input => input,
	loadEnable => loadEnable,
	output => output,
	reset => reset,
	shiftEnable => shiftEnable,
	signBit => signBit
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
        input <= "00000010";
        signBit <= '0';
        loadEnable <= '1';
        shiftEnable <= '0';
        addEnable <= '0';
        clock <= '1'; WAIT FOR 10ns;
        
        clock <= '0'; WAIT FOR 10ns;
        input <= "00000010";
        signBit <= '1';
        loadEnable <= '0';
        shiftEnable <= '1';
        addEnable <= '0';
        clock <= '1'; WAIT FOR 10ns;
        
        clock <= '0'; WAIT FOR 10ns;
        input <= "00001010";
        signBit <= '0';
        loadEnable <= '1';
        shiftEnable <= '0';
        addEnable <= '0';
        clock <= '1'; WAIT FOR 10ns;
        
        clock <= '0'; WAIT FOR 10ns;
        input <= "00001010";
        signBit <= '0';
        loadEnable <= '0';
        shiftEnable <= '1';
        addEnable <= '0';
        clock <= '1'; WAIT FOR 10ns;
WAIT;                                                        
END PROCESS always;                                          
END registerC_arch;
