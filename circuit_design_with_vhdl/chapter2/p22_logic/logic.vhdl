-- Problem 2.2

library ieee;
use ieee.std_logic_1164.all;

entity logic is
	port (
		a, b, c: in bit;
		d: out bit
	);
end logic;

architecture logic of logic is
begin
	d <= ((a and b) or (not c)) nand a;
end logic;
