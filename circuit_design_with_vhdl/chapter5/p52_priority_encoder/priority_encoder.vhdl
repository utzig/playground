-- Problem 5.2

library ieee;
use ieee.std_logic_1164.all;

entity priority_encoder is
	port (
		inp: in std_logic_vector (7 downto 1);
		outp: out std_logic_vector (2 downto 0)
	);
end priority_encoder;

architecture priority_encoder of priority_encoder is
begin
	-- (a) solution using only operators
	-- TODO!

	-- (b) solution using when ... else
	outp <= "111" when (inp and "1000000") = "1000000" else
	        "110" when (inp and "1100000") = "0100000" else
	        "101" when (inp and "1110000") = "0010000" else
	        "100" when (inp and "1111000") = "0001000" else
	        "011" when (inp and "1111100") = "0000100" else
	        "010" when (inp and "1111110") = "0000010" else
	        "001" when (inp and "1111111") = "0000001" else
	        "000";
end priority_encoder;
