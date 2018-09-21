library ieee;
use ieee.std_logic_1164.all;

entity traffic_decoder is
	port(input			: in std_logic_vector(2 downto 0);
	     enable			: in std_logic;
	     output			: out std_logic_vector(7 downto 0));
end traffic_decoder;


architecture behavior of traffic_decoder is
begin
	--Put your code here to describe the decoder.  Your process should be
	--sensitive to both input and enable and should only change when 
	--the enable pin is high!
	PROCESS(input, enable)
		BEGIN
			CASE enable IS
				WHEN '1' => -- Case when deEnable is of value 1
					CASE input IS 
						WHEN "000" => output <= "11111110"; -- Case when decInputs is 0
						WHEN "001" => output <= "11111101";	-- Case when decInputs is 1
						WHEN "010" => output <= "11111011";	-- Case when decInputs is 2
						WHEN "011" => output <= "11110111";	-- Case when decInputs is 3
						WHEN "100" => output <= "11101111";	-- Case when decInputs is 4
						WHEN "101" => output <= "11011111";	-- Case when decInputs is 5
						WHEN "110" => output <= "10111111";	-- Case when decInputs is 6
						WHEN "111" => output <= "01111111";	-- Case when decInputs is 7
						WHEN OTHERS => output <= "11111111";	-- Case when decInputs is not of value between 0-7
					END CASE;
				WHEN OTHERS => output <= "11111111"; -- Case when decEnable is 0
			END CASE;
		END PROCESS;
end behavior;					
