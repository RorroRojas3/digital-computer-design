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
ENTITY traffic_machine IS PORT
			(
			 clock, reset, ivalid: IN std_logic;
			 input: IN std_logic_vector(2 DOWNTO 0);
			 output: OUT std_logic_vector(7 DOWNTO 0)
			);
END traffic_machine;

-- Archictecture of "traffic_machine" will check the 3-bit input value
-- and will determine in which state the traffic light is on
-- and set the corresponding color to the output based on the state 
ARCHITECTURE behavior_traffic_machine of traffic_machine IS

	TYPE color_state IS (flash_red, red, green, yellow, left_turn,
							  right_turn);
	SIGNAL trafficColors: color_state;
	
	BEGIN
		PROCESS (clock, reset)	-- Process based on values of inputs "clock" and "reset" 
			BEGIN 
				IF reset = '0' THEN	-- If input "reset" is of value "0", it resets to starting state "flash_red"
					trafficColors <= flash_red;
				ELSIF RISING_EDGE(clock) AND ivalid = '1' THEN
					CASE trafficColors IS								-- Case statement which uses signal "trafficColor" as a base
						WHEN flash_red => trafficColors <= red;	-- When signal "trafficColors" is "flash_red", sets signal "trafficColors" to "flash_red" state
						WHEN red => 										-- When signal "trafficColors" is "red", sets signal "trafficColors" to either "red", "right_turn", "green", or "left_turn" based on input
							IF input = "000" THEN
								trafficColors <= red;
							ELSIF input = "001" THEN
								trafficColors <= right_turn;
							ELSIF input(2 DOWNTO 1) = "01" THEN
								trafficColors <= green;
							ELSIF input(2) = '1' THEN
								trafficColors <= left_turn;
							END IF;
						WHEN yellow =>										-- When signal "trafficColors" is "yellow", sets signa; "trafficColors" to "red" or "right_turn" based on input
							IF input(0) = '0' THEN
								trafficColors <= red;
							ELSIF input(0) = '1' THEN
								trafficColors <= right_turn;
							END IF;
						WHEN right_turn =>								-- When signal "trafficColors" is "right_turn", sets signal "trafficColors" to "red"
							trafficColors <= red;
						WHEN green =>										-- When signal "trafficColors" is "green", sets signal "trafficColors" to "yellow"
							trafficColors <= yellow;					
						WHEN left_turn =>									-- When signal "trafficColors" is "left_turn", sets signal "trafficColors" to "green" or "yellow" based on input
							IF input(1) = '1' THEN
								trafficColors <= green;
							ELSIF input(0) = '1' THEN
								trafficColors <= green;
							ELSIF input(1 DOWNTO 0) = "00" THEN
								trafficColors <= yellow;
							END IF;
						WHEN OTHERS => trafficColors <= flash_red;	-- When signal "trafficColors" has an unkown state, it resets to "flash_red"
					END CASE;
			END IF;
		END PROCESS;
			
		PROCESS (trafficColors) -- Process based on value of signal "trafficColors"
			BEGIN 
				CASE trafficColors IS
					WHEN green => output <= "11111110";		-- If "trafficColors" is of "green" state, output set to this value
					WHEN yellow => output <= "11111101";	-- If "trafficColors" is of "yellow" state, output set to this value
					WHEN red => output <= "11111011";		-- If "trafficColors" is of "red" state, output set to this value
					WHEN left_turn => output <= "11110111";	-- If "trafficColors" is of "left_turn" state, output set to this value
					WHEN right_turn => output <= "11011111";	-- If "trafficColors" is of "right_turn" state, output set to this value
					WHEN flash_red => output <= "01111111";	-- If "trafficColors" is of "flash_red" state, output set to this value
					WHEN OTHERS => output <= "11111111";	-- If "trafficColors" is of unkown state, output set to this value
				END CASE;
		END PROCESS;
				
END behavior_traffic_machine;
	
