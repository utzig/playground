library ieee;
use ieee.std_logic_1164.all;

entity simple_muldiv_tb is
end simple_muldiv_tb;

architecture behav of simple_muldiv_tb is
	component simple_muldiv
		port (
			a, b: in integer range 0 to 255;
			x: out integer range 0 to 65535;
			y: out integer range 0 to 255
		);
	end component;
	for simple_muldiv_0: simple_muldiv use entity work.simple_muldiv;
	signal a, b: integer range 0 to 255;
	signal x: integer range 0 to 65535;
	signal y: integer range 0 to 255;
begin
	simple_muldiv_0: simple_muldiv port map (a => a, b => b,
	                                         x => x, y => y);

	process
		type pattern_type is record
			a, b: integer range 0 to 255;
			x: integer range 0 to 65535;
			y: integer range 0 to 255;
		end record;
		type pattern_array is array (natural range <>) of pattern_type;
		constant patterns : pattern_array := (
			(1, 0, 0, 0),
			(0, 1, 0, 0),
			(1, 1, 1, 0),
			(2, 1, 2, 1),
			(2, 2, 4, 1),
			(2, 3, 6, 1),
			(3, 3, 9, 1),
			(10, 10, 100, 5),
			(100, 100, 10000, 50),
			(200, 200, 40000, 100),
			(255, 255, 65025, 127)
		);
	begin
		for i in patterns'range loop
			a <= patterns(i).a;
			b <= patterns(i).b;
			wait for 1 ns;
			assert x = patterns(i).x
				report "bad output value at x" severity error;
			assert y = patterns(i).y
				report "bad output value at y" severity error;
		end loop;
		assert false report "end of test" severity note;
		--  Wait forever; this will finish the simulation.
		wait;
	end process;
end behav;
