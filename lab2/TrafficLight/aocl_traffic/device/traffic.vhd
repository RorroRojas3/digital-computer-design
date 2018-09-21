LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY traffic is
	PORT(clock, resetn, ivalid, iready: IN std_logic;
		  datain: IN std_logic_vector(7 downto 0);
		  oready, ovalid: OUT std_logic;
		  dataout: OUT std_logic_vector(7 downto 0));
END traffic;

ARCHITECTURE structure of traffic is
	--Instantiate your traffic_decoder component here.
	COMPONENT traffic_decoder
		PORT (input: IN std_logic_vector(2 DOWNTO 0);
			  enable: IN std_logic;
			  output: OUT std_logic_vector(7 DOWNTO 0));
	END COMPONENT;
BEGIN
	--Map your component here.  Your data will come in on the lowest 3 bits
	--of datain
	--Your output should go to dataout
	--ivalid states when the data is valid coming from the host.  
	--So ivalid will be used as your chip enable	
	TrafficDecoder: COMPONENT traffic_decoder PORT MAP (input => datain(2 DOWNTO 0), enable => ivalid, output => dataout);
END structure;
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	
