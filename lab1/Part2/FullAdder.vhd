-- Author: Rodrigo Rojas
-- Contact: rrojas@clemson.edu
-- Purpose: Create a Full Adder 

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
