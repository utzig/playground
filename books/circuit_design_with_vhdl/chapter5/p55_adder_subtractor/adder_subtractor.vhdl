-- Problem 5.5

-- Signed/Unsigned Adder/Subtractor

-- sel = "00": add unsigned
-- sel = "01": add signed
-- sel = "10": sub unsigned
-- sel = "11": sub signed

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
	port (
		cin: in std_logic;
		a, b: in std_logic_vector (7 downto 0);
		sel: in std_logic_vector (1 downto 0);
		sum: out std_logic_vector (7 downto 0);
		cout: out std_logic
	);
end adder;

architecture adder of adder is
	signal ua, ub: unsigned (8 downto 0);
	signal sa, sb: signed(7 downto 0);
begin
	x <= unsigned('0' & a) + unsigned('0' & b);
	sum <= std_logic_vector(x(7 downto 0));
	cout <= std_logic(x(8));
end adder;
