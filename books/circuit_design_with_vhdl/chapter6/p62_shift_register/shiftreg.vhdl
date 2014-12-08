-- Problem 6.2
-- 4-stage shift register

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shiftreg is
	port (
		clk: in std_logic;
		din: in std_logic;
		dout: out std_logic
	);
end shiftreg;

architecture shiftreg of shiftreg is
	signal reg: unsigned (3 downto 0) := "0000";
begin
	process (clk) is
	begin
		if (clk'event and clk='1') then
			reg <= din & reg(3 downto 1);
		end if;
	end process;
	dout <= reg(0);
end shiftreg;
