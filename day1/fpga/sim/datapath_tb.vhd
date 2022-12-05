library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity datapath_tb is
end datapath_tb;

architecture tb of datapath_tb is
    constant data_width : natural := 32;

    component datapath is
    generic (
	data_width : natural := 32
    );
    port (
	char_in_dp : in std_logic_vector(7 downto 0);
	char_is_newline_dp : out std_logic;
	max_calories_dp : out std_logic_vector (data_width-1 downto 0);
	clk_dp : in std_logic;
	reset_dp : in std_logic;
	ld_calories_dp : in std_logic;
	ld_total_dp : in std_logic;
	ld_max_calories_dp : in std_logic;
	clr_calories_dp : in std_logic;
	clr_total_dp : in std_logic;
	mux_sel_dp : in std_logic;
	total_gt_max_dp : out std_logic
    );
    end component;

    signal char_in_tb : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal reset_tb : std_logic := '0';
    signal clr_calories_tb : std_logic := '0';
    signal clr_total_tb : std_logic := '0';
    signal clk_tb : std_logic := '0';
    signal ld_calories_tb : std_logic := '0';
    signal ld_total_tb : std_logic := '0';
    signal ld_max_calories_tb : std_logic := '0';
    signal total_gt_max_tb : std_logic := '0';
begin
    datapath_inst: datapath
	port map (
	    char_in_dp => char_in_tb,
	    char_is_newline_dp => open,
	    max_calories_dp => open,
	    clk_dp => clk_tb,
	    reset_dp => reset_tb,
	    ld_calories_dp => ld_calories_tb,
	    ld_total_dp => ld_total_tb,
	    ld_max_calories_dp => ld_max_calories_tb,
	    clr_calories_dp => clr_calories_tb,
	    clr_total_dp => clr_total_tb,
	    mux_sel_dp => total_gt_max_tb,
	    total_gt_max_dp => total_gt_max_tb
	);

    clk_process : process
    begin
	wait for 0.5 ns;
	clk_tb <= not clk_tb;
    end process;

    process
    begin
	-- Reset
	clr_calories_tb <= '1';
	clr_total_tb <= '1';
	reset_tb <= '1';
	wait for 1 ns;
	clr_calories_tb <= '0';
	clr_total_tb <= '0';
	reset_tb <= '0';

	ld_calories_tb <= '1';
	char_in_tb <= X"33"; -- 3
	wait for 1 ns;
	char_in_tb <= X"31"; -- 1
	wait for 1 ns;
	char_in_tb <= X"0A"; -- \n
	ld_calories_tb <= '0';
	ld_total_tb <= '1';
	clr_calories_tb <= '1';
	wait for 1 ns;

	clr_calories_tb <= '0';
	ld_total_tb <= '0';
	ld_calories_tb <= '1';
	char_in_tb <= X"31"; -- 1
	wait for 1 ns;
	char_in_tb <= X"30"; -- 0
	wait for 1 ns;
	char_in_tb <= X"0A"; -- \n
	ld_calories_tb <= '0';
	ld_total_tb <= '1';
	clr_calories_tb <= '1';
	wait for 1 ns;
	
	ld_max_calories_tb <= '1';
	clr_calories_tb <= '0';
	clr_total_tb <= '1';
	wait for 1 ns;
	ld_max_calories_tb <= '0';
	clr_total_tb <= '0';
	wait for 1 ns;
	wait;
    end process;
     
end tb;


