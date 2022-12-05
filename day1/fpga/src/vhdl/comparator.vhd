library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparator is
    generic (
	data_width : natural := 32
    );
    port (
	a : in STD_LOGIC_VECTOR(data_width-1 downto 0);
	b : in STD_LOGIC_VECTOR(data_width-1 downto 0);
	gt : out std_logic;
	eq : out std_logic
    );
end comparator;

architecture Behavioral of comparator is
begin
    process(a, b)
    begin
	if (unsigned(a) > unsigned(b)) then
	    gt <= '1';
	    eq <= '0';
	elsif (unsigned(a) = unsigned(b)) then
	    gt <= '0';
	    eq <= '1';
	else
	    gt <= '0';
	    eq <= '0';
	end if;
    end process;
end Behavioral;


