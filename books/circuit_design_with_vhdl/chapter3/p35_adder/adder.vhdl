-- Problem 3.5

library ieee;
use ieee.std_logic_1164.all;

-- this is not ieee standard!
-- use ieee.std_logic_arith.all;

use ieee.numeric_std.all;

entity adder is
	port (
		a, b: in std_logic_vector (3 downto 0);
		sum: out std_logic_vector (4 downto 0)
	);
end adder;

architecture adder of adder is
begin
	sum <= std_logic_vector(('0' & unsigned(a)) + ('0' & unsigned(b)));
end adder;
