library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register32 is
	port(x: in std_logic_vector(15 downto 0);
		  ldHigh, ldLow, clk: in std_logic;
		  Y: out std_logic_vector(31 downto 0));
end entity register32;

architecture func of register32 is
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if ldHigh = '0' then
				Y(31 downto 16) <= x;
			elsif ldLow = '0' then
				Y(15 downto 0) <= x;
			end if;
		end if;
	end process;
end architecture func;