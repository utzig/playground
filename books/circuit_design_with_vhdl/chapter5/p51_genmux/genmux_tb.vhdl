library ieee;
use ieee.std_logic_1164.all;

-- declared in genmux
use work.types.all;

entity genmux_tb is
end genmux_tb;

architecture behav of genmux_tb is
	component genmux
		port (
			-- number of inputs is based on n
			a: in vector_array (0 to (2**n)-1);
			sel: in integer range 0 to (2**n)-1;
			y: out std_logic_vector (m-1 downto 0)
		);
	end component;
	for genmux_0: genmux use entity work.genmux;
	signal a: vector_array (0 to (2**n)-1);
	signal sel: integer range 0 to (2**n)-1;
	signal y: std_logic_vector (m-1 downto 0);
begin
	genmux_0: genmux port map (a => a,
	                           sel => sel,
	                           y => y);

	process
		type pattern_type is record
			a: vector_array (0 to (2**n)-1);
			sel: integer range 0 to (2**n)-1;
			y: std_logic_vector (m-1 downto 0);
		end record;
		type pattern_array is array (natural range <>) of pattern_type;
		constant patterns : pattern_array := (
			-- testbench for n=3 and m=4
			(("0101", "0000", "0000", "0000", "0000", "0000",
			  "0000", "0000"), 0, "0101"),
			(("1010", "0000", "0000", "0000", "0000", "0000",
			  "0000", "0000"), 0, "1010"),
			(("0000", "0101", "0000", "0000", "0000", "0000",
			  "0000", "0000"), 1, "0101"),
			(("0000", "1010", "0000", "0000", "0000", "0000",
			  "0000", "0000"), 1, "1010"),
			(("0000", "0000", "0101", "0000", "0000", "0000",
			  "0000", "0000"), 2, "0101"),
			(("0000", "0000", "1010", "0000", "0000", "0000",
			  "0000", "0000"), 2, "1010"),
			(("0000", "0000", "0000", "0101", "0000", "0000",
			  "0000", "0000"), 3, "0101"),
			(("0000", "0000", "0000", "1010", "0000", "0000",
			  "0000", "0000"), 3, "1010"),
			(("0000", "0000", "0000", "0000", "0101", "0000",
			  "0000", "0000"), 4, "0101"),
			(("0000", "0000", "0000", "0000", "1010", "0000",
			  "0000", "0000"), 4, "1010"),
			(("0000", "0000", "0000", "0000", "0000", "0101",
			  "0000", "0000"), 5, "0101"),
			(("0000", "0000", "0000", "0000", "0000", "1010",
			  "0000", "0000"), 5, "1010"),
			(("0000", "0000", "0000", "0000", "0000", "0000",
			  "0101", "0000"), 6, "0101"),
			(("0000", "0000", "0000", "0000", "0000", "0000",
			  "1010", "0000"), 6, "1010"),
			(("0000", "0000", "0000", "0000", "0000", "0000",
			  "0000", "0101"), 7, "0101"),
			(("0000", "0000", "0000", "0000", "0000", "0000",
			  "0000", "1010"), 7, "1010")

			-- testbench for n=2 and m=2
			--(("01", "00", "00", "00"), 0, "01"),
			--(("10", "00", "00", "00"), 0, "10"),
			--(("00", "01", "00", "00"), 1, "01"),
			--(("00", "10", "00", "00"), 1, "10"),
			--(("00", "00", "01", "00"), 2, "01"),
			--(("00", "00", "10", "00"), 2, "10"),
			--(("00", "00", "00", "01"), 3, "01"),
			--(("00", "00", "00", "10"), 3, "10")
		);
	begin
		for i in patterns'range loop
			a <= patterns(i).a;
			sel <= patterns(i).sel;
			wait for 1 ns;
			assert y = patterns(i).y
				report "bad output value" severity error;
		end loop;
		assert false report "end of test" severity note;
		--  Wait forever; this will finish the simulation.
		wait;
	end process;
end behav;
