-- Problem 5.8
-- comparator

-- testbench works but needs fixing warnings
-- NUMERIC_STD.">": metavalue detected, returning FALSE

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparator is
	port (
		a, b: in std_logic_vector (7 downto 0);
		sel: in std_logic;
		x1, x2, x3: out std_logic
	);
end comparator;

architecture comparator of comparator is
	signal sa, sb: signed (7 downto 0);
	signal ua, ub: unsigned (7 downto 0);
	signal s1, s2, s3: std_logic;
	signal u1, u2, u3: std_logic;
begin
	ua <= unsigned(a);
	ub <= unsigned(b);
	u1 <= '1' when ua>ub else '0';
	u2 <= '1' when ua=ub else '0';
	u3 <= '1' when ua<ub else '0';

	sa <= signed(a);
	sb <= signed(b);
	s1 <= '1' when sa>sb else '0';
	s2 <= '1' when sa=sb else '0';
	s3 <= '1' when sa<sb else '0';

	x1 <= s1 when sel='1' else u1;
	x2 <= s2 when sel='1' else u2;
	x3 <= s3 when sel='1' else u3;
end comparator;
