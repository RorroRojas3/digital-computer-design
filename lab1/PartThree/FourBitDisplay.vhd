-- Author: Rodrigo Ignacio Rojas Garcia
-- Contact: rrojas@clemson.edu
-- Purpose: Display Decimal value of a 5-bit binary number in two 7-Segment Displays 
-- Board: DE1_SoC

-- Standard libary ieee is used along with its sub-library std_logic_1664
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Entity of a Binary to Decimal is declared with one input of four bits
-- which contains a 5-bit binary number. It also contains two outputs 
-- which will display the Decimal value in two 7-Segment Displays 
ENTITY FourBitDisplay IS PORT
(
	M: IN std_logic_vector(4 DOWNTO 0);
	HEX1, HEX0:  OUT std_logic_vector(6 DOWNTO 0)
);
END FourBitDisplay;

-- Architecture of "FourBitDisplay" will check input value in cases of numbers 0-15
-- and determine what value should be displayed on the two 7-Segment Displays 
ARCHITECTURE behavior_sevenSegmentDisplay OF FourBitDisplay IS
BEGIN
	-- Puts input M in the sensitivity list 
	PROCESS(M)
		BEGIN
			CASE M IS
				WHEN "00000" => HEX1 <= "1000000"; HEX0 <= "1000000"; -- Case when number is 0
				WHEN "00001" => HEX1 <= "1000000"; HEX0 <= "1111001";	-- Case when number is 1
				WHEN "00010" => HEX1 <= "1000000"; HEX0 <= "0100100"; -- Case when number is 2
				WHEN "00011" => HEX1 <= "1000000"; HEX0 <= "0110000";	-- Case when number is 3
				WHEN "00100" => HEX1 <= "1000000"; HEX0 <= "0011001";	-- Case when number is 4
				WHEN "00101" => HEX1 <= "1000000"; HEX0 <= "0010010";	-- Case when number is 5
				WHEN "00110" => HEX1 <= "1000000"; HEX0 <= "0000010";	-- Case when number is 6
				WHEN "00111" => HEX1 <= "1000000"; HEX0 <= "1111000";	-- Case when number is 7
				WHEN "01000" => HEX1 <= "1000000"; HEX0 <= "0000000";	-- Case when number is 8
				WHEN "01001" => HEX1 <= "1000000"; HEX0 <= "0011000";	-- Case when number is 9
				WHEN OTHERS => HEX1 <= "1111111"; HEX0 <= "1111111";	-- Unkown number wil turn OFF both displays
			END CASE;
		END PROCESS;
END behavior_sevenSegmentDisplay;
		