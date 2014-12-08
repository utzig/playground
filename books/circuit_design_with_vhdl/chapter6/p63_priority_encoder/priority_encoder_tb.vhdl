library ieee;
use ieee.std_logic_1164.all;

entity priority_encoder_tb is
end priority_encoder_tb;

architecture behav of priority_encoder_tb is
	component priority_encoder
		port (
			inp: in std_logic_vector (7 downto 1);
			outp: out std_logic_vector (2 downto 0)
		);
	end component;
	for priority_encoder_0: priority_encoder
	    use entity work.priority_encoder;
	signal inp: std_logic_vector (7 downto 1);
	signal outp: std_logic_vector (2 downto 0);
begin
	priority_encoder_0: priority_encoder port map (inp => inp,
	                                               outp => outp);

	process
		type pattern_type is record
			inp: std_logic_vector (7 downto 1);
			outp: std_logic_vector (2 downto 0);
		end record;
		type pattern_array is array (natural range <>) of pattern_type;
		constant patterns : pattern_array := (
			("1000000", "111"),
			("0100000", "110"),
			("0010000", "101"),
			("0001000", "100"),
			("0000100", "011"),
			("0000010", "010"),
			("0000001", "001"),
			("0000000", "000"),
			("1111111", "111"),
			("0111111", "110"),
			("0011111", "101"),
			("0001111", "100"),
			("0000111", "011"),
			("0000011", "010"),
			("0000001", "001"),
			("0000000", "000")
		);
	begin
		for i in patterns'range loop
			inp <= patterns(i).inp;
			wait for 1 ns;
			assert outp = patterns(i).outp
				report "bad output value" severity error;
		end loop;
		assert false report "end of test" severity note;
		--  Wait forever; this will finish the simulation.
		wait;
	end process;
end behav;
