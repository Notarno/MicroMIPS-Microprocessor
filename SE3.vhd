library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SE3 is
	port(Imm: in std_logic_vector(15 downto 0);
		  Q: out std_logic_vector(31 downto 0));
end entity SE3;

architecture func of SE3 is
begin
	Q <= "0000000000000000" & Imm;
end architecture func;