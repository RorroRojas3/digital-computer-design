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
-- Generated on "09/19/2017 10:25:11"
                                                            
-- Vhdl Test Bench template for design  :  Lab1c
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab1c_vhd_tst IS
END Lab1c_vhd_tst;
ARCHITECTURE Lab1c_arch OF Lab1c_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Cin : STD_LOGIC;
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL SWLEDS : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL triggerSwitch : STD_LOGIC;
COMPONENT Lab1c
	PORT (
	A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Cin : IN STD_LOGIC;
	HEX0 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX4 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX5 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	SWLEDS : BUFFER STD_LOGIC_VECTOR(9 DOWNTO 0);
	triggerSwitch : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Lab1c
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	Cin => Cin,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	HEX4 => HEX4,
	HEX5 => HEX5,
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
       
		  -- Case 1: Checks binary value of inputs A and B as well as 7-Segment Display
		  triggerSwitch <= '0';
		  Cin <= '0';
		  A <= "0010";
		  B <= "0101";
		  WAIT FOR 50ns;
		  
		  -- Case 2: Checks addition value of inputs on LEDs and 7-Segment Displays
		  triggerSwitch <= '1';
		  Cin <= '1';
		  A <= "0010";
		  B <= "0101";
		  WAIT FOR 50ns;
		  
		  -- Case 3: Checks binary value of inputs and displayed binary value on LEDs an error LED nad 7-segment display
		  triggerSwitch <= '0';
		  Cin <= '1';
		  A <= "1010";
		  B <= "0111";
		  WAIT FOR 50ns;
		  
		  -- Case 4: Checks for binary value of inputs and error LED
		  triggerSwitch <= '0';
		  Cin <= '1';
		  A <= "1000";
		  B <= "1101";
		  WAIT FOR 50ns;
		  
		  -- Case 5: Checks for sum of inputs and error LED and 7-segment display 
		  triggerSwitch <= '1';
		  Cin <= '1';
		  A <= "1111";
		  B <= "0011";
		  WAIT FOR 50ns;
		  
		  -- Case 6: Checks for sum of inputs and error LED and 7-segment display 
		  triggerSwitch <= '1';
		  Cin <= '1';
		  A <= "0010";
		  B <= "1011";
		  WAIT FOR 50ns;
		  
		  -- Case 7: Checks for binary value of inputs and error LED and 7-segment display 
		  triggerSwitch <= '0';
		  Cin <= '1';
		  A <= "1111";
		  B <= "1111";
		  WAIT FOR 50ns;
		  
		  -- Case 8: Checks for sum of inputs and error LED and 7-segment display 
		  triggerSwitch <= '1';
		  Cin <= '1';
		  A <= "1111";
		  B <= "1111";
		  WAIT FOR 50ns;  
WAIT;                                                        
END PROCESS always;                                          
END Lab1c_arch;
