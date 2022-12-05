library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg32_tb is
end reg32_tb;

architecture tb of reg32_tb is
    constant data_width : natural := 32;
    signal clk_tb : std_logic := '0';
    signal clear_tb : std_logic := '0';
    signal load_tb : std_logic := '0';
    signal D_tb : STD_LOGIC_VECTOR(data_width-1 downto 0) := (others => '0');
    signal Q_tb : STD_LOGIC_VECTOR(data_width-1 downto 0) := (others => '0');
    component reg32 is
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
    end component;
begin
    reg32_inst: reg32
        generic map (data_width => data_width)
	port map (
	    clk => clk_tb,
	    clear => clear_tb,
	    load => load_tb,
	    D => D_tb,
	    Q => Q_tb
	);

    clk_process : process
    begin
	clk_tb <= not clk_tb;
	wait for 0.5 ns;
    end process;

    process
    begin
	clear_tb <= '1';
	wait for 1 ns;
	clear_tb <= '0';
	wait for 2 ns;
	D_tb <= X"DEADBEEF";
	load_tb <= '1';
	wait for 1 ns;
	load_tb <= '0';
	D_tb <= X"00C0FFEE";
	wait for 4 ns;
	load_tb <= '1';
	wait for 10 ns;
	wait;
    end process;
     
end tb;

