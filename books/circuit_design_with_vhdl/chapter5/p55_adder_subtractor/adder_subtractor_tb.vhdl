library ieee;
use ieee.std_logic_1164.all;

entity adder_tb is
end adder_tb;

architecture behav of adder_tb is
	component adder
		port (
			a, b: in std_logic_vector (7 downto 0);
			sum: out std_logic_vector (7 downto 0);
			cout: out std_logic
		);
	end component;
	for adder_0: adder use entity work.adder;
	signal a, b: std_logic_vector (7 downto 0);
	signal sum: std_logic_vector (7 downto 0);
	signal cout: std_logic;
begin
	adder_0: adder port map (a => a, b => b,
	                         sum => sum, cout => cout);

	process
		type pattern_type is record
			a, b: std_logic_vector (7 downto 0);
			sum: std_logic_vector (7 downto 0);
			cout: std_logic;
		end record;
		type pattern_array is array (natural range <>) of pattern_type;
		constant patterns : pattern_array := (
			("00000000", "00000000", "00000000", '0'),
			("00000001", "00000000", "00000001", '0'),
			("00000001", "00000001", "00000010", '0'),
			("01111111", "01111111", "11111110", '0'),
			("10000000", "10000000", "00000000", '1'),
			("11111111", "11111111", "11111110", '1')
		);
	begin
		for i in patterns'range loop
			a <= patterns(i).a;
			b <= patterns(i).b;
			wait for 1 ns;
			assert sum = patterns(i).sum
				report "bad output value at sum" severity error;
			assert cout = patterns(i).cout
				report "bad output value at cout" severity error;
		end loop;
		assert false report "end of test" severity note;
		--  Wait forever; this will finish the simulation.
		wait;
	end process;
end behav;
