library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DAmux is
	port (A, B, C: in std_logic_vector(31 downto 0);
			RegInSrc: in std_logic_vector(1 downto 0);
			Reg_In: out std_logic_vector(31 downto 0));
end entity DAmux;

architecture func of DAmux is
begin
	with RegInSrc select
	Reg_In <= A when "00",
				 B when "01",
			    C when "10",
			    x"00000000" when "11";
end architecture func;