-- Problem 5.7
-- simple barrel shifter

library ieee;
use ieee.std_logic_1164.all;

entity barshift is
	port (
		inp: in std_logic_vector (7 downto 0);
		shift: in std_logic;
		outp: out std_logic_vector (7 downto 0)
	);
end barshift;

architecture barshift of barshift is
begin
	with shift select
		outp <=
			inp(6 downto 0) & '0' when '1',
			inp when others;
end barshift;
