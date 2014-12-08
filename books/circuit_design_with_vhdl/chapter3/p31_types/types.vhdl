-- Problem 3.1

library ieee;
use ieee.std_logic_1164.all;

entity types is
end types;

architecture types of types is
	type array1 is array (7 downto 0) of std_logic;
	type array2 is array (3 downto 0, 7 downto 0) of std_logic;
	type array3 is array (3 downto 0) of array1;

	-- scalar
	signal a: bit;
	-- scalar
	signal b: std_logic;
	-- 1D
	signal x: array1;
	-- 2D
	signal y: array2;
	-- 1Dx1D
	signal w: array3;
	-- 1D
	signal z: std_logic_vector (7 downto 0);
begin
	-- can't match indexed name with type bit
	--a <= x(2);

	-- OK
	b <= x(2);

	-- OK
	b <= y(3, 5);

	-- static constant violates bounds
	--b <= w(5)(3);

	-- number of indexes mismatches array dimension
	-- y(1)(0) <= z(7);

	-- OK
	x(0) <= y(0, 0);

	-- OK
	x <= "11100000";

	-- can't match string literal "00000000" with type bit
	--a <= "00000000";

	-- number of indexes mismatches array dimension
	--y(1) <= x;

	-- can't match signal "y" with type array type "array1"
	--w(0) <= y;

	-- OK
	w(1) <= (7 => '1', others => '0');

	-- number of indexes mismatches array dimension
	--y(1) <= (0 => '0', others => '1');

	-- OK
	w(2)(7 downto 0) <= x;

	-- can't match slice with type array type "array1"
	--w(0)(7 downto 6) <= z(5 downto 4);

	-- can't match slice with type std_ulogic
	--x(3) <= x(5 downto 5);

	-- can't match slice with type std_ulogic
	--b <= x(5 downto 5);

	-- OK
	y <= ((others => '0'), (others => '0'),
	      (others => '0'), "10000001");

	-- OK
	z(6) <= x(5);

	-- can't match slice with type array type "std_logic_vector"
	--z(6 downto 4) <= x(5 downto 3);

	-- number of indexes mismatches array dimension
	--z(6 downto 4) <= y(5 downto 3);

	-- number of indexes mismatches array dimension
	--y(6 downto 4) <= z(3 to 5);

	-- multi-dimensional slice is forbidden
	--y(0, 7 downto 0) <= z;

	-- number of indexes mismatches array dimension
	--w(2, 2) <= '1';
end types;
