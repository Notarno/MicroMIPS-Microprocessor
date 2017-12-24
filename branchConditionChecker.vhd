library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity branchConditionChecker is
	port(rt, rs: in std_logic_vector(31 downto 0);
		  BrType: in std_logic_vector(1 downto 0);
		  BrTrue: out std_logic);
end entity branchConditionChecker;

architecture func of branchConditionChecker is
	signal internal: signed(31 downto 0);
begin
	internal <= signed(rs);
	process(BrType)
	begin
		if (BrType = "00") then
			BrTrue <= '0';
		elsif (BrType = "01") then
			if (rs = rt) then
				BrTrue <= '1';
			else
				BrTrue <= '0';
			end if;
		elsif (BrType = "10") then
			if (rs /= rt) then
				BrTrue <= '1';
			else
				BrTrue <= '0';
			end if;
		elsif (BrType = "11") then
			if (internal < x"00000000") then
				BrTrue <= '1';
			else
				BrTrue <= '0';
			end if;
		end if;
	end process;
end architecture func;
			