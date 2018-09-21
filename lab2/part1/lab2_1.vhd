-- Author: Rodrigo Ignacio Rojas Garcia
-- Contact: rrojas@clemson.edu
-- Purpose: Create a Decoder
-- Board: DE1_SoC 5CSEMA5F31C6

-- Standard Library iee is used along with its sub-library std_logic_1644
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Entity for a 3x8 Decoder which is composed of two inputs and one output.
-- Input decInputs will contain the values 0-7 in binary to tell the 
-- decoder which output to use. Input decEnable will enable the output 
-- to be used. Output decOutput contains the values of each of the seven outputs
-- which will be either of value 0 or 1 based on the decInputs and decEnable 
ENTITY lab2_1 IS PORT
(
	decInputs: IN std_logic_vector(2 DOWNTO 0);
	decEnable: IN std_logic;
	decOutput: OUT std_logic_vector(7 DOWNTO 0)
);
END lab2_1;

-- Architecture of the 3x8 Decoder will use two case statements.
-- The first one will check the value of the input decEnable if it
-- is either a 1 or 0. If it is a 1, it will run into a case statement
-- based on input decInputs and will determine what value to give to
-- output decOutput, the corresponding input will be given a LOW value of 0
-- others will be given value HIGH 1. If input decEnable is 0,
-- it will give all outputs HIGH value of 1. 
ARCHITECTURE behavior_lab2_1 OF lab2_1 IS
BEGIN
	PROCESS(decInputs, decEnable)
		BEGIN
			CASE decEnable IS
				WHEN '1' => -- Case when deEnable is of value 1
					CASE decInputs IS 
						WHEN "000" => decOutput <= "11111110"; -- Case when decInputs is 0
						WHEN "001" => decOutput <= "11111101";	-- Case when decInputs is 1
						WHEN "010" => decOutput <= "11111011";	-- Case when decInputs is 2
						WHEN "011" => decOutput <= "11110111";	-- Case when decInputs is 3
						WHEN "100" => decOutput <= "11101111";	-- Case when decInputs is 4
						WHEN "101" => decOutput <= "11011111";	-- Case when decInputs is 5
						WHEN "110" => decOutput <= "10111111";	-- Case when decInputs is 6
						WHEN "111" => decOutput <= "01111111";	-- Case when decInputs is 7
						WHEN OTHERS => decOutput <= "11111111";	-- Case when decInputs is not of value between 0-7
					END CASE;
				WHEN OTHERS => decOutput <= "11111111"; -- Case when decEnable is 0
			END CASE;
		END PROCESS;	
END behavior_lab2_1;