-- Author: Rodrigo Ignacio Rojas Garcia
-- Contact: rrojas@clemson.edu
-- Purpose: Sum two Binary-To-Decimal digits and display the result in 7-Segment Displays
-- Board: DE1_SoC

-- Standard libary ieee is used along with its sub-library std_logic_1664
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Entity "FiveBitBinary" consists of one input of type std_logic_vector
-- which will contain a 5-bit binary number. It also consists of two outputs
-- of type std_logic_vector which will display the Decimal value
-- of input entered into two 7-Segment Displays 
ENTITY FiveBitBinary IS PORT
(
	V:	IN std_logic_vector(4 DOWNTO 0);
	HEX1, HEX0: OUT std_logic_vector(6 DOWNTO 0);
	SWLEDS: OUT std_logic_vector(9 DOWNTO 0)
);
END FiveBitBinary;


-- Architecture of "FiveBitBinary" functionality is to convert a 5-bit binary number
-- to a Decimal value and display it on a 7-Segment display. It converts the 5-bit binary number
-- by using case statements. It also contains component "FourBitdDisplay" which will be responsible 
-- to display the input converted into two 7-Segment Displays
ARCHITECTURE behavior_binaryToDecimal OF FiveBitBinary IS
	
	-- Will display Decimal value in two 7-Segment Displays
	COMPONENT FiveBitDisplay
		PORT (M: IN std_logic_vector(4 DOWNTO 0);
				HEX1, HEX0:	OUT std_logic_vector(6 DOWNTO 0)
				);
	END COMPONENT;	
	SIGNAL BCDConversion: std_logic_vector(4 DOWNTO 0);
BEGIN 
	PROCESS (V)
		BEGIN
			CASE V IS
				WHEN "00000" => BCDConversion <= "00000";	-- Case when number is 0
				WHEN "00001" => BCDConversion <= "00001";	-- Case when number is 1
				WHEN "00010" => BCDConversion <= "00010";	-- Case when number is 2
				WHEN "00011" => BCDConversion <= "00011";	-- Case when number is 3
				WHEN "00100" => BCDConversion <= "00100";	-- Case when number is 4
				WHEN "00101" => BCDConversion <= "00101";	-- Case when number is 5
				WHEN "00110" => BCDConversion <= "00110";	-- Case when number is 6
				WHEN "00111" => BCDConversion <= "00111";	-- Case when number is 7
				WHEN "01000" => BCDConversion <= "01000";	-- Case when number is 8
				WHEN "01001" => BCDConversion <= "01001";	-- Case when number is 9
				WHEN "01010" => BCDConversion <= "10000";	-- Case when number is 10
				WHEN "01011" => BCDConversion <= "10001";	-- Case when number is 11
				WHEN "01100" => BCDConversion <= "10010";	-- Case when number is 12
				WHEN "01101" => BCDConversion <= "10011";	-- Case when number is 13
				WHEN "01110" => BCDConversion <= "10100";	-- Case when number is 14
				WHEN "01111" => BCDConversion <= "10101";	-- Case when number is 15
				WHEN "10000" => BCDConversion <= "10110";	-- Case when number is 16
				WHEN "10001" => BCDConversion <= "10111";	-- Case when number is 17
				WHEN "10010" => BCDConversion <= "11000";	-- Case when number is 18
				WHEN "10011" => BCDConversion <= "11001";	-- Case when number is 19
				WHEN OTHERS => BCDConversion <= "11010";	-- Case when number is greater than 19 
			END CASE;
		END PROCESS;
	DISPLAY: COMPONENT FiveBitDisplay PORT MAP (M => BCDConversion, HEX1 => HEX1, HEX0 => HEX0);
END behavior_binaryToDecimal;