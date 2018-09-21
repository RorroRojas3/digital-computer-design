-- Author: Rodrigo Rojas
-- Contact: rrojas@clemson.edu
-- Purpose: Create a Ripple-Carry Adder with four Full Adders
-- Board: DE1_SoC

-- Libary Declaration Section 
LIBRARY ieee;
-- Library ieee is used
USE ieee.std_logic_1164.ALL;

-- ENTITY for a Ripple Carry Adder called "FourBitFullAdder" which contains nine inputs 
-- will be assigned pins SW9-SW0 of the board to enter
-- two four bit numbers. It also four outputs. Outputs Cout, S3, S2, S1
-- and S0 are one bit outputs which as a whole will contain the sum of the two
-- four bit numbers entered.  
ENTITY FourBitFullAdder IS
	PORT (B0, A0, Cin, B1, A1, B2, A2, B3, A3: IN std_logic;
			Cout, S3, S2, S1, S0: OUT	std_logic
			);
END FourBitFullAdder;

-- ARCHITECTURE of the Ripple-Carry Adder is composed of COMPONENT
-- FullAdder which contains three inputs and two outputs. The three inputs
-- are three different bit numbers of value 0 or 1 which will be added
-- based on Boolean Logic. The two outputs consists of two bit numbers of value
-- 0 or 1. The outputs Cout and Sum will display the sum of the three inputs. 
-- SIGNALS Carry0, Carry1, and Carry1, will be used to store the outputs
-- of different additions. The Ripple-Carry Adder
-- will contain four Full Adders which will calculate the sum of the two four bit
-- binary inputs and will display the sum if desired. 
ARCHITECTURE behavior_FourBitFullAdder OF FourBitFullAdder IS
	COMPONENT FullAdder 
		PORT (B, A, Cin: IN std_logic;
				Cout, Sum: OUT std_logic);
	END COMPONENT;
	SIGNAL Carry0, Carry1, Carry2: std_logic;
BEGIN
	FullAdder0: FullAdder PORT MAP(B => B0, A => A0, Cin => Cin, Cout => Carry0, Sum => S0);
	FullAdder1: FullAdder PORT MAP(B => B1, A => A1, Cin => Carry0, Cout => Carry1, Sum => S1);
	FullAdder2: FullAdder PORT MAP(B => B2, A => A2, Cin => Carry1, Cout => Carry2, Sum => S2);
	FULLAdder3: FullAdder PORT MAP(B => B3, A => A3, Cin => Carry2, Cout => Cout, Sum => S3);
END behavior_FourBitFullAdder;