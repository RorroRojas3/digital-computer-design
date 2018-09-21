-- Author: Rodrigo Ignacio Rojas Garcia
-- Contact: rrojas@clemson.edu
-- Purpose: Create a 3-bit to 8-bit decoder

-- Declares library ieee and uses it
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Create main entity called "traffic_decoder" which is composed
-- of two inputs and one output. Input "input" correspond to
-- 3-bit binary number and "enable" to enable bit. Output "output"
-- correspond to 8-bit binary output 
ENTITY traffic_decoder IS
	PORT(input			: IN std_logic_vector(2 DOWNTO 0);
	     enable			: IN std_logic;
	     output			: OUT std_logic_vector(7 DOWNTO 0));
END traffic_decoder;

-- Architecture of the traffic_decoder logic correspond to
-- assigning the value 0 based on value of "input" and if 
-- the enable bit has a value of 1. Otherwise, the value
-- of all 8-bits will be 1. 
ARCHITECTURE behavior OF traffic_decoder IS
BEGIN
	PROCESS(input, enable)
		BEGIN
			CASE enable IS
				WHEN '1' => -- Case when enable is of value 1
					CASE input IS 
						WHEN "000" => output <= "11111110"; -- Case when input is 0
						WHEN "001" => output <= "11111101";	-- Case when input is 1
						WHEN "010" => output <= "11111011";	-- Case when input is 2
						WHEN "011" => output <= "11110111";	-- Case when input is 3
						WHEN "100" => output <= "11101111";	-- Case when input is 4
						WHEN "101" => output <= "11011111";	-- Case when input is 5
						WHEN "110" => output <= "10111111";	-- Case when input is 6
						WHEN "111" => output <= "01111111";	-- Case when input is 7
						WHEN OTHERS => output <= "11111111";	-- Case when input is not of value between 0-7
					END CASE;
				WHEN OTHERS => output <= "11111111"; -- Case when enable is 0
			END CASE;
		END PROCESS;
END behavior;					
