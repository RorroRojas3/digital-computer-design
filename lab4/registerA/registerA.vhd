--	Name: Rodrigo Rojas
--	Contact: rrojas@clemson.edu
--	Purpose: Register A

-- Library Declaration Section
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY registerA IS 
	GENERIC(n : INTEGER := 8);
	PORT (input : IN std_logic_vector((n-1) DOWNTO 0);
			reset, clock : IN std_logic;
			loadEnable: IN std_logic;
			multiplicand : OUT std_logic_vector((n-1) DOWNTO 0)
			);
END registerA;

-- Register A will set the register to all 0's if and only if reset value
-- is 0, otherwise, it will load the value of the multiplicand on the register
-- and hold it until all multiplication process is finished 
ARCHITECTURE behavior_registerA OF registerA IS
BEGIN
	PROCESS(reset, clock)
		BEGIN 
			IF reset = '0' THEN
				multiplicand <= (OTHERS => '0');
			ELSIF RISING_EDGE(clock) THEN
				IF loadEnable = '1' THEN 
					multiplicand <= input;
				END IF;
			END IF;
	END PROCESS;	
END behavior_registerA;	
	