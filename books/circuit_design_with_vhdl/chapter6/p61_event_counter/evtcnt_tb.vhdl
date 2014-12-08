library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity evtcnt_tb is
end evtcnt_tb;

architecture behav of evtcnt_tb is
	component evtcnt
		port (
			clk: in std_logic;
			outp: out std_logic_vector (7 downto 0)
		);
	end component;
	for evtcnt_0: evtcnt use entity work.evtcnt;
	signal clk: std_logic;
	signal outp: std_logic_vector (7 downto 0);
begin
	evtcnt_0: evtcnt port map (clk => clk, outp => outp);
	process
		type pattern_type is record
			clk: std_logic;
			outp: std_logic_vector (7 downto 0);
		end record;
		type pattern_array is array (natural range <>) of pattern_type;
		constant patterns : pattern_array := (
			('0', "00000001"),
			('1', "00000010"),
			('0', "00000011"),
			('1', "00000100"),
			('0', "00000101"),
			('1', "00000110"),
			('0', "00000111")
		);
	begin
		for i in patterns'range loop
			clk <= patterns(i).clk;
			wait for 1 ns;
			assert outp = patterns(i).outp
				report "bad output value" severity error;
		end loop;
		assert false report "end of test" severity note;
		--  Wait forever; this will finish the simulation.
		wait;
	end process;
end behav;
