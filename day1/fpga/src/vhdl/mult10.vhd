library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mult10 is
    generic (
	data_width : natural := 32
    );
    port (
	input : in STD_LOGIC_VECTOR(data_width-1 downto 0);
	output : out STD_LOGIC_VECTOR(data_width-1 downto 0)
    );
end mult10;

architecture Behavioral of mult10 is
begin
    output <= std_logic_vector((unsigned(input) sll 3) + (unsigned(input) sll 1));
end Behavioral;
