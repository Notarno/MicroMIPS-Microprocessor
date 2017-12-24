library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Adder is
	port(A, B: in std_logic_vector(29 downto 0);
		  Cin: in std_logic;
		  IncrPC: out std_logic_vector(29 downto 0));
end entity;

architecture func of Adder is
begin
	process(A, B, Cin)
		variable Cinternal: std_logic_vector(30 downto 0);
	begin
		Cinternal(0) := Cin;
		for i in 0 to 29 loop
			IncrPC(i) <= A(i) xor B(i) xor Cinternal(i);
			Cinternal(i + 1):= (A(i) and B(i)) or (A(i) and Cinternal(i)) or (B(i) and Cinternal(i));
		end loop;
	end process;
end architecture func;