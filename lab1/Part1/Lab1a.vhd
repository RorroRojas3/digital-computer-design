-- Author: Rodrigo Ignacio Rojas Garcia
-- Contact: rrojas@clemson.edu
-- Purpose: Perform Binary-to-Decimal number conversion and display it in a 7-Segment Display
-- Board: DE1_SoC 5CSEMA5F31C6

-- Standard libary ieee is used along with its sub-library std_logic_1664
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Entity of a Binary to Decimal is declared with one input of four bits which
-- will be connected to pins SW3-SW0 on the board and two outputs of five bits
-- which will be connected to two 7-Segment Displays of the board, HEX1, and HEX0 
ENTITY Lab1a IS PORT
(
	V:	IN std_logic_vector(3 DOWNTO 0);
	HEX1, HEX0: OUT std_logic_vector(6 DOWNTO 0)
);
END Lab1a;


-- Architecture of a Binary-To-Decimal converter which is composed of component 
-- "sevenSegmentDisplay" which is responsible to display the conversion from 
-- binary to decimal based on Truth Table. The purpose of the architecture is 
-- to calculate the Boolean Logic of the conversion by using Truth Table and 
-- creating Kornough Maps based on them. Then, the result will be stored on a SIGNAL
-- called "BCDConversion". Finally, the SIGNAL "BCDConversion" will be mapped to the 
-- COMPONENT "DISPLAY" which corresponds to the "sevenSegmentDisplay" component and will
-- PORT MAP it will map the corresponding input and output which then will be displayed on
-- 7-Segment Display Hex1 and Hex0 of the board. 
ARCHITECTURE behavior_binaryToDecimal OF Lab1a IS
	
	COMPONENT sevenSegmentDisplay
		PORT (M: IN std_logic_vector(4 DOWNTO 0); -- M is an input of five bits which will store the Binary-To-Decimal conversion
				HEX1, HEX0:	OUT std_logic_vector(6 DOWNTO 0)	-- HEX1 and HEX0 are outputs which correspond the 7-Segment Displays 
				);
	END COMPONENT;	
	
	SIGNAL BCDConversion: std_logic_vector(4 DOWNTO 0);	-- SIGNAL VECTOR of five bits which will store the Binary-To-Decimal Conversion

BEGIN 
		
		BCDConversion(4) <= (V(3) AND V(2)) OR (V(3) AND V(1)); 	-- Boolean Logic based on Kornough Map for output M(4)
		BCDConversion(3) <= V(3) AND (NOT V(2)) AND (NOT V(1));	-- Boolean Logic based on Kornough Map for output M(3)
		BCDConversion(2) <= ((NOT V(3)) AND V(2)) OR (V(2) AND V(1));	-- Boolean Logic based on Kornough Map for output M(2)
		BCDConversion(1) <= (V(3) AND V(2) AND (NOT V(1))) OR ((NOT V(3)) AND V(1));	-- Boolean Logic based on Kornough Map for output M(1)
		BCDConversion(0) <= V(0);	-- Boolean Logic based on Kornough Map for output M(0)
		
		-- Top level I/O are mapped to "DISPLAY" component to their corresponding I/O
		DISPLAY: COMPONENT sevenSegmentDisplay PORT MAP (M => BCDConversion, HEX1 => HEX1, HEX0 => HEX0); 
		
END behavior_binaryToDecimal;

-- Standard libary ieee is used along with its sub-library std_logic_1664
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- ENTITY of a 7-Segment Display is declared which contains an input
-- of five bits which will contain the Binary-To-Decimal Conversion and
-- two outputs of 7 bits which will be assign different values based
-- on the input obtained to display the corresponding number on the 7-Segment Display.
-- Both input and output are mapped to Top Level ENTITY
ENTITY sevenSegmentDisplay IS PORT
(
	M: IN std_logic_vector(4 DOWNTO 0);
	HEX1, HEX0:  OUT std_logic_vector(6 DOWNTO 0)
);
END sevenSegmentDisplay;

-- Architecture of sevenSegmentDisplay describes the purpose of it which is to
-- compare the value of input "M" in sixteen diffferent cases to assign 
-- the corresponding values to the 7-Segment Displays so the correct
-- value is displayed. The values that will be displayed will be from values
-- 0-to-15, if the value exceeds 15 it will turn off both 7-Segment Displays. 
ARCHITECTURE behavior_sevenSegmentDisplay OF sevenSegmentDisplay IS
BEGIN
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
				WHEN "10000" => HEX1 <= "1111001"; HEX0 <= "1000000";	-- Case when number is 10
				WHEN "10001" => HEX1 <= "1111001"; HEX0 <= "1111001";	-- Case when number is 11
				WHEN "10010" => HEX1 <= "1111001"; HEX0 <= "0100100";	-- Case when number is 12
				WHEN "10011" => HEX1 <= "1111001"; HEX0 <= "0110000";	-- Case when number is 13
				WHEN "10100" => HEX1 <= "1111001"; HEX0 <= "0011001";	-- Case when number is 14
				WHEN "10101" => HEX1 <= "1111001"; HEX0 <= "0010010";	-- Case when number is 15 
				WHEN OTHERS => HEX1 <= "1111111"; HEX0 <= "1111111";	-- Unknown number wil turn OFF both displays
			END CASE;
		END PROCESS;
END behavior_sevenSegmentDisplay;