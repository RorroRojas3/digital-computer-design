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
-- Generated on "11/13/2017 10:10:21"
                                                            
-- Vhdl Test Bench template for design  :  bitpair
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY bitpair_vhd_tst IS
END bitpair_vhd_tst;
ARCHITECTURE bitpair_arch OF bitpair_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL datain : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL dataout : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL iready : STD_LOGIC;
SIGNAL ivalid : STD_LOGIC;
SIGNAL oready : STD_LOGIC;
SIGNAL ovalid : STD_LOGIC;
SIGNAL resetn : STD_LOGIC;
COMPONENT bitpair
	PORT (
	clock : IN STD_LOGIC;
	datain : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	dataout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	iready : IN STD_LOGIC;
	ivalid : IN STD_LOGIC;
	oready : OUT STD_LOGIC;
	ovalid : OUT STD_LOGIC;
	resetn : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : bitpair
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	datain => datain,
	dataout => dataout,
	iready => iready,
	ivalid => ivalid,
	oready => oready,
	ovalid => ovalid,
	resetn => resetn
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
		  clock <= '0'; 
		  resetn <= '0';
		  ivalid <= '1';
		  datain(15 DOWNTO 8) <= "10011010";
		  datain(7 DOWNTO 0) <= "00000010";
		  WAIT FOR 10ns;
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  resetn <= '1';
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  clock <= '1'; WAIT FOR 10ns;
		  
		  clock <= '0'; WAIT FOR 10ns;
		  clock <= '1'; WAIT FOR 10ns; 
		  
		  clock <= '0'; WAIT FOR 10ns;
		  clock <= '1'; WAIT FOR 10ns; 
		  
		  clock <= '0'; WAIT FOR 10ns;
		  clock <= '1'; WAIT FOR 10ns; 
		  
		  clock <= '0'; WAIT FOR 10ns;
		  clock <= '1'; WAIT FOR 10ns; 
		  
		  clock <= '0'; WAIT FOR 10ns;
		  clock <= '1'; WAIT FOR 10ns; 
		  
		  clock <= '0'; WAIT FOR 10ns;
		  clock <= '1'; WAIT FOR 10ns; 
		  
		  clock <= '0'; WAIT FOR 10ns;
		  clock <= '1'; WAIT FOR 10ns; 
		  
		  clock <= '0'; WAIT FOR 10ns;
		  clock <= '1'; WAIT FOR 10ns; 
WAIT;                                                        
END PROCESS always;                                          
END bitpair_arch;
