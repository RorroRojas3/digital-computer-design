-- Author: Rodrigo Ignacio Rojas Garcia
-- Contact: rrojas@clemson.edu
-- Purpose: State Diagram 
-- Board: DE1_SoC

-- Standard library ieee is used along with its sub-library std_logic_1644
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Entity of Traffic State Machine is delcared with four inputs 
-- and one output. The inputs will determine the output of the
-- traffic light color 
ENTITY control IS PORT
			(
			 clock: IN std_logic;
			 reset: IN std_logic;
			 start: IN std_logic;
			 timeCount: IN std_logic;
			 busy: OUT std_logic;
			 load: OUT std_logic;
			 shift: OUT std_logic;
			 add: OUT std_logic;
			 resetO : OUT std_logic;
			 countO: OUT std_logic;
			 ovalid: OUT std_logic
			);
END control;

-- Archictecture of "control" will check the current state of 
-- state machine "controlState" and set it to the corresponding state. Then
-- depending on the current state it will set values to outputs, busy, shift, load,
-- add, resetO, and countO. 
ARCHITECTURE behavior_control of control IS
	TYPE machine_state IS (loadReg, shiftReg, addReg, done, resetS, startS);
	SIGNAL controlState: machine_state;	
	BEGIN
		PROCESS (clock, reset)	-- Process based on values of inputs "clock" and "reset" 
			BEGIN 
				IF reset = '0' THEN	-- If input "reset" is of value "0", it resets to starting state "flash_red"
					controlState <= resetS;
				ELSIF RISING_EDGE(clock) THEN
					CASE controlState IS								-- Case statement which uses signal "controlState" as a base
							WHEN resetS =>
								IF start = '1' THEN
									controlState <= startS;
								ELSIF start = '0' THEN
									controlState <= resetS;
								END IF;
							WHEN startS =>
								controlState <= loadReg;
							WHEN loadReg => 
								controlState <= addReg;
							WHEN addReg =>
								controlState <= shiftReg;
							WHEN shiftReg =>
								IF timeCount = '1' THEN
									controlState <= addReg;
								ELSIF timeCount = '0' THEN
									controlState <= done;
								END IF;
							WHEN done => 
								IF start = '0' THEN 
									controlState <= resetS;
								END IF;
							WHEN OTHERS => controlState <= done;
					END CASE;
			END IF;
		END PROCESS;
			
		PROCESS (controlState) -- Process based on value of signal "trafficColors"
			BEGIN 
				CASE controlState IS
					WHEN resetS =>
						busy <= '0';
						load <= '0';
						shift <= '0';
						add <= '0';
						resetO <= '0';
						countO <= '0';
						ovalid <= '0';
					WHEN startS =>
						busy <= '0';
						load <= '0';
						shift <= '0';
						add <= '0';
						resetO <= '1';
						countO <= '0';
						ovalid <= '0';
					WHEN loadReg =>
						busy <= '1';
						load <= '1';
						shift <= '0';
						add <= '0';
						resetO <= '1';
						countO <= '0';
						ovalid <= '0';
					WHEN addReg =>
						busy <= '1';
						load <= '0';
						shift <= '0';
						add <= '1';
						resetO <= '1';
						countO <= '1';
						ovalid <= '0';
					WHEN shiftReg =>
						busy <= '1';
						load <= '0';
						shift <= '1';
						add <= '0';
						resetO <= '1';
						countO <= '0';
						ovalid <= '0';
					WHEN done =>
						busy <= '0';
						load <= '0';
						shift <= '0';
						add <= '0';
						resetO <= '1';
						countO <= '0';
						ovalid <= '1';
					WHEN OTHERS => 
						busy <= '0';
						load <= '0';
						shift <= '0';
						add <= '0';
						resetO <= '1';
						countO <= '0';
						ovalid <= '1';
				END CASE;
		END PROCESS;
				
END behavior_control;
	