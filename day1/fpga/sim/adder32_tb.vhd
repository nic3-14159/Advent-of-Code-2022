library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder32_tb is
end adder32_tb;

architecture tb of adder32_tb is
    constant data_width : natural := 32;
    signal a_tb : STD_LOGIC_VECTOR(data_width-1 downto 0) := (others => '0');
    signal b_tb : STD_LOGIC_VECTOR(data_width-1 downto 0) := (others => '0');
    signal output_tb : STD_LOGIC_VECTOR(data_width-1 downto 0) := (others => '0');
    component adder32 is
	generic (
	    data_width : natural := 32
	);
	port (
	    a : in STD_LOGIC_VECTOR(data_width-1 downto 0);
	    b : in STD_LOGIC_VECTOR(data_width-1 downto 0);
	    sum : out STD_LOGIC_VECTOR(data_width-1 downto 0)
	);
    end component;
begin
    adder32_inst: adder32
        generic map (data_width => data_width)
	port map (a => a_tb, b => b_tb, sum => output_tb);

    process
    begin
	a_tb <= X"00000003";
	b_tb <= X"0000000A";
	wait for 1 ns;
	a_tb <= X"00000abc";
	b_tb <= X"00000020";
	wait for 1 ns;
	wait;
    end process;
     
end tb;

