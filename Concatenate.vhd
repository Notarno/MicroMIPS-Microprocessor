library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Concatenate is
	port (A: in std_logic_vector(3 downto 0);
			B: in std_logic_vector(25 downto 0);
			C: out std_logic_vector(29 downto 0));
end entity Concatenate;

architecture func of Concatenate is
begin
	C <= A & B;
end architecture func;