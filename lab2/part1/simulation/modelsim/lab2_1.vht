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
-- Generated on "09/29/2017 09:35:39"
                                                            
-- Vhdl Test Bench template for design  :  lab2_1
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY lab2_1_vhd_tst IS
END lab2_1_vhd_tst;
ARCHITECTURE lab2_1_arch OF lab2_1_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL decEnable : STD_LOGIC;
SIGNAL decInputs : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL decOutput : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT lab2_1
	PORT (
	decEnable : IN STD_LOGIC;
	decInputs : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	decOutput : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : lab2_1
	PORT MAP (
-- list connections between master ports and signals
	decEnable => decEnable,
	decInputs => decInputs,
	decOutput => decOutput
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
		  decEnable <= '0';
		  decInputs <= "000";
		  WAIT FOR 10ns;
		
		  decEnable <= '1';
		  decInputs <= "010";
		  WAIT FOR 10ns;
		
		  decEnable <= '1';
		  decInputs <= "101";
		  WAIT FOR 10ns;
		
		  decEnable <= '0';
		  decInputs <= "110";
		  WAIT FOR 10ns;
		
		  decEnable <= '1';
		  decInputs <= "110";
		  WAIT FOR 10ns;
		
		  decEnable <= '1';
		  decInputs <= "111";
		  WAIT FOR 10ns;
WAIT;                                                        
END PROCESS always;                                          
END lab2_1_arch;
