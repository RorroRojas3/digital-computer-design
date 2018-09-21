--	Name: Rodrigo Rojas
--	Contact: rrojas@clemson.edu
--	Purpose: Shifting Register B


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY registerB IS 
	GENERIC (n: INTEGER := 8);
	PORT (input: IN std_logic_vector((n-1) DOWNTO 0);
			inputS: IN std_logic_vector((n-1) DOWNTO 0);
			twoBits : IN std_logic_vector(1 DOWNTO 0);
			clock : IN std_logic;
			reset : IN std_logic;
			loadEnable: IN std_logic;
			shiftEnable: IN std_logic;
			bitsToMul: OUT std_logic_vector(2 DOWNTO 0);
			output : OUT std_logic_vector((n-1) DOWNTO 0)
			);
END registerB;

-- Register B will set its register to all 0's if and only if 
-- the value of reset is 0, otherwise it will check the value of loadEnable
-- and shiftenable. If loadEnable is of value '1' it will set the output 
-- equal to input through a variable and set the last three bits of input
-- to output bitsToMul. If shiftEnable is '1' it will shift the input value 
-- and set it as output and send the last three bits of input to output
-- bitsToMul
ARCHITECTURE behavior_registerB OF registerB IS
BEGIN
	PROCESS(clock, reset)
		VARIABLE allBits: std_logic_vector((n-1) DOWNTO 0);
		BEGIN
			IF reset = '0' THEN -- Reset everything to 0
				allBits := (OTHERS => '0');
				bitsToMul <= "000";
			ELSIF RISING_EDGE(clock) THEN
				IF loadEnable = '1' AND shiftEnable = '0' THEN
					allBits := input;
					bitsToMul <= allBits(1 DOWNTO 0) & '0';
				ELSIF shiftEnable = '1' AND loadEnable = '0' THEN
					bitsToMul(0) <= inputS(1);
					FOR i IN 0 TO (n-3) LOOP
						allBits(i) := inputS(i + 2);
					END LOOP;
					--allBits(n-3 DOWNTO 0) := inputS((n-1) DOWNTO 2);
					allBits(n-2) := twoBits(0);
					allBits(n-1) := twoBits(1);
					bitsToMul(2 DOWNTO 1) <= allBits(1 DOWNTO 0);
				END IF;
			END IF;	
			output <= allBits;
	END PROCESS;
END behavior_registerB;