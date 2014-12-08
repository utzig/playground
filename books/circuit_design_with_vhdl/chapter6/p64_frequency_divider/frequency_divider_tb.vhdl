library ieee;
use ieee.std_logic_1164.all;

entity frequency_divider_tb is
end frequency_divider_tb;

architecture behav of frequency_divider_tb is
	component frequency_divider
		port (
			fclk: in std_logic;
			fclk_n: out std_logic
		);
	end component;
	for frequency_divider_0: frequency_divider
	    use entity work.frequency_divider;
	signal fclk: std_logic;
	signal fclk_n: std_logic;
begin
	frequency_divider_0: frequency_divider port map (fclk => fclk,
	                                                 fclk_n => fclk_n);
	process
		type pattern_type is record
			fclk: std_logic;
			fclk_n: std_logic;
		end record;
		type pattern_array is array (natural range <>) of pattern_type;
		constant patterns : pattern_array := (
			-- testbench for n=2
			--('0', '0'), ('1', '0'), ('0', '0'), ('1', '0'),
			--('0', '0'), ('1', '1'), ('0', '1'), ('1', '1'),
			--('0', '1'), ('1', '0'), ('0', '0'), ('1', '0'),
			--('0', '0'), ('1', '1'), ('0', '1'), ('1', '1'),
			--('0', '1'), ('1', '0'), ('0', '0'), ('1', '0')

			-- testbench for n=3
			('0', '0'), ('1', '0'), ('0', '0'), ('1', '0'),
			('0', '0'), ('1', '0'), ('0', '0'), ('1', '1'),
			('0', '1'), ('1', '1'), ('0', '1'), ('1', '1'),
			('0', '1'), ('1', '0'), ('0', '0'), ('1', '0'),
			('0', '0'), ('1', '0'), ('0', '0'), ('1', '1'),
			('0', '1'), ('1', '1'), ('0', '1'), ('1', '1'),
			('0', '1'), ('1', '0'), ('0', '0'), ('1', '0')
		);
	begin
		for i in patterns'range loop
			fclk <= patterns(i).fclk;
			wait for 1 ns;
			assert fclk_n = patterns(i).fclk_n
				report "bad output value" severity error;
		end loop;
		assert false report "end of test" severity note;
		--  Wait forever; this will finish the simulation.
		wait;
	end process;
end behav;
