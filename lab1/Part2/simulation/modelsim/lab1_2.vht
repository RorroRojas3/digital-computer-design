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
-- Generated on "09/18/2017 23:59:17"
                                                            
-- Vhdl Test Bench template for design  :  lab1_2
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY lab1_2_vhd_tst IS
END lab1_2_vhd_tst;
ARCHITECTURE lab1_2_arch OF lab1_2_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Cin : STD_LOGIC;
SIGNAL SWLEDS : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL triggerSwitch : STD_LOGIC;
COMPONENT lab1_2
	PORT (
	A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Cin : IN STD_LOGIC;
	SWLEDS : BUFFER STD_LOGIC_VECTOR(9 DOWNTO 0);
	triggerSwitch : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : lab1_2
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	Cin => Cin,
	SWLEDS => SWLEDS,
	triggerSwitch => triggerSwitch
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
        -- 
		 triggerSwitch <= '0';
		 Cin <= '0';
		 A <= "0010";
		 B <= "0111";
		 WAIT FOR 50ns;
		 
		 triggerSwitch <= '1';
		 Cin <= '0';
		 A <= "0010";
		 B <= "0111";
		 WAIT FOR 50ns;
		 
		 triggerSwitch <= '1';
		 Cin <= '1';
		 A <= "0010";
		 B <= "0111";
		 WAIT FOR 50ns;
		 
		 triggerSwitch <= '0';
		 Cin <= '1';
		 A <= "1010";
		 B <= "0011";
		 WAIT FOR 50ns;
		 
		 triggerSwitch <= '1';
		 Cin <= '1';
		 A <= "1010";
		 B <= "0111";
		 WAIT FOR 50ns;
		 
		 triggerSwitch <= '0';
		 Cin <= '1';
		 A <= "1101";
		 B <= "1111";
		 WAIT FOR 50ns;
		 
		 triggerSwitch <= '1';
		 Cin <= '1';
		 A <= "1101";
		 B <= "1111";
		 WAIT FOR 50ns;
		 
		 
WAIT;                                                        
END PROCESS always;                                          
END lab1_2_arch;
