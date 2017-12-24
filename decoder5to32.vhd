library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder5to32 is
	port(DR: in std_logic_vector(4 downto 0);
		  RegW: in std_logic;
		  Q: out std_logic_vector(31 downto 0));
end entity decoder5to32;

architecture func of decoder5to32 is
begin
	process(RegW,DR)
	begin
		Q <= x"00000000";
		if (RegW = '1') then
			Q(to_integer(unsigned(DR))) <= '1';
		end if;
	end process;
end architecture;