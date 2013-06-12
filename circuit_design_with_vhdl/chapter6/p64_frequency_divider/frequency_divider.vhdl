-- Problem 6.4 - generic frequency divider

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity frequency_divider is
	generic (n: integer := 4);
	port (
		fclk: in std_logic;
		fclk_n: out std_logic
	);
end frequency_divider;

architecture frequency_divider of frequency_divider is
	signal cnt: integer := 0;
begin
	process (fclk)
	begin
		if (fclk'event and fclk='1') then
			
		end if;
	end process;
end frequency_divider;
