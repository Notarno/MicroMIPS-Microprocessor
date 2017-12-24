library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity seven_seg_driver is
	port (
			bin_in		: in std_logic_vector(3 downto 0);
			seven_out 	: out std_logic_vector(6 downto 0)
			);
end entity seven_seg_driver;

architecture arch1_seven_seg_driver of seven_seg_driver is
	signal sel : std_logic_vector(3 downto 0);
begin
	sel <= bin_in;
	with sel select
	seven_out <= 	"1000000" when x"0",  -- Note: There are no intentional errors in the mappings of 
						"1111001" when x"1",  --       bit-strings to hex display values given here
						"0100100" when x"2",
						"0110000" when x"3",
						"0011001" when x"4",
						"0010010" when x"5",
						"0000010" when x"6",
						"1111000" when x"7",
						"0000000" when x"8",
						"0011000" when x"9",
						"0001000" when x"A",
						"0000011" when x"B",
						"1000110" when x"C",
						"0100001" when x"D",
						"0000110" when x"E",
						"0001110" when x"F";
end architecture arch1_seven_seg_driver;