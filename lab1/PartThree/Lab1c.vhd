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
ENTITY Lab1c IS
	PORT (A, B: IN std_logic_vector(3 DOWNTO 0);
			Cin, triggerSwitch: IN std_logic;
			HEX5, HEX4, HEX3, HEX2, HEX1, HEX0: OUT std_logic_vector(6 DOWNTO 0);
			SWLEDS: OUT std_logic_vector(9 DOWNTO 0)
			);
END Lab1c;

-- Architecture of "Lab1c" consists of three components FourBitBinary, FourBitFullAdder,
-- and FiveBitBinary. FourBitBinary will be used to process the converison of a 4-bit binary
-- number to a Decimal value and display it in a 7-Segment Display. FourBitFullAdder will be used to 
-- process the sum of 4-bit numbers which are stored on SW(7-4) and SW(3-0). FiveBitBinary will be used to 
-- process the converison of a 5-bit binary number to Decimal value and display it in a 7-Segment Display.
ARCHITECTURE behavior_PartThree OF Lab1c IS
	
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
	tempInputB <= B;
	
	-- Stores 4-bit binary number into signal 
	tempInputA <= A;
	
	-- Stores single bit into signal 
	tempCin <= Cin;
	
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
	PROCESS(triggerSwitch, Cin, A, B, tempSum)
		VARIABLE finalResult: std_logic_vector(9 DOWNTO 0);
		BEGIN
			
			-- Checks if the value of input 9 of variable SW to decide if LEDs on board
			-- should either display the two 4-bit binary numbers entered or 
			-- display the sum of both based if the input is equal to 0 or 1 
			IF (triggerSwitch = '0') THEN
				finalResult(9) := triggerSwitch;
				finalResult(8) := Cin;
				finalResult(7 DOWNTO 4) := A;
				finalResult(3 DOWNTO 0) := B;
			ELSE
				finalResult := "0000000000";
				finalResult(4) := tempSum(4);
				finalResult(3) := tempSum(3);
				finalResult(2) := tempSum(2);
				finalResult(1) := tempSum(1);
				finalResult(0) := tempSum(0);
			END IF;	
			
			-- If either the sum of two 4-bit binary number is greater than 19 or the number entered for either of
			-- the 4-bit binary number is greater than 9, it will light up an LED on the board to display
			-- this circumstance. 
			IF (tempSum > "10011") OR (A > "1001") OR (B > "1001") THEN
				finalResult(9) := '1';
			END IF;	
			
			SWLEDS <= finalResult;
			
	END PROCESS;

END behavior_PartThree;

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

-- Standard libary ieee is used along with its sub-library std_logic_1664
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Entity of a Full Adder that contains three std_logic inputs B, A, and Cin and two
-- std_logic outputs Cout and Sum. Inputs B, A, and Cin are a single bit binary value
-- of either 0 or 1. Outputs Cout and Sum will contain a single bit binary value
-- which will represent the sum of the three inputs. 
ENTITY FullAdder IS
	PORT (B, A, Cin: IN std_logic;
			Cout, Sum: OUT std_logic
	);
END FullAdder;

-- Architecture of a Full Adder is declared and described its functionality
-- through Boolean logic based on Truth Table and Kornough Maps
ARCHITECTURE behavior_FullAdder OF FullAdder IS
BEGIN
		Cout <= (B AND A) OR (A AND Cin) OR (B AND Cin); -- Boolean logic for Cout
		Sum <= ((NOT B) AND (NOT A) AND Cin) OR ((NOT B) AND A AND (NOT Cin)) OR (B AND A AND Cin) OR (B AND (NOT A) AND (NOT Cin)); --Boolean logic for the sum
END behavior_FullAdder;


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

-- Standard libary ieee is used along with its sub-library std_logic_1664
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Entity of a Binary to Decimal is declared with one input of four bits
-- which contains a 5-bit binary number. It also contains two outputs 
-- which will display the Decimal value in two 7-Segment Displays 
ENTITY FiveBitDisplay IS PORT
(
	M: IN std_logic_vector(4 DOWNTO 0);
	HEX1, HEX0:  OUT std_logic_vector(6 DOWNTO 0)
);
END FiveBitDisplay;

-- Architecture of "FiveBitDisplay" will check input value in cases of numbers 0-15
-- and determine what value should be displayed on the two 7-Segment Displays 
ARCHITECTURE behavior_sevenSegmentDisplay OF FiveBitDisplay IS
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
				WHEN "10110" => HEX1 <= "1111001"; HEX0 <= "0000010";	-- Case when number is 16
				WHEN "10111" => HEX1 <= "1111001"; HEX0 <= "1111000";	-- Case when number is 17
				WHEN "11000" => HEX1 <= "1111001"; HEX0 <= "0000000";	-- Case when number is 18
				WHEN "11001" => HEX1 <= "1111001"; HEX0 <= "0011000";	-- Case when number is 19
				WHEN OTHERS => HEX1 <= "1111111"; HEX0 <= "1111111";	-- Unkown number wil turn OFF both displays
			END CASE;
		END PROCESS;
END behavior_sevenSegmentDisplay;
		

	