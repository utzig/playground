-- Problem 4.4

library ieee;
use ieee.std_logic_1164.all;

entity gendecoder is
	generic (n: integer := 3);
	port (
		ena: in std_logic;
		sel: in integer range 0 to (2**n)-1;
		x: out std_logic_vector ((2**n)-1 downto 0)
	);
end gendecoder;

architecture gendecoder of gendecoder is
begin
	process (ena, sel)
		variable temp1: std_logic_vector (x'high downto 0);
	begin
		temp1 := (others => '1');
		if (ena = '1') then
			temp1(sel) := '0';
		end if;
		x <= temp1;
	end process;
end gendecoder;
