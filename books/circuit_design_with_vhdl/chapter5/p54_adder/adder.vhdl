-- Problem 5.4

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
	port (
		a, b: in std_logic_vector (7 downto 0);
		sum: out std_logic_vector (7 downto 0);
		cout: out std_logic
	);
end adder;

architecture adder of adder is
	signal x: unsigned (8 downto 0);
begin
	x <= unsigned('0' & a) + unsigned('0' & b);
	sum <= std_logic_vector(x(7 downto 0));
	cout <= std_logic(x(8));
end adder;
