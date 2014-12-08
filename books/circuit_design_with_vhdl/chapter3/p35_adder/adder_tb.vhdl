library ieee;
use ieee.std_logic_1164.all;

entity adder_tb is
end adder_tb;

architecture behav of adder_tb is
	component adder
		port (
			a, b: in std_logic_vector (3 downto 0);
			sum: out std_logic_vector (4 downto 0)
		);
	end component;
	for adder_0: adder use entity work.adder;
	signal a, b: std_logic_vector (3 downto 0);
	signal sum: std_logic_vector (4 downto 0);
begin
	adder_0: adder port map (a => a, b => b, sum => sum);

	process
		type pattern_type is record
			a, b: std_logic_vector (3 downto 0);
			sum: std_logic_vector (4 downto 0);
		end record;
		type pattern_array is array (natural range <>) of pattern_type;
		constant patterns : pattern_array := (
			("0000", "0000", "00000"),
			("0001", "0000", "00001"),
			("0000", "0001", "00001"),
			("0010", "0000", "00010"),
			("0000", "0010", "00010"),
			("0100", "0000", "00100"),
			("0000", "0100", "00100"),
			("1000", "0000", "01000"),
			("0000", "1000", "01000"),
			("0001", "0001", "00010"),
			("0011", "0011", "00110"),
			("0111", "0111", "01110"),
			("1111", "1111", "11110")
		);
	begin
		for i in patterns'range loop
			a <= patterns(i).a;
			b <= patterns(i).b;
			wait for 1 ns;
			assert sum = patterns(i).sum
				report "bad output value" severity error;
		end loop;
		assert false report "end of test" severity note;
		--  Wait forever; this will finish the simulation.
		wait;
	end process;
end behav;
