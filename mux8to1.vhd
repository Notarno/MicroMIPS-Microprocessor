library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux8to1 is
	port (Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7: in std_logic_vector(31 downto 0);
			sel: in std_logic_vector(2 downto 0);
			Y: out std_logic_vector(31 downto 0));
end entity mux8to1;

architecture func of mux8to1 is
begin
	with sel select
	Y <= Q0 when "000",
		  Q1 when "001",
		  Q2 when "010",
		  Q3 when "011",
		  Q4 when "100",
		  Q5 when "101",
		  Q6 when "110",
		  Q7 when "111";
end architecture func;