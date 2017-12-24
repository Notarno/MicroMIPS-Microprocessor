library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instrucCache is
	port(ADDR: in std_logic_vector(31 downto 0);
		  INSTRUC: out std_logic_vector(31 downto 0));
end entity instrucCache;

architecture func of instrucCache is
type array128 is array(0 to 127) of std_logic_vector(7 downto 0);
signal instrucMem: array128 := (	X"3C",X"10",X"00",X"01",X"3C",X"11",X"00",X"02",X"02",X"11",X"98",X"22",X"02",X"11",X"A0",X"25",
											X"AE",X"13",X"00",X"03",X"16",X"11",X"00",X"14",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
											X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
											X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
											X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
											X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
											X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
											X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00");
begin
	INSTRUC(31 downto 24) <= instrucMem(to_integer(unsigned(ADDR(6 downto 0))));
	INSTRUC(23 downto 16) <= instrucMem(to_integer(unsigned(ADDR(6 downto 0)) + 1));
	INSTRUC(15 downto 8) <= instrucMem(to_integer(unsigned(ADDR(6 downto 0)) + 2));
	INSTRUC(7 downto 0) <= instrucMem(to_integer(unsigned(ADDR(6 downto 0)) + 3));
end architecture func;
