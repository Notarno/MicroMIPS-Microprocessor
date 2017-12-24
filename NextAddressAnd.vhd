library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity NextAddressAnd is
	port (A: in std_logic;
			B: in std_logic_vector(29 downto 0);
			Q: out std_logic_vector(29 downto 0));
end entity NextAddressAnd;

architecture func of NextAddressAnd is
	signal Qinternal: std_logic_vector(29 downto 0);
begin
	process(A)
	begin
		for i in 0 to 29 loop
			Qinternal(i) <= A and B(i);
		end loop;
	end process;
	Q <= Qinternal;
end architecture func;