-- Name: Rodrigo Rojas
-- Contact: rrojas@clemson.edu
-- Purpose: Shifting Register C

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY registerC IS
	GENERIC(n: INTEGER := 8);
	PORT (input: IN std_logic_vector((n-1) DOWNTO 0); --  Input for Register C
			signBit: IN std_logic;	-- Sign bit from Multiplexer
			clock: IN std_logic;		-- Clock
			reset: IN std_logic;		-- Reset 
			shiftEnable: IN std_logic;	-- Enables the shift of bits on Register C
			loadEnable: IN std_logic;	-- Enables the load of bits on Register C
			addEnable: IN std_logic;	-- Enables the add bits of Register C
			output: OUT std_logic_vector((n-1) DOWNTO 0); -- Outputs current value of Register C
			bitsToB: OUT std_logic_vector(1 DOWNTO 0)	-- Outputs last two bits lost by shift to Register B
			);
END registerC;

-- Register C will set its value to all 0's if and only if
-- the value of reset is 0. Otherwise it will check the value of inputs
-- addEnable and loadEnable. If loadEnable input is '1', it will set the value
-- of Register C to 0 and send last two bits of C to output bitsToB. If 
-- addEnable is '1' it will set last two bits of C to output bitsToB
-- then it will shift the input value and set it to the output. 
ARCHITECTURE behavior_registerC OF registerC IS
BEGIN 
	PROCESS(clock)
		VARIABLE allBits: std_logic_vector((n-1) DOWNTO 0);
		BEGIN
			IF reset = '0' THEN -- Reset everything to 0
				allBits := (OTHERS => '0');
				bitsToB <= "00";
			ELSIF RISING_EDGE(clock) THEN
				IF addEnable = '1' THEN
					bitsToB <= input(1 DOWNTO 0);
					FOR i IN 0 TO (n-3) LOOP
						allBits(i) := input(i+2); -- Shifts bits to the right
					END LOOP;
					allBits(n-2) := signBit; -- Stores sign bit in first two bits after addition
					allBits(n-1) := signBit;
				ELSIF loadEnable = '1' THEN	
					allBits := (OTHERS => '0');
					bitsToB <= "00";
				END IF;	
			END IF;
			output <= allBits; -- Outputs the final number after shifting 
		END PROCESS;
END behavior_registerC;



