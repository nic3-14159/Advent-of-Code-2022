library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder32 is
    generic (
	data_width : natural := 32
    );
    port (
	a : in STD_LOGIC_VECTOR(data_width-1 downto 0);
	b : in STD_LOGIC_VECTOR(data_width-1 downto 0);
	sum : out STD_LOGIC_VECTOR(data_width-1 downto 0)
    );
end adder32;

architecture Behavioral of adder32 is
begin
    sum <= std_logic_vector(signed(a) + signed(b));
end Behavioral;

