-- Name: Rodrigo Rojas
--	Contact: rrojas@clemson.edu
--	Purpose: Top-level entity 
-- Board: DE1_SoC

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
--use work.common.all;


ENTITY bitpair IS
	GENERIC(i : INTEGER := 8);
  PORT ( 
			clock, resetn, ivalid, iready 	: in std_logic;
			datain 				: in std_logic_vector (15 downto 0);
			oready, ovalid 			: out std_logic;
			dataout 				: out std_logic_vector (15 downto 0));
END bitpair;

ARCHITECTURE structure OF bitpair IS

	-- Component of State machine "control"
	COMPONENT control 
	PORT (
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
	END COMPONENT; 

	-- Component of Register A responsinble to hold the multiplicand 
	COMPONENT registerA 
	GENERIC(n : INTEGER := i);
		PORT (
				input : IN std_logic_vector((n-1) DOWNTO 0);
				reset, clock : IN std_logic;
				loadEnable: IN std_logic;
				multiplicand : OUT std_logic_vector((n-1) DOWNTO 0)
				);
	END COMPONENT;
	
	-- Component of Shift Register B responsible to hold the multiplier and
	-- the shifted value of the multiplicand 
	COMPONENT registerB
	GENERIC(n : INTEGER := i);
		PORT (
				input: IN std_logic_vector((n-1) DOWNTO 0);
				inputS: IN std_logic_vector((n-1) DOWNTO 0);
				twoBits : IN std_logic_vector(1 DOWNTO 0);
				clock : IN std_logic;
				reset : IN std_logic;
				loadEnable: IN std_logic;
				shiftEnable: IN std_logic;
				bitsToMul: OUT std_logic_vector(2 DOWNTO 0);
				output : OUT std_logic_vector((n-1) DOWNTO 0)
				);
		END COMPONENT;
		
	-- Component of Shift Register C responsible to hold the "bit pair"
	-- addition method value
	COMPONENT registerC
	GENERIC(n : INTEGER := i);
		PORT (
				input: IN std_logic_vector((n-1) DOWNTO 0); --  Input for Register C
				signBit: IN std_logic;	-- Sign bit from Multiplexer
				clock: IN std_logic;		-- Clock
				reset: IN std_logic;		-- Reset 
				shiftEnable: IN std_logic;	-- Enables the shift of bits on Register C
				loadEnable: IN std_logic;	-- Enables the load of bits on Register C
				addEnable: IN std_logic;	-- Enables the add bits of Register C
				output: OUT std_logic_vector((n-1) DOWNTO 0); -- Outputs current value of Register C
				bitsToB: OUT std_logic_vector(1 DOWNTO 0)	-- Outputs last two bits lost by shift to Register B
				);
	END COMPONENT;
	
	-- Component of Shift Register D responsible of keeping track 
	-- of the number of times registers C and B need to be shifted 
	COMPONENT registerD
	GENERIC(n : INTEGER := i);
		PORT (
				input : IN std_logic_vector(((n/2) - 1) DOWNTO 0);
				loadEnable: IN std_logic;
				countEnable: IN std_logic;
				reset, clock : IN std_logic;
				output : OUT std_logic_vector(((n/2) - 1) DOWNTO 0)		
				);
	END COMPONENT;
	
	-- Component responsible to return the value of "bit pair" method
	-- based on the last three bits from Register B
	COMPONENT multiplexer
	GENERIC(n : INTEGER := i);
		PORT (
				registerA : IN std_logic_vector((n-1) DOWNTO 0);
				selectPin : IN std_logic_vector(2 DOWNTO 0);
				signBit: OUT std_logic; 
				output: OUT std_logic_vector((n-1) DOWNTO 0)
				);
	END COMPONENT;
	
	-- Component responsible to add the value of Register C
	-- and value from multiplexer 
	COMPONENT adder
	GENERIC(n : INTEGER := i);
		PORT (
				Cin: IN std_logic;
				registerC, bitPair: IN std_logic_vector((n-1) DOWNTO 0);
				sum: OUT std_logic_vector((n-1) DOWNTO 0);
				Cout: OUT std_logic
				);
	END COMPONENT;
		
	-- Signals used to connect the hardware 	
	SIGNAL registerD_output: std_logic_vector(((i/2) - 1) DOWNTO 0);
	SIGNAL busyOutput: std_logic;
	SIGNAL loadOutput: std_logic;
	SIGNAL shiftOutput: std_logic;
	SIGNAL addOutput: std_logic;
	SIGNAL resetOutput: std_logic;
	SIGNAL countOutput: std_logic;
	SIGNAL registerA_output: std_logic_vector((i-1) DOWNTO 0);
	SIGNAL registerC_output: std_logic_vector((i -1) DOWNTO 0);
	SIGNAL adderSum: std_logic_vector((i - 1) DOWNTO 0);
	SIGNAL adderCout: std_logic;
	SIGNAL registerB_bitsOutput: std_logic_vector(2 DOWNTO 0);
	SIGNAL multiplexer_signBitOutput: std_logic;
	SIGNAL multiplexerOutput: std_logic_vector((i-1) DOWNTO 0);
	SIGNAL registerC_bitsToB: std_logic_vector(1 DOWNTO 0);
	SIGNAL registerB_output: std_logic_vector((i-1) DOWNTO 0);
	

BEGIN

	-- State machine ctrl, controls the state in which hardware is operating 
	ctrl: COMPONENT control PORT MAP (clock => clock, reset => resetn, start => ivalid, timeCount => registerD_output(0),
												 busy => busyOutput, load => loadOutput, shift => shiftOutput, add => addOutput,
												 resetO => resetOutput, countO => countOutput, ovalid => ovalid);
	
	-- Register A component, returns the multiplicand value 
	register_A: COMPONENT registerA PORT MAP(input => datain(((i*2) - 1) DOWNTO i), reset => resetOutput, clock => clock,
														  loadEnable => loadOutput, multiplicand => registerA_output);
	
	-- Register D component, responisble for number of times register C and B shift 
	register_D: COMPONENT registerD PORT MAP(input => registerD_output, loadEnable => loadOutput, countEnable => countOutput,
														  reset => resetOutput, clock => clock, output => registerD_output);
	
	-- Register B component returns last three bits to multiplexer and shifts value to the right two places 
	register_B: COMPONENT registerB PORT MAP(input => datain((i-1) DOWNTO 0), inputS => registerB_output, twoBits => registerC_bitsToB, clock => clock, reset => resetOutput, 
														  loadEnable => loadOutput, shiftEnable => shiftOutput, bitsToMul => registerB_bitsOutput, 
														  output => registerB_output);
	
	-- Multiplexer responsible to return the "bit pair" value of A based on three bits passed by Register B
	multi: COMPONENT multiplexer PORT MAP(registerA => registerA_output, selectPin =>  registerB_bitsOutput, signBit => multiplexer_signBitOutput,
													  output => multiplexerOutput);
	
	-- Register C responsible to hold addition of multiplexer and current value of register as well as passing last two bits to Register B after shifting 
	register_C: COMPONENT registerC PORT MAP(input => adderSum, signBit => multiplexer_signBitOutput, clock => clock, reset => resetOutput,
														  shiftEnable => shiftOutput, loadEnable => loadOutput, addEnable => addOutput, output => registerC_output,
														  bitsToB => registerC_bitsToB);
	
	-- Adder component responsible to add current value of Register C and output of multiplexer 
	add_adder: COMPONENT adder PORT MAP(Cin => '0', registerC => registerC_output, bitPair => multiplexerOutput, sum => adderSum,
													Cout => adderCout);
				
	-- Sets the final output to OUTPUT dataout 
	dataout(((i*2) - 1) DOWNTO i) <= registerC_output; 
	dataout((i-1) DOWNTO 0) <= registerB_output;
	oready <= busyOutput;

END structure;