library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity controller is
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
end controller;

architecture Behavioral of controller is
    signal last_newline : std_logic := '0';
begin
    process(reset_ctrl, clk_ctrl)
    begin
	if reset_ctrl = '1' then
	    last_newline <= '0';
	else
	    if rising_edge(clk_ctrl) then
		last_newline <= char_is_newline_ctrl;
	    end if;
	end if;
    end process;

    process (reset_ctrl, char_is_newline_ctrl, last_newline)
    begin
	if reset_ctrl = '1' then
	    clr_calories_ctrl <= '1';
	    clr_total_ctrl <= '1';
	    clr_max_calories_ctrl <= '1';
	else
	    clr_calories_ctrl <= char_is_newline_ctrl;
	    ld_calories_ctrl <= not char_is_newline_ctrl;
	    clr_total_ctrl <= last_newline and char_is_newline_ctrl;
	    ld_total_ctrl <= not last_newline and char_is_newline_ctrl;
	    ld_max_calories_ctrl <= last_newline and char_is_newline_ctrl;
	    clr_max_calories_ctrl <= '0';
	end if;
    end process;
    mux_sel_ctrl <= total_gt_max_ctrl;
end Behavioral;
