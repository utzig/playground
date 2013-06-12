library ieee;
use ieee.std_logic_1164.all;

entity mux_tb is
end mux_tb;

architecture behav of mux_tb is
	component mux
		port (
			a, b: in std_logic_vector (7 downto 0);
			sel: in std_logic_vector (1 downto 0);
			c: out std_logic_vector (7 downto 0)
		);
	end component;
	for mux_0: mux use entity work.mux;
	signal a, b: std_logic_vector (7 downto 0);
	signal sel: std_logic_vector (1 downto 0);
	signal c: std_logic_vector (7 downto 0);
begin
	mux_0: mux port map (a => a, b => b, sel => sel, c => c);

	process
		type pattern_type is record
			a, b: std_logic_vector (7 downto 0);
			sel: std_logic_vector (1 downto 0);
			c: std_logic_vector (7 downto 0);
		end record;
		type pattern_array is array (natural range <>) of pattern_type;
		constant patterns : pattern_array := (
			("10101010", "01010101", "00", "00000000"),
			("10101010", "01010101", "01", "10101010"),
			("10101010", "01010101", "10", "01010101"),
			("10101010", "01010101", "11", "ZZZZZZZZ")
		);
	begin
		for i in patterns'range loop
			a <= patterns(i).a;
			b <= patterns(i).b;
			sel <= patterns(i).sel;
			wait for 1 ns;
			assert c = patterns(i).c
				report "bad output value" severity error;
		end loop;
		assert false report "end of test" severity note;
		--  Wait forever; this will finish the simulation.
		wait;
	end process;
end behav;
