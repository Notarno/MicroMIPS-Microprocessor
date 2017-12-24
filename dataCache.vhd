library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dataCache is
	port(DATA_IN, ADDR: in std_logic_vector(31 downto 0);
		  CS, WE, OE: in std_logic;
		  DATA_OUT: out std_logic_vector(31 downto 0));
end entity dataCache;

architecture func of dataCache is
type array128 is array(0 to 127) of std_logic_vector(31 downto 0);
signal dataMem: array128;
begin
	process(CS,OE,WE)
	begin
		if (CS = '0') then
			DATA_OUT <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
		elsif (CS = '1') then
			if (WE = '1') then
				dataMem(to_integer(unsigned(ADDR(6 downto 0)))) <= DATA_IN;
			elsif (WE = '0' AND OE = '1') then
				DATA_OUT <= dataMem(to_integer(unsigned(ADDR(6 downto 0))));
			elsif (WE = '0' and OE = '0') then
				DATA_OUT <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
			end if;
		end if;
	end process;
end architecture func;
		