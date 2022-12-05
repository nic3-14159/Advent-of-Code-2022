library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity reg32 is
    generic (
	data_width : natural := 32
    );
    port (
	clk : in std_logic;
	clear : in std_logic;
	load : in std_logic;
	D : in STD_LOGIC_VECTOR(data_width-1 downto 0);
	Q : out STD_LOGIC_VECTOR(data_width-1 downto 0)
    );
end reg32;

architecture Behavioral of reg32 is
begin
    process(clk)
    begin
	if (rising_edge(clk)) then
	    if (clear = '1') then
		Q <= (others => '0');
	    else
		if (load = '1') then
		    Q <= D;
		else
		    Q <= Q;
		end if;
	    end if;
	end if;
    end process;
end Behavioral;

