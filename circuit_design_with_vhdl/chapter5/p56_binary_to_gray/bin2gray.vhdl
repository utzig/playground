-- Problem 5.6

-- generic binary to gray converter

library ieee;
use ieee.std_logic_1164.all;

entity bin2gray is
	generic (n: integer := 4);
	port (
		inp: in std_logic_vector (n-1 downto 0);
		outp: out std_logic_vector (n-1 downto 0)
	);
end bin2gray;

architecture bin2gray of bin2gray is
begin
	outp(outp'high) <= inp(inp'high);
	L: for i in inp'high-1 downto inp'low generate
		outp(i) <= inp(i+1) xor inp(i);
	end generate;
end bin2gray;
