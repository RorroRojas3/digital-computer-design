-- Author: Rodrigo Ignacio Rojas Garcia
-- Contact: rrojas@clemson.edu
-- Purpose: Convert a 4-bit binary number to a Decimal value and display it on a 7-Segment Display 
-- Board: DE1_SoC

-- Standard libary ieee is used along with its sub-library std_logic_1664
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Entity "FourBitBinary" consists of one input of type std_logic_vector
-- which will contain a 4-bit binary number. It also consists of two outputs
-- of type std_logic_vector which will display the Decimal value
-- of input entered into two 7-Segment Displays 
ENTITY FourBitBinary IS PORT
(
	V:	IN std_logic_vector(3 DOWNTO 0);
	HEX1, HEX0: OUT std_logic_vector(6 DOWNTO 0)
);
END FourBitBinary;


-- Architecture of "FourBitBinary" functionality is to convert a 4-bit binary number
-- to a Decimal value and display it on a 7-Segment display. It converts the 4-bit binary number
-- by using Boolean Logic based on Truth table and calculated through Kornough maps. It also
-- contains component "FourBitdDisplay" which will be responsible to display the input converted
-- into two 7-Segment Displays
ARCHITECTURE behavior_binaryToDecimal OF FourBitBinary IS
	
	-- Will display Decimal value in two 7-Segment Displays 
	COMPONENT FourBitDisplay
		PORT (M: IN std_logic_vector(4 DOWNTO 0);
				HEX1, HEX0:	OUT std_logic_vector(6 DOWNTO 0)
				);
	END COMPONENT;	
	SIGNAL BCDConversion: std_logic_vector(4 DOWNTO 0);
BEGIN 
		BCDConversion(4) <= (V(3) AND V(2)) OR (V(3) AND V(1)); 	-- Boolean Logic based on Kornough Map for output M(4)
		BCDConversion(3) <= V(3) AND (NOT V(2)) AND (NOT V(1));	-- Boolean Logic based on Kornough Map for output M(3)
		BCDConversion(2) <= ((NOT V(3)) AND V(2)) OR (V(2) AND V(1));	-- Boolean Logic based on Kornough Map for output M(2)
		BCDConversion(1) <= (V(3) AND V(2) AND (NOT V(1))) OR ((NOT V(3)) AND V(1));	-- Boolean Logic based on Kornough Map for output M(1)
		BCDConversion(0) <= V(0);	-- Boolean Logic based on Kornough Map for output M(0)
		
		DISPLAY: COMPONENT FourBitDisplay PORT MAP (M => BCDConversion, HEX1 => HEX1, HEX0 => HEX0);
END behavior_binaryToDecimal;