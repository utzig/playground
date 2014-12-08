-- Problem 6.3 - priority encoder
-- using sequential code (IF, CASE)

library ieee;
use ieee.std_logic_1164.all;

entity priority_encoder is
	port (
		inp: in std_logic_vector (7 downto 1);
		outp: out std_logic_vector (2 downto 0)
	);
end priority_encoder;

architecture priority_encoder of priority_encoder is
begin
	process (inp)
	begin
		-- Both solutions work. One of of them should be kept
		-- commented out

		-- (a) solution using IF
		--if inp(7)='1' then outp <= "111";
		--elsif inp(6)='1' then outp <= "110";
		--elsif inp(5)='1' then outp <= "101";
		--elsif inp(4)='1' then outp <= "100";
		--elsif inp(3)='1' then outp <= "011";
		--elsif inp(2)='1' then outp <= "010";
		--elsif inp(1)='1' then outp <= "001";
		--else outp <= "000";
		--end if;

		-- This is really ugly. There must be a better way of doing this!
		-- (b) solution using CASE
		case inp(7) is
		when '1' => outp <= "111";
		when others =>
			case inp(6) is
			when '1' => outp <= "110";
			when others =>
				case inp(5) is
				when '1' => outp <= "101";
				when others =>
					case inp(4) is
					when '1' => outp <= "100";
					when others =>
						case inp(3) is
						when '1' => outp <= "011";
						when others =>
							case inp(2) is
							when '1' => outp <= "010";
							when others =>
								case inp(1) is
								when '1' => outp <= "001";
								when others => outp <= "000";
								end case;
							end case;
						end case;
					end case;
				end case;
			end case;
		end case;
	end process;
end priority_encoder;
