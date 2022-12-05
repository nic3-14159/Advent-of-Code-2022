library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity datapath is
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
end datapath;

architecture Structural of datapath is
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

    component mult10 is
	generic (
	    data_width : natural := 32
	);
	port (
	    input : in STD_LOGIC_VECTOR(data_width-1 downto 0);
	    output : out STD_LOGIC_VECTOR(data_width-1 downto 0)
	);
    end component;

    component mux is
	generic (
	    data_width : natural := 32
	);
	port (
	    i0 : in STD_LOGIC_VECTOR(data_width-1 downto 0);
	    i1 : in STD_LOGIC_VECTOR(data_width-1 downto 0);
	    q : out std_logic_vector(data_width-1 downto 0);
	    sel : in std_logic
	);
    end component;

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

    signal digit_in : std_logic_vector(data_width-1 downto 0) := (others => '0');
    signal char_padded : std_logic_vector(data_width-1 downto 0) := (others => '0');
    signal digit_adder_out : std_logic_vector(data_width-1 downto 0) := (others => '0');
    signal calories : std_logic_vector(data_width-1 downto 0) := (others => '0');
    signal digit_adder_b : std_logic_vector(data_width-1 downto 0) := (others => '0');
    signal total_adder_a : std_logic_vector(data_width-1 downto 0) := (others => '0');
    signal total_adder_out : std_logic_vector(data_width-1 downto 0) := (others => '0');
    signal mux_out : std_logic_vector(data_width-1 downto 0) := (others => '0');
begin
    char_padded(7 downto 0) <= char_in_dp;
    ascii2bin: adder32
	port map (
	    a => char_padded,
	    b => std_logic_vector(-X"00000030"),
	    sum => digit_in
	);
    calorie_reg: reg32
	port map (
	    clk => clk_dp,
	    clear => clr_calories_dp,
	    load => ld_calories_dp,
	    D => digit_adder_out,
	    Q => calories
	); 
    calorie_mult10: mult10
	port map (
	    input => calories,
	    output => digit_adder_b
	);
    digit_adder: adder32
	port map (
	    a => digit_in,
	    b => digit_adder_b,
	    sum => digit_adder_out
	);
    total_reg: reg32
	port map (
	    clk => clk_dp,
	    clear => clr_total_dp,
	    load => ld_total_dp,
	    D => total_adder_out,
	    Q => total_adder_a
	); 
    total_adder: adder32
	port map (
	    a => total_adder_a,
	    b => calories,
	    sum => total_adder_out
	);

    newline_detector: comparator
	generic map (
	    data_width => 8
	)
	port map (
	    a => X"0A", -- \n
	    b => char_in_dp,
	    gt => open,
	    eq => char_is_newline_dp
	);
    max_comparator: comparator
	port map (
	    a => total_adder_out,
	    b => max_calories_dp,
	    gt => total_gt_max_dp,
	    eq => open
	);
    max_mux: mux
	port map (
	    i0 => max_calories_dp,
	    i1 => total_adder_out,
	    q => mux_out,
	    sel => mux_sel_dp
	);
    max_reg: reg32
	port map (
	    clk => clk_dp,
	    clear => clr_max_calories_dp,
	    load => ld_max_calories_dp,
	    D => mux_out,
	    Q => max_calories_dp
	); 
end Structural;
