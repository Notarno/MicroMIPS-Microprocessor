library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity NAMux is
	port (A, B, C, D: in std_logic_vector(29 downto 0);
			PCSrc: in std_logic_vector(1 downto 0);
			NextPC: out std_logic_vector(29 downto 0));
end entity NAMux;

architecture func of NAMux is
begin
	with PCSrc select
	NextPC <= A when "00",
				 B when "01",
				 C when "10",
				 D when "11";
end architecture func;
			