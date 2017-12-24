library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux4to1 is
	port (Q0,Q1,Q2,Q3: in std_logic_vector(31 downto 0);
			sel: in std_logic_vector(1 downto 0);
			Y: out std_logic_vector(31 downto 0));
end entity mux4to1;

architecture func of mux4to1 is
begin
	with sel select
	Y <= Q0 when "00",
		  Q1 when "01",
		  Q2 when "10",
		  Q3 when "11";
end architecture func;