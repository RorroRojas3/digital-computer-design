-- Author: Rodrigo Ignacio Rojas Garcia
-- Contact: rrojas@clemson.edu
-- Purpose: Create a 3-bit to 8-bit decoder

-- Declares library ieee and uses it
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Creates main entity called "traffic" wich contains
-- 5 inputs and three outputs.
ENTITY traffic is
	PORT(clock, resetn, ivalid, iready: IN std_logic;
		  datain: IN std_logic_vector(7 downto 0);
		  oready, ovalid: OUT std_logic;
		  dataout: OUT std_logic_vector(7 downto 0));
END traffic;

-- Architecture of entity "traffic" uses component "traffic_decoder" 
-- and entity "traffic" port maps its input to the "Traffic_decoder" inputs
-- which will be used by OpenCL to display human readable output 
ARCHITECTURE structure of traffic is
	--Instantiate your traffic_decoder component here.
	COMPONENT traffic_decoder
		PORT (input: IN std_logic_vector(2 DOWNTO 0);
			  enable: IN std_logic;
			  output: OUT std_logic_vector(7 DOWNTO 0));
	END COMPONENT;
BEGIN
	-- Maps inputs and outputs from traffic entity to traffic_decoder entity 
	TrafficDecoder: COMPONENT traffic_decoder PORT MAP (input => datain(2 DOWNTO 0), enable => ivalid, output => dataout);
END structure;
		
		
		
		
