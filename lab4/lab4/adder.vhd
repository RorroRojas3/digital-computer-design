-- Name: Rodrigo Rojas
-- Contact: rrojas@clemson.edu
-- Purpose: Adder

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder IS
	GENERIC (n: INTEGER := 8);
	PORT(Cin: IN std_logic;
		  registerC, bitPair: IN std_logic_vector((n-1) DOWNTO 0);
		  sum: OUT std_logic_vector((n-1) DOWNTO 0);
		  Cout: OUT std_logic
		 );
END adder;

-- Adder is responsible to add two numbers passed and returns
-- the sum in output "sum" and the carry bit in output "Cout"
ARCHITECTURE structure_adder OF adder IS
	COMPONENT FullAdder 
		PORT (B, A, Cin: IN std_logic;
				Cout, Sum: OUT std_logic);
	END COMPONENT;
	SIGNAL C: std_logic_vector(0 TO n);
BEGIN 
	C(0) <= Cin;
	Generate_label:
	FOR i IN 0 TO (n-1) GENERATE 
		stage: FullAdder PORT MAP (B => bitPair(i),A => registerC(i), 
											Cin => C(i), Cout => C(i + 1),Sum => sum(i));
	END GENERATE;
	Cout <= C(n); -- Does not matter
END structure_adder;
