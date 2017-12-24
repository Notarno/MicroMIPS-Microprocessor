library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DMux is
	generic(N :natural := 32);
	port(A,B,C: in std_logic_vector(N-1 downto 0);
		  s17, s16: in std_logic;
		  Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8: out std_logic_vector(3 downto 0));
end entity DMux;

architecture func of DMux is
	signal sel: std_logic_vector(1 downto 0);
	signal Q: std_logic_vector(N-1 downto 0);
begin
	sel <= s17&s16;
	
	with sel select
	Q <= A when "01",
		  B when "10",
		  C when "00",
		  x"00000000" when "11";
		  
	Q1 <= Q(3 downto 0);
	Q2 <= Q(7 downto 4);
	Q3 <= Q(11 downto 8);
	Q4 <= Q(15 downto 12);
	Q5 <= Q(19 downto 16);
	Q6 <= Q(23 downto 20);
	Q7 <= Q(27 downto 24);
	Q8 <= Q(31 downto 28);
end architecture func;