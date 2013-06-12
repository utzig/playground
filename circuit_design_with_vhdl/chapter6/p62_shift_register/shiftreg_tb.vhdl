library ieee;
use ieee.std_logic_1164.all;

entity shiftreg_tb is
end shiftreg_tb;

architecture behav of shiftreg_tb is
	component shiftreg
		port (
			clk: in std_logic;
			din: in std_logic;
			dout: out std_logic
		);
	end component;
	for shiftreg_0: shiftreg use entity work.shiftreg;
	signal clk: std_logic;
	signal din: std_logic;
	signal dout: std_logic;
begin
	shiftreg_0: shiftreg port map (clk => clk, din => din, dout => dout);
	process
		type pattern_type is record
			clk: std_logic;
			din: std_logic;
			dout: std_logic;
		end record;
		type pattern_array is array (natural range <>) of pattern_type;
		constant patterns : pattern_array := (
			('0', '0', '0'),
			('1', '0', '0'),
			('0', '1', '0'),
			('1', '1', '0'),
			('0', '1', '0'),
			('1', '1', '0'),
			('0', '1', '0'),
			('1', '0', '0'),
			('0', '0', '0'),
			('1', '0', '1'),
			('0', '0', '1'),
			('1', '0', '1'),
			('0', '0', '1'),
			('1', '0', '0'),
			('0', '0', '0'),
			('1', '0', '0')
		);
	begin
		for i in patterns'range loop
			clk <= patterns(i).clk;
			din <= patterns(i).din;
			wait for 1 ns;
			assert dout = patterns(i).dout
				report "bad output value" severity error;
		end loop;
		assert false report "end of test" severity note;
		--  Wait forever; this will finish the simulation.
		wait;
	end process;
end behav;
