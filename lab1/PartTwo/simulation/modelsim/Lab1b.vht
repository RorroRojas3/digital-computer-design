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
-- Generated on "09/19/2017 10:06:15"
                                                            
-- Vhdl Test Bench template for design  :  Lab1b
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab1b_vhd_tst IS
END Lab1b_vhd_tst;
ARCHITECTURE Lab1b_arch OF Lab1b_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Cin : STD_LOGIC;
SIGNAL SWLEDS : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL triggerSwitch : STD_LOGIC;
COMPONENT Lab1b
	PORT (
	A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Cin : IN STD_LOGIC;
	SWLEDS : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	triggerSwitch : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Lab1b
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
        -- Case 1: Displays binary values of A and B
		 triggerSwitch <= '0';
		 Cin <= '0';
		 A <= "0010"; -- 2
		 B <= "0111"; -- 7
		 WAIT FOR 10ns;
		 
		 -- Case 2: Displays sum of A and B
		 triggerSwitch <= '1';
		 Cin <= '0';
		 A <= "0010"; -- 2
		 B <= "0111"; -- 7
		 WAIT FOR 10ns;
		 
		 -- Case 3: Displays sum of A, B, and Cin
		 triggerSwitch <= '1';
		 Cin <= '1';
		 A <= "0010";
		 B <= "0111";
		 WAIT FOR 10ns;
		 
		 -- Case 4: Displays binary values of A, B, and Cin
		 triggerSwitch <= '0';
		 Cin <= '1';
		 A <= "1010";
		 B <= "0011";
		 WAIT FOR 10ns;
		 
		 -- Case 5: Displays sum of A, B, and Cin
		 triggerSwitch <= '1';
		 Cin <= '1';
		 A <= "1010";
		 B <= "0111";
		 WAIT FOR 10ns;
		 
		 -- Case 6: Displays binary values of A, B, and Cin
		 triggerSwitch <= '0';
		 Cin <= '1';
		 A <= "1101";
		 B <= "1111";
		 WAIT FOR 10ns;
		 
		 -- Case 7: Displays sum of A, B, and Cin
		 triggerSwitch <= '1';
		 Cin <= '1';
		 A <= "1101";
		 B <= "1111";
		 WAIT FOR 10ns;
WAIT;                                                        
END PROCESS always;                                          
END Lab1b_arch;
