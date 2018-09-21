-- Author: Rodrigo Rojas
-- Contact: rrojas@clemson.edu
-- Purpose: Create a Ripple-Carry Adder with four Full Adders
-- Board: DE1_SoC

-- Libary Declaration Section 
LIBRARY ieee;
-- Library ieee is used
USE ieee.std_logic_1164.ALL;

-- ENTITY for a Ripple Carry Adder called "FourBitFullAdder" which contains input called "SW" which is
-- a 10 bit input which will be assigned pins Sw9-SW0 of the board to enter
-- two four bit numbers. It also contains 15 outputs. Outputs Cout, S3, S2, S1
-- and S0 are one bit outputs which as a whole will contain the sum of the two
-- four bit numbers entered. The other 10 outputs correspond to "SWLEDS" which will
-- be assigned to LEDS9-0 on the board with the purpose to display the two numbers entered in binary
-- as well as displaying the sum of both numbers in binary. 
ENTITY Lab1b IS
	PORT (A, B: IN std_logic_vector(3 DOWNTO 0);
			Cin, triggerSwitch: IN std_logic;
			SWLEDS: OUT std_logic_vector(9 DOWNTO 0)
			);
END Lab1b;

-- ARCHITECTURE of the Ripple-Carry Adder is composed of COMPONENT
-- FullAdder which contains three inputs and two outputs. The three inputs
-- are three different bit numbers of value 0 or 1 which will be added
-- based on Boolean Logic. The two outputs consists of two bit numbers of value
-- 0 or 1. The outputs Cout and Sum will display the sum of the three inputs. 
-- SIGNALS Carry0, Carry1, and Carry1, will be used to store the outputs
-- of different additions and outputs tempCout, tempS3-S0, will be used 
-- to store the final sum of two four bit binary numbers. The Ripple-Carry Adder
-- will contain four Full Adders which will calculate the sum of the two four bit
-- binary inputs and will display the sum if desired. 
ARCHITECTURE behavior_FourBitFullAdder OF Lab1b IS
	COMPONENT FullAdder 
		PORT (B, A, Cin: IN std_logic;
				Cout, Sum: OUT std_logic);
	END COMPONENT;
	SIGNAL Carry0, Carry1, Carry2: std_logic;
	SIGNAL tempResult: std_logic_vector(4 DOWNTO 0);
BEGIN

	
	-- Four different Full Adders which will calculate the sum of the two four bit binary numbers. 
	FullAdder0: FullAdder PORT MAP(B => B(0), A => A(0), Cin => Cin, Cout => Carry0, Sum => tempResult(0));
	FullAdder1: FullAdder PORT MAP(B => B(1), A => A(1), Cin => Carry0, Cout => Carry1, Sum => tempResult(1));
	FullAdder2: FullAdder PORT MAP(B => B(2), A => A(2), Cin => Carry1, Cout => Carry2, Sum => tempResult(2));
	FULLAdder3: FullAdder PORT MAP(B => B(3), A => A(3), Cin => Carry2, Cout => tempResult(4), Sum => tempResult(3));
	
	
	-- Triggers the process everytime a new input is entered for either input B or A
	PROCESS (triggerSwitch, Cin, A, B, tempResult)
		VARIABLE finalResult: std_logic_vector(9 DOWNTO 0);
		BEGIN	
			-- Checks if user wants to display the two 4-bit binary numbers and if TRUE
			-- it displays them in the LEDs.
			IF (triggerSwitch = '1') THEN
				finalResult(9 DOWNTO 5) := "00000";
				finalResult(4 DOWNTO 0) := tempResult;
			-- If user wants to display the sum of the two 4-bit binary numbers it will clear
			-- all LEDs and then display the sum of the two 4-bit binary numbers. 
			ELSE
				finalResult(9) := triggerSwitch;
				finalResult(8) := Cin;
				finalResult(7 DOWNTO 4) := A;
				finalResult(3 DOWNTO 0) := B;
			END IF;
			SWLEDS <= finalResult;
	END PROCESS;
	
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