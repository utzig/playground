-- Problem 5.3

library ieee;
use ieee.std_logic_1164.all;

entity simple_muldiv is
	port (
		a, b: in integer range 0 to 255;
		x: out integer range 0 to 65535;
		y: out integer range 0 to 255
	);
end simple_muldiv;

architecture simple_muldiv of simple_muldiv is
begin
	x <= a * b;
	y <= a / 2;
end simple_muldiv;
