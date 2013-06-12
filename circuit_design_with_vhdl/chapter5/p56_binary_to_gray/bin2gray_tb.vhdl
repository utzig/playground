library ieee;
use ieee.std_logic_1164.all;

entity bin2gray_tb is
	generic (n: integer := 4);
end bin2gray_tb;

architecture behav of bin2gray_tb is
	component bin2gray
		port (
			inp: in std_logic_vector (n-1 downto 0);
			outp: out std_logic_vector (n-1 downto 0)
		);
	end component;
	for bin2gray_0: bin2gray use entity work.bin2gray;
	signal inp: std_logic_vector (n-1 downto 0);
	signal outp: std_logic_vector (n-1 downto 0);
begin
	bin2gray_0: bin2gray port map (inp => inp, outp => outp);

	process
		type pattern_type is record
			inp: std_logic_vector (n-1 downto 0);
			outp: std_logic_vector (n-1 downto 0);
		end record;
		type pattern_array is array (natural range <>) of pattern_type;
		constant patterns : pattern_array := (
			-- testbench for n=4
			("0000", "0000"),
			("0001", "0001"),
			("0010", "0011"),
			("0011", "0010"),
			("0100", "0110"),
			("0101", "0111"),
			("0110", "0101"),
			("0111", "0100"),
			("1000", "1100"),
			("1001", "1101"),
			("1010", "1111"),
			("1011", "1110"),
			("1100", "1010"),
			("1101", "1011"),
			("1110", "1001"),
			("1111", "1000")
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
