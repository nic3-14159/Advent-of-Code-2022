library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_tb is
end comparator_tb;

architecture tb of comparator_tb is
    constant data_width : natural := 32;
    signal a_tb : STD_LOGIC_VECTOR(data_width-1 downto 0) := (others => '0');
    signal b_tb : STD_LOGIC_VECTOR(data_width-1 downto 0) := (others => '0');
    signal gt_tb : std_logic := '0';
    signal eq_tb : std_logic := '0';
    component comparator is
	generic (
	    data_width : natural := 32
	);
	port (
	    a : in STD_LOGIC_VECTOR(data_width-1 downto 0);
	    b : in STD_LOGIC_VECTOR(data_width-1 downto 0);
	    gt : out std_logic;
	    eq : out std_logic
	);
    end component;
begin
    comparator_inst: comparator
        generic map (data_width => data_width)
	port map (a => a_tb, b => b_tb, gt => gt_tb, eq => eq_tb);

    process
    begin
	a_tb <= X"00000003";
	b_tb <= X"0000000A";
	wait for 1 ns;
	a_tb <= X"00001900";
	b_tb <= X"00001900";
	wait for 1 ns;
	a_tb <= X"00001a00";
	b_tb <= X"00001900";
	wait for 1 ns;
	wait;
    end process;
     
end tb;


