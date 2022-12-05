library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use std.textio.all;

entity part1_tb is
end part1_tb;

architecture tb of part1_tb is
    constant data_width : natural := 32;
    component part1 is
	port (
	    clk : in std_logic;
	    char_in : in std_logic_vector(7 downto 0);
	    reset : in std_logic;
	    max_calories : out std_logic_vector(31 downto 0) 
	);
    end component;

    signal char_in_tb : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal reset_tb : std_logic := '0';
    signal clk_tb : std_logic := '0';
    signal max_calories_tb : std_logic_vector (31 downto 0);
    
begin
    part1_inst: part1
	port map (
	    clk => clk_tb,
	    char_in => char_in_tb,
	    reset => reset_tb,
	    max_calories => max_calories_tb
	);

    clk_process : process
    begin
	wait for 0.5 ns;
	clk_tb <= not clk_tb;
    end process;

    process
	file input : text;
	variable input_line : line;
	variable input_char : character;
	variable good : boolean := true;
    begin
	file_open(input, "input", read_mode);
	-- Reset
	reset_tb <= '1';
	wait for 1 ns;
	reset_tb <= '0';
	while not endfile(input) loop
	    readline(input, input_line);
	    while good loop
		read(input_line, input_char, good);
		if (not good) then
		    char_in_tb <= X"0A";
		else
		    char_in_tb <= std_logic_vector(to_unsigned(natural(character'pos(input_char)), 8));
		end if;
		wait for 1 ns;
	    end loop;
	    good := true;
	end loop;
	file_close(input);
	wait;
    end process;
     
end tb;



