library ieee;
use ieee.std_logic_1164.all;

entity comparator_tb is
end comparator_tb;

architecture behav of comparator_tb is
	component comparator
		port (
			a, b: in std_logic_vector (7 downto 0);
			sel: in std_logic;
			x1, x2, x3: out std_logic
		);
	end component;
	for comparator_0: comparator use entity work.comparator;
	signal a, b: std_logic_vector (7 downto 0) := (others => '0');
	signal sel: std_logic := '0';
	signal x1, x2, x3: std_logic;
begin
	comparator_0: comparator port map (a => a,
	                                   b => b,
	                                   sel => sel,
	                                   x1 => x1,
	                                   x2 => x2,
	                                   x3 => x3);
	process
		type pattern_type is record
			a, b: std_logic_vector (7 downto 0);
			sel: std_logic;
			x1, x2, x3: std_logic;
		end record;
		type pattern_array is array (natural range <>) of pattern_type;
		--       a           b       s/u  a>b  a=b  a<b
		constant patterns : pattern_array := (
			("00000000", "00000000", '0', '0', '1', '0'),
			("00000000", "00000000", '1', '0', '1', '0'),
			("00000001", "00000000", '0', '1', '0', '0'),
			("00000001", "00000000", '1', '1', '0', '0'),
			("00000000", "00000001", '0', '0', '0', '1'),
			("00000000", "00000001", '1', '0', '0', '1'),
			-- unsigned 128, signed -127
			("10000000", "00000000", '0', '1', '0', '0'),
			("10000000", "00000000", '1', '0', '0', '1')
		);
	begin
		for i in patterns'range loop
			a <= patterns(i).a;
			b <= patterns(i).b;
			sel <= patterns(i).sel;
			wait for 1 ns;
			assert x1 = patterns(i).x1
				report "bad output value at x1" severity error;
			assert x2 = patterns(i).x2
				report "bad output value at x2" severity error;
			assert x3 = patterns(i).x3
				report "bad output value at x3" severity error;
		end loop;
		assert false report "end of test" severity note;
		--  Wait forever; this will finish the simulation.
		wait;
	end process;
end behav;
