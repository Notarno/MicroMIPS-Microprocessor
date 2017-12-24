library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RMux is
	generic(N :natural := 32);
	port (c,d: in std_logic_vector(N-1 downto 0);
			a: in std_logic_vector(15 downto 0);
			s1, s0, b: in std_logic;
			Q: out std_logic_vector(N-1 downto 0));
end entity RMux;

architecture func of RMux is
	signal sel: std_logic_vector(1 downto 0);
	signal temp: std_logic_vector(N-1 downto 0);
	
begin
	sel <= s1&s0;
	process(b)
	begin
		if b = '1' then
			temp <= "00000000000000000000000000000001";
		else
			temp <= "00000000000000000000000000000000";
		end if;
	end process;
	
	with sel select 
	Q <= a&x"0000" when "00",
		  temp when "01",
		  c when "10",
		  d when "11";
	
end architecture func;