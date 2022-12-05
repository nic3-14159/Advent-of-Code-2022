library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity part1 is
    port (
	clk : in std_logic;
	char_in : in std_logic_vector(7 downto 0);
	reset : in std_logic;
	max_calories : out std_logic_vector(31 downto 0) 
    );
end entity;

architecture structural of part1 is
    component controller is
	port (
	    char_is_newline_ctrl : in std_logic;
	    clk_ctrl : in std_logic;
	    reset_ctrl : in std_logic;
	    ld_calories_ctrl : out std_logic;
	    ld_total_ctrl : out std_logic;
	    ld_max_calories_ctrl : out std_logic;
	    clr_calories_ctrl : out std_logic;
	    clr_total_ctrl : out std_logic;
	    clr_max_calories_ctrl : out std_logic;
	    mux_sel_ctrl : out std_logic;
	    total_gt_max_ctrl : in std_logic
	);
    end component;

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
	    clr_max_calories_dp : in std_logic;
	    mux_sel_dp : in std_logic;
	    total_gt_max_dp : out std_logic
	);
    end component;

    signal char_is_newline : std_logic := '0';
    signal ld_calories : std_logic := '0';
    signal ld_total : std_logic := '0';
    signal ld_max_calories : std_logic := '0';
    signal clr_calories : std_logic := '0';
    signal clr_total : std_logic := '0';
    signal clr_max_calories : std_logic := '0';
    signal mux_sel : std_logic := '0';
    signal total_gt_max : std_logic := '0';

begin
    datapath_inst : datapath
	port map (
	    char_in_dp => char_in,
	    char_is_newline_dp => char_is_newline,
	    max_calories_dp => max_calories,
	    clk_dp => clk,
	    reset_dp => reset,
	    ld_calories_dp => ld_calories,
	    ld_total_dp => ld_total,
	    ld_max_calories_dp => ld_max_calories,
	    clr_calories_dp => clr_calories,
	    clr_total_dp => clr_total,
	    clr_max_calories_dp => clr_max_calories,
	    mux_sel_dp => mux_sel,
	    total_gt_max_dp => total_gt_max
	);
    controller_inst : controller
	port map (
	    char_is_newline_ctrl => char_is_newline,
	    clk_ctrl => clk,
	    reset_ctrl => reset,
	    ld_calories_ctrl => ld_calories,
	    ld_total_ctrl => ld_total,
	    ld_max_calories_ctrl => ld_max_calories,
	    clr_calories_ctrl => clr_calories,
	    clr_total_ctrl => clr_total,
	    clr_max_calories_ctrl => clr_max_calories,
	    mux_sel_ctrl => mux_sel,
	    total_gt_max_ctrl => total_gt_max
	);

end structural;
