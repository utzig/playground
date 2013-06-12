entity logic_tb is
end logic_tb;

architecture behav of logic_tb is
	component logic
		port (
			a, b, c: in bit;
			d: out bit
		);
	end component;
	for logic_0: logic use entity work.logic;
	signal a, b, c, d: bit;
begin
	logic_0: logic port map (a => a, b => b, c => c, d => d);

	process
		type pattern_type is record
			a, b, c, d: bit;
		end record;
		type pattern_array is array (natural range <>) of pattern_type;
		constant patterns : pattern_array := (
			('0', '0', '0', '1'),
			('0', '0', '1', '1'),
			('0', '1', '0', '1'),
			('0', '1', '1', '1'),
			('1', '0', '0', '0'),
			('1', '0', '1', '1'),
			('1', '1', '0', '0'),
			('1', '1', '1', '0')
		);
	begin
		for i in patterns'range loop
			a <= patterns(i).a;
			b <= patterns(i).b;
			c <= patterns(i).c;
			wait for 1 ns;
			assert d = patterns(i).d
				report "bad output value" severity error;
		end loop;
		assert false report "end of test" severity note;
		--  Wait forever; this will finish the simulation.
		wait;
	end process;
end behav;
