library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Concatenate2 is
	port (B: in std_logic_vector(29 downto 0);
			C: out std_logic_vector(31 downto 0));
end entity Concatenate2;

architecture func of Concatenate2 is
begin
	C <= B & "00";
end architecture func;