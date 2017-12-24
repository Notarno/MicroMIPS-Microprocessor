library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addsub is
	generic(N :natural := 32);
	port (Input_A,Input_B: in std_logic_vector(N-1 downto 0);
			sel: in std_logic;
			Q: out std_logic_vector(N-1 downto 0);
			Overflow: out std_logic);
end entity addsub;

architecture func of addsub is
	signal x,y: unsigned(N-1 downto 0);
	signal Q_temp: std_logic_vector(N-1 downto 0);
	
begin
	x <= unsigned(Input_A);
	y <= unsigned(Input_B);
	Q_temp <= (std_logic_vector(x + y)) WHEN (sel = '0') ELSE (std_logic_vector(x - y));
	Overflow <= '1' WHEN(sel = '0' AND Input_A(31) = Input_B(31) AND Q_temp(31) /= Input_A(31)) or (sel = '1' and Input_A(31) /= Input_B(31) and Q_temp(31) /= Input_A(31)) else '0';
	Q <= Q_temp;
end architecture func;