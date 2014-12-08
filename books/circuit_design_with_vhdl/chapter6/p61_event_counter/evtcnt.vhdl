-- Problem 6.1
-- event counter - count clock events

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity evtcnt is
	port (
		clk: in std_logic;
		outp: out std_logic_vector (7 downto 0)
	);
end evtcnt;

architecture evtcnt of evtcnt is
	signal count0, count1: unsigned (7 downto 0) := "00000000";
begin
	process (clk) is
	begin
		if (clk'event and clk='1') then
			count1 <= count1 + 1;
		end if;
	end process;
	process (clk) is
	begin
		if (clk'event and clk='0') then
			count0 <= count0 + 1;
		end if;
	end process;
	outp <= std_logic_vector(count0 + count1);
end evtcnt;
