-- Author: Rodrigo Ignacio Rojas Garcia

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Lab3_1 IS PORT
			(
			 clock, reset, ivalid: IN std_logic;
			 input: IN std_logic_vector(2 DOWNTO 0);
			 output: OUT std_logic_vector(7 DOWNTO 0)
			);
END Lab3_1;

ARCHITECTURE behavior_Lab3 of Lab3_1 IS

	TYPE color_state IS (flash_red, red, green, yellow, left_turn,
							  right_turn);
	SIGNAL trafficColors: color_state;
	
	BEGIN
		PROCESS (clock, reset)
			BEGIN 
				IF reset = '0' THEN	
					trafficColors <= flash_red;
				ELSIF RISING_EDGE(clock) AND ivalid = '1' THEN
					CASE trafficColors IS
						WHEN flash_red =>
							trafficColors <= flash_red;
						WHEN red => 
							IF input = "000" THEN
								trafficColors <= red;
							ELSIF input = "001" THEN
								trafficColors <= right_turn;
							ELSIF input(2 DOWNTO 1) = "01" THEN
								trafficColors <= green;
							ELSIF input(2) = '1' THEN
								trafficColors <= left_turn;
							END IF;
						WHEN yellow =>
							IF input(0) = '0' THEN
								trafficColors <= red;
							ELSIF input(0) = '1' THEN
								trafficColors <= right_turn;
							END IF;
						WHEN right_turn =>
							trafficColors <= red;
						WHEN green =>
							trafficColors <= yellow;	
						WHEN left_turn =>
							IF input(1) = '1' THEN
								trafficColors <= green;
							ELSIF input(0) = '1' THEN
								trafficColors <= green;
							ELSIF input(1 DOWNTO 0) = "00" THEN
								trafficColors <= yellow;
							END IF;
						WHEN OTHERS => trafficColors <= flash_red;
					END CASE;
			END IF;
		END PROCESS;
			
		PROCESS (trafficColors) 
			BEGIN 
				CASE trafficColors IS
					WHEN green => output <= "11111110";
					WHEN yellow	=> output <= "11111101";
					WHEN red =>	output <= "11111011";
					WHEN left_turn => output <= "11110111";
					WHEN right_turn => output <= "11011111";
					WHEN flash_red => output <= "01111111";
					WHEN OTHERS => output <= "01111111";
				END CASE;
		END PROCESS;
				
END behavior_Lab3;
	