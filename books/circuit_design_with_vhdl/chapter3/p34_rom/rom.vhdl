-- Problem 3.4

entity rom is
	port (
		-- row to read
		a: in bit_vector (2 downto 0);
		-- row output data
		b: out bit_vector (3 downto 0)
	);
end rom;

architecture rom of rom is
	type word is array (3 downto 0) of bit;
	type rom is array (0 to 7) of word;

	constant my_rom: rom := (
		"0000",
		"0001",
		"0010",
		"0100",
		"1111",
		"1110",
		"1101",
		"1011"
	);

	signal x: word;
begin
	-- FIXME: check how to remove x and assign directly to b
	with a select
		x <=
			my_rom(0) when "000",
			my_rom(1) when "001",
			my_rom(2) when "010",
			my_rom(3) when "011",
			my_rom(4) when "100",
			my_rom(5) when "101",
			my_rom(6) when "110",
			my_rom(7) when "111";
	b(3) <= x(3);
	b(2) <= x(2);
	b(1) <= x(1);
	b(0) <= x(0);
end rom;
