library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mult10_tb is
end mult10_tb;

architecture tb of mult10_tb is
    constant data_width : natural := 32;
    signal input_tb : STD_LOGIC_VECTOR(data_width-1 downto 0) := (others => '0');
    signal output_tb : STD_LOGIC_VECTOR(data_width-1 downto 0) := (others => '0');
    component mult10 is
	generic (
	    data_width : natural := 32
	);
	port (
	    input : in STD_LOGIC_VECTOR(data_width-1 downto 0);
	    output : out STD_LOGIC_VECTOR(data_width-1 downto 0)
	);
    end component;
begin
    mult10_inst: mult10
        generic map (data_width => data_width)
	port map (input => input_tb, output => output_tb);

    process
    begin
	input_tb <= X"00000003";
	wait for 1 ns;
	input_tb <= X"0000000A";
	wait for 10 ns;
	wait;
    end process;
     
end tb;
