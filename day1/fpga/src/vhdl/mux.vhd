library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux is
    generic (
	data_width : natural := 32
    );
    port (
	i0 : in STD_LOGIC_VECTOR(data_width-1 downto 0);
	i1 : in STD_LOGIC_VECTOR(data_width-1 downto 0);
	q : out std_logic_vector(data_width-1 downto 0);
	sel : in std_logic
    );
end mux;

architecture Behavioral of mux is
begin
    process (i0, i1, sel)
    begin
	case sel is
	    when '0' => q <= i0;
	    when '1' => q <= i1;
	    when others => q <= (others => 'X');
	end case;
    end process;
end Behavioral;
