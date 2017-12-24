library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LogicUnit is
	generic(N :natural := 32);
	port (Input_A, Input_B: in std_logic_vector(N-1 downto 0);
			S1, S0: in std_logic;
			Q: out std_logic_vector(N-1 downto 0));
end entity LogicUnit;

architecture LU_FUNC of LogicUnit is
	signal sel: std_logic_vector(1 downto 0);
	signal X,Y: unsigned(N-1 downto 0);

begin
	X <= unsigned (Input_A);
	Y <= unsigned (Input_B);
	sel <= S1&S0;
	
	with sel select
	Q <= (Input_A and Input_B) when "00",
		  (Input_A or Input_B) when "01",
		  (Input_A xor Input_B) when "10",
		  (Input_A nor Input_B) when "11";
end architecture LU_FUNC;