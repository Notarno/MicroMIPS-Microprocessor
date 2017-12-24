library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALUmux is
	port(A,B: in std_logic_vector(31 downto 0);
		  ALUSrc: in std_logic;
		  Q: out std_logic_vector(31 downto 0));
end entity ALUmux;

architecture func of ALUmux is
begin
	with ALUSrc select
	Q <= A when '0',
		  B when '1';
end architecture func;