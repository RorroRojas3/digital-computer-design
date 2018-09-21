-- Author: Rodrigo Ignacio Rojas Garcia
-- Contact: rrojas@clemson.edu
-- Purpose: Sum two Binary-To-Decimal digits and display the result in 7-Segment Displays
-- Board: DE1_SoC

-- Standard libary ieee is used along with its sub-library std_logic_1664
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Entity "PartThree" is composed of one input which are stored in a std_logic_vector variable called
-- "SW" which will be assigned pins SW9-SW0 of the board. The entity also contains 7 outputs which
-- corresponds to the board's 7-Segment Displays (HEX#) and LEDs (SWLEDS).
ENTITY PartThree IS
	PORT (SW: IN std_logic_vector(9 DOWNTO 0);
			HEX5, HEX4, HEX3, HEX2, HEX1, HEX0: OUT std_logic_vector(6 DOWNTO 0);
			SWLEDS: OUT std_logic_vector(9 DOWNTO 0)
			);
END PartThree;

-- Architecture of "PartThree" consists of three components FourBitBinary, FourBitFullAdder,
-- and FiveBitBinary. FourBitBinary will be used to process the converison of a 4-bit binary
-- number to a Decimal value and display it in a 7-Segment Display. FourBitFullAdder will be used to 
-- process the sum of 4-bit numbers which are stored on SW(7-4) and SW(3-0). FiveBitBinary will be used to 
-- process the converison of a 5-bit binary number to Decimal value and display it in a 7-Segment Display.
ARCHITECTURE behavior_PartThree OF PartThree IS
	
	-- Used to convert 4-bit binary number to Decimal value and display it
	-- on a 7-Segment Display 
	COMPONENT FourBitBinary
		PORT (V:	IN std_logic_vector(3 DOWNTO 0);
				HEX1, HEX0: OUT std_logic_vector(6 DOWNTO 0)
				);
	END COMPONENT;	
	
	-- Used to calculate sum of two 4-bit binary numbers 
	COMPONENT FourBitFullAdder
		PORT (B0, A0, Cin, B1, A1, B2, A2, B3, A3: IN std_logic;
			Cout, S3, S2, S1, S0: OUT	std_logic
			);
	END COMPONENT;
	
	-- Used to convert 5-bit binary number to Decimal value and display it 
	-- on a 7-Segment Display 
	COMPONENT FiveBitBinary
		PORT (V:	IN std_logic_vector(4 DOWNTO 0);
				HEX1, HEX0: OUT std_logic_vector(6 DOWNTO 0)
				);
	END COMPONENT;
	
	-- Signal variables of type std_logic_vector which will store
	-- the two 4-bit binary numbers entered 
	SIGNAL tempInputA, tempInputB: std_logic_vector(3 DOWNTO 0);
	
	-- Signal variables of type std_logic_vector which will store
	-- the sum of two 4-bit binary numbers 
	SIGNAL tempSum: std_logic_vector(4 DOWNTO 0);
	
	-- Signal variable of tyoe std_logic which will store the
	-- input Cin 
	SIGNAL tempCin: std_logic;
	
BEGIN

	-- Stores 4-bit binary number into signal
	tempInputB <= SW(7 DOWNTO 4);
	
	-- Stores 4-bit binary number into signal 
	tempInputA <= SW(3 DOWNTO 0);
	
	-- Stores single bit into signal 
	tempCin <= SW(8);
	
	-- Converts 4-bit number stores on signal tempInputB to Decimal value and displays it in two 7-Segment Displays 
	DisplayB: COMPONENT FourBitBinary PORT MAP (V => tempInputB, HEX1 => HEX5, HEX0 => HEX4);
	
	-- Converts 4-bit numbre stored on signal tempInputA to Decimal value and displays it in two 7-Segment Displays 
	DisplayA: COMPONENT FourBitBinary PORT MAP (V => tempInputA, HEX1 => HEX3, HEX0 => HEX2);
	
	-- Calculates the sum of two 4-bit binary digits which will give store results into vector signal tempSum 
	Addition: COMPONENT FourBitFullAdder PORT MAP (B3 => tempInputB(3), B2 => tempInputB(2), B1 => tempInputB(1), B0 => tempInputB(0),
																  A3 => tempInputA(3), A2 => tempInputA(2), A1 => tempInputA(1), A0 => tempInputA(0),
																  Cin => tempCin, Cout => tempSum(4), S3 => tempSum(3), S2 => tempSum(2), S1 => tempSum(1), S0 => tempSum(0));
	
	-- Displays calculated sum of two 4-bit binary numbers and displays it in two 7-Segment Displays 
	DisplaySum: COMPONENT FiveBitBinary PORT MAP (V => tempSum, HEX1 => HEX1, HEX0 => HEX0);
	
	-- Puts input variable "SW" into sensitivity list 
	PROCESS(SW)
		BEGIN
			
			-- Checks if the value of input 9 of variable SW to decide if LEDs on board
			-- should either display the two 4-bit binary numbers entered or 
			-- display the sum of both based if the input is equal to 0 or 1 
			IF (SW(9) = '0') THEN
				SWLEDS <= SW;
			ELSE
				SWLEDS <= "0000000000";
				SWLEDS(4) <= tempSum(4);
				SWLEDS(3) <= tempSum(3);
				SWLEDS(2) <= tempSum(2);
				SWLEDS(1) <= tempSum(1);
				SWLEDS(0) <= tempSum(0);
			END IF;	
			
			-- If either the sum of two 4-bit binary number is greater than 19 or the number entered for either of
			-- the 4-bit binary number is greater than 9, it will light up an LED on the board to display
			-- this circumstance. 
			IF (tempSum > "10011") OR (SW(7 DOWNTO 0) > "1001") OR (SW(3 DOWNTO 0) > "1001") THEN
				SWLEDS(9) <= '1';
			END IF;	
			
	END PROCESS;

END behavior_PartThree;

	