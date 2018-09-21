--	Name: Rodrigo Rojas
--	Contact: rrojas@clemson.edu
--	Purpose: Shifting Register

-- Library Declaration Section 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;

ENTITY multiplexer IS
	GENERIC (n: INTEGER := 8);
	PORT (registerA : IN std_logic_vector((n-1) DOWNTO 0);
			selectPin : IN std_logic_vector(2 DOWNTO 0);
			signBit: OUT std_logic; 
			output: OUT std_logic_vector((n-1) DOWNTO 0)
			);
END multiplexer;

-- Multiplexer is reponsible to return the 2's complement or
-- value of Register A based on the input selectPin which
-- are the last three bits of Register B. Also, it will
-- determine the sign bit that must be set in register C
-- when it is shifted 
ARCHITECTURE behavior_multiplexer OF multiplexer IS

SIGNAL bitPair: std_logic_vector(2 DOWNTO 0);

BEGIN
	bitPair <= selectPin;
	PROCESS (bitPair)
		VARIABLE multiplicandValue: std_logic_vector((n-1) DOWNTO 0);
		BEGIN
			IF bitPair = "000" OR bitPair = "111" THEN -- If bitPair is 0
				multiplicandValue := (OTHERS => '0');
				IF registerA(n-1) = '1' THEN
					signBit <= '1';
				ELSIF registerA(n-1) = '0' THEN
					signBit <= '0';
				END IF;
			ELSIF bitPair = "001" OR bitPair = "010" THEN -- If bitPair is 1 
				multiplicandValue := registerA;
				signBit <= registerA(n-1);
			ELSIF bitPair = "011" THEN -- If bitPair is 2
				signBit <= registerA(n-1);
				multiplicandValue := registerA((n-2) DOWNTO 0) & '0';
			ELSIF bitPair = "110" OR bitPair = "101" THEN -- If bitPair is -1
				multiplicandValue := NOT registerA;
				multiplicandValue := std_logic_vector(unsigned(multiplicandValue + 1));
				signBit <= multiplicandValue(n-1);
			ELSIF bitPair = "100" THEN -- If bitPair is -2
				multiplicandValue := NOT registerA;
				multiplicandValue := std_logic_vector(unsigned(multiplicandValue + 1));
				signBit <= multiplicandValue(n-1);
				multiplicandValue := multiplicandValue((n-2) DOWNTO 0) & '0';
			END IF;
			output <= multiplicandValue;
	END PROCESS;

END behavior_multiplexer;
		
		