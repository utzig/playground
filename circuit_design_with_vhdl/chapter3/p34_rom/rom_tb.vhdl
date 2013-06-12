entity rom_tb is
end rom_tb;

architecture behav of rom_tb is
	component rom
		port (
			a: in bit_vector (2 downto 0);
			b: out bit_vector (3 downto 0)
		);
	end component;
	for rom_0: rom use entity work.rom;
	signal a: bit_vector (2 downto 0);
	signal b: bit_vector (3 downto 0);
begin
	rom_0: rom port map (a => a, b => b);

	process
		type pattern_type is record
			a: bit_vector (2 downto 0);
			b: bit_vector (3 downto 0);
		end record;
		type pattern_array is array (natural range <>) of pattern_type;
		constant patterns : pattern_array := (
			("000", "0000"),
			("001", "0001"),
			("010", "0010"),
			("011", "0100"),
			("100", "1111"),
			("101", "1110"),
			("110", "1101"),
			("111", "1011")
		);
	begin
		for i in patterns'range loop
			a <= patterns(i).a;
			wait for 1 ns;
			assert b = patterns(i).b
				report "bad output value" severity error;
		end loop;
		assert false report "end of test" severity note;
		--  Wait forever; this will finish the simulation.
		wait;
	end process;
end behav;
