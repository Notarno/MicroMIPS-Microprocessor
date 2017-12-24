library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SE is
	port(Imm: in std_logic_vector(15 downto 0);
		  Q: out std_logic_vector(29 downto 0));
end entity SE;

architecture func of SE is
begin
	Q <= "00000000000000" & Imm;
end architecture func;