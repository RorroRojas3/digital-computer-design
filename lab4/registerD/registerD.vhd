-- Name: Rodrigo Rojas
--	Contact: rrojas@clemson.edu
--	Purpose: Shifting Register

-- Library Declaration Section
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY registerD IS 
	GENERIC(n : INTEGER := 8);
	PORT (input : IN std_logic_vector(((n/2) - 1) DOWNTO 0);
			loadEnable: IN std_logic;
			countEnable: IN std_logic;
			reset, clock : IN std_logic;
			output : OUT std_logic_vector(((n/2) - 1) DOWNTO 0)		
			);
END registerD;

-- Register D is reponsible to shift the input to the right
-- each time is used to keep track the number of times register B
-- and C need to be shifted based on number of bits passed. 
ARCHITECTURE behavior_registerD OF registerD IS
BEGIN
	PROCESS(reset, clock)
	VARIABLE shiftBits: std_logic_vector(((n/2) - 1) DOWNTO 0);
		BEGIN 
			IF reset = '0' THEN
				shiftBits := (OTHERS => '1');
			ELSIF RISING_EDGE(clock) THEN
				IF loadEnable = '1' THEN
					shiftBits := (OTHERS => '1');
				ELSIF countEnable = '1' THEN
					FOR i IN 0 TO ((n/2)-2) LOOP
						shiftBits(i) := input(i+1); -- Shifts bits to the right
					END LOOP;
					shiftBits((n/2)-1) := '0';
				END IF;
			END IF;
		output <= shiftBits;
	END PROCESS;	
END behavior_registerD;	