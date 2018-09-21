LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY Lab_1_2 is
	PORT(clock, resetn, ivalid, iready: IN std_logic;
		  datain: IN std_logic_vector(7 downto 0);
		  oready, ovalid: OUT std_logic;
		  dataout: OUT std_logic_vector(7 downto 0));
END Lab_1_2;

ARCHITECTURE structure of Lab_1_2 is
	--Write the component instantiation here
	COMPONENT Lab3_1 
	PORT (
			clock, reset, ivalid: IN std_logic;
			input: IN std_logic_vector(2 DOWNTO 0);
			output: OUT std_logic_vector(7 DOWNTO 0)
		   );
	END COMPONENT; 
	BEGIN
	--Map your component here
	
	trafficColors: COMPONENT Lab3_1 PORT MAP (clock => clock, reset => resetn, 
															ivalid => ivalid, input => datain(2 DOWNTO 0),
															output => dataout);
END structure;
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	