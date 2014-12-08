library ieee;
use ieee.std_logic_1164.all;

entity gendecoder_tb is
	generic (n: integer := 3);
end gendecoder_tb;

architecture behav of gendecoder_tb is
	component gendecoder
		port (
			ena: in std_logic;
			sel: in integer range 0 to (2**n)-1;
			x: out std_logic_vector ((2**n)-1 downto 0)
		);
	end component;
	for gendecoder_0: gendecoder use entity work.gendecoder;
	signal ena: std_logic;
	signal sel: integer range 0 to (2**n)-1;
	signal x: std_logic_vector ((2**n)-1 downto 0);
begin
	gendecoder_0: gendecoder port map (ena => ena, sel => sel, x => x);

	process
		type pattern_type is record
			ena: std_logic;
			sel: integer range 0 to (2**n)-1;
			x: std_logic_vector ((2**n)-1 downto 0);
		end record;
		type pattern_array is array (natural range <>) of pattern_type;
		constant patterns : pattern_array := (
			-- for testing with n = 3
			('0', 0, "11111111"),
			('1', 0, "11111110"),
			('0', 1, "11111111"),
			('1', 1, "11111101"),
			('0', 2, "11111111"),
			('1', 2, "11111011"),
			('0', 3, "11111111"),
			('1', 3, "11110111"),
			('0', 4, "11111111"),
			('1', 4, "11101111"),
			('0', 5, "11111111"),
			('1', 5, "11011111"),
			('0', 6, "11111111"),
			('1', 6, "10111111"),
			('0', 7, "11111111"),
			('1', 7, "01111111")

			-- for testing with n = 2
			--('0', "00", "1111"),
			--('1', "00", "1110"),
			--('0', "01", "1111"),
			--('1', "01", "1101"),
			--('0', "10", "1111"),
			--('1', "10", "1011"),
			--('0', "11", "1111"),
			--('1', "11", "0111")
		);
	begin
		for i in patterns'range loop
			ena <= patterns(i).ena;
			sel <= patterns(i).sel;
			wait for 1 ns;
			assert x = patterns(i).x
				report "bad output value" severity error;
		end loop;
		assert false report "end of test" severity note;
		--  Wait forever; this will finish the simulation.
		wait;
	end process;
end behav;
