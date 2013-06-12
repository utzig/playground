-- Problem 5.1

library ieee;
use ieee.std_logic_1164.all;

package types is
	-- number of sel lines
	constant n: integer := 3;
	-- number of input/output lines
	constant m: integer := 4;
	type vector_array is array (natural range <>) of
		std_logic_vector (m-1 downto 0);
end types;

library ieee;
use ieee.std_logic_1164.all;
use work.types.all;

entity genmux is
	port (
		-- number of inputs is based on n
		a: in vector_array (0 to (2**n)-1);
		sel: in integer range 0 to (2**n)-1;
		y: out std_logic_vector (m-1 downto 0)
	);
end genmux;

architecture genmux of genmux is
begin
	y <= a(sel);
end genmux;
