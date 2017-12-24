library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DRmux is
	port (A, B: in std_logic_vector(4 downto 0);
			RegDst: in std_logic_vector(1 downto 0);
			DR: out std_logic_vector(4 downto 0));
end entity DRmux;

architecture func of DRmux is
begin
	with RegDst select
	DR <= A when "00",
			B when "01",
			"11111" when "10",
			"11111" when "11";
end architecture func;