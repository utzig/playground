library ieee;
use ieee.std_logic_1164.all;

entity barshift_tb is
end barshift_tb;

architecture behav of barshift_tb is
	component barshift
		port (
			inp: in std_logic_vector (7 downto 0);
			shift: in std_logic;
			outp: out std_logic_vector (7 downto 0)
		);
	end component;
	for barshift_0: barshift use entity work.barshift;
	signal inp: std_logic_vector (7 downto 0);
	signal shift: std_logic;
	signal outp: std_logic_vector (7 downto 0);
begin
	barshift_0: barshift port map (inp => inp,
	                               shift => shift,
	                               outp => outp);
	process
		type pattern_type is record
			inp: std_logic_vector (7 downto 0);
			shift: std_logic;
			outp: std_logic_vector (7 downto 0);
		end record;
		type pattern_array is array (natural range <>) of pattern_type;
		constant patterns : pattern_array := (
			("00000000", '0', "00000000"),
			("00000000", '1', "00000000"),
			("00000001", '0', "00000001"),
			("00000001", '1', "00000010"),
			("10000000", '0', "10000000"),
			("10000000", '1', "00000000"),
			("11111111", '0', "11111111"),
			("11111111", '1', "11111110")
		);
	begin
		for i in patterns'range loop
			inp <= patterns(i).inp;
			shift <= patterns(i).shift;
			wait for 1 ns;
			assert outp = patterns(i).outp
				report "bad output value" severity error;
		end loop;
		assert false report "end of test" severity note;
		--  Wait forever; this will finish the simulation.
		wait;
	end process;
end behav;
