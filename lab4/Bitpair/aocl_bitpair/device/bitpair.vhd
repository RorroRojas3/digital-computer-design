library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.common.all;





entity bitpair is
    port ( clock, resetn, ivalid, iready 	: in std_logic;
	   datain 				: in std_logic_vector (15 downto 0);
	   oready, ovalid 			: out std_logic;
	   dataout 				: out std_logic_vector (15 downto 0));
end bitpair;





architecture structure of bitpair is


end structure;