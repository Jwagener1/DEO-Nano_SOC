-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 Patches 1.02i SJ Lite Edition"

-- DATE "11/15/2021 11:44:34"

-- 
-- Device: Altera 5CSEMA4U23C6 Package UFBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Prac IS
    PORT (
	CLK : IN std_logic;
	RST : IN std_logic;
	Tx : OUT std_logic;
	Rx : IN std_logic;
	STE : OUT std_logic_vector(2 DOWNTO 0);
	Sample_clk : OUT std_logic;
	LED : OUT std_logic_vector(7 DOWNTO 0);
	Tx_Flag : OUT std_logic
	);
END Prac;

-- Design Ports Information
-- Tx	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- STE[0]	=>  Location: PIN_AC22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- STE[1]	=>  Location: PIN_AE23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- STE[2]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sample_clk	=>  Location: PIN_AF7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[0]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[1]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[2]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[3]	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[4]	=>  Location: PIN_AF26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[5]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[6]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[7]	=>  Location: PIN_AA23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Tx_Flag	=>  Location: PIN_AG24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RST	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_V11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rx	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Prac IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_RST : std_logic;
SIGNAL ww_Tx : std_logic;
SIGNAL ww_Rx : std_logic;
SIGNAL ww_STE : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Sample_clk : std_logic;
SIGNAL ww_LED : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Tx_Flag : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputCLKENA0_outclk\ : std_logic;
SIGNAL \RST~input_o\ : std_logic;
SIGNAL \tx_bit_count~3_combout\ : std_logic;
SIGNAL \rx_bit_count~0_combout\ : std_logic;
SIGNAL \Rx~input_o\ : std_logic;
SIGNAL \rx_bit_count~3_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \rx_PS.r_stop~q\ : std_logic;
SIGNAL \rx_PS~6_combout\ : std_logic;
SIGNAL \rx_PS.r_idle~q\ : std_logic;
SIGNAL \rx_clock|Div_cnt~0_combout\ : std_logic;
SIGNAL \main_clock|Div_cnt[3]~DUPLICATE_q\ : std_logic;
SIGNAL \main_clock|Div_cnt~0_combout\ : std_logic;
SIGNAL \main_clock|Div_cnt~4_combout\ : std_logic;
SIGNAL \main_clock|Div_cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \main_clock|Div_cnt~1_combout\ : std_logic;
SIGNAL \main_clock|Div_cnt[2]~2_combout\ : std_logic;
SIGNAL \main_clock|Div_cnt[2]~DUPLICATE_q\ : std_logic;
SIGNAL \main_clock|Div_cnt~3_combout\ : std_logic;
SIGNAL \main_clock|Equal0~0_combout\ : std_logic;
SIGNAL \main_clock|Trig~DUPLICATE_q\ : std_logic;
SIGNAL \rx_clock|Div_cnt[0]~1_combout\ : std_logic;
SIGNAL \rx_clock|Div_cnt~2_combout\ : std_logic;
SIGNAL \rx_clock|Div_cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \rx_clock|Div_cnt~3_combout\ : std_logic;
SIGNAL \rx_clock|Div_cnt~4_combout\ : std_logic;
SIGNAL \rx_clock|Trig~0_combout\ : std_logic;
SIGNAL \rx_clock|Trig~q\ : std_logic;
SIGNAL \rx_bit_count[0]~1_combout\ : std_logic;
SIGNAL \rx_bit_count~2_combout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \rx_PS.r_start~q\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \rx_PS.r_rec~q\ : std_logic;
SIGNAL \main_clock|Trig~q\ : std_logic;
SIGNAL \tx_clock|Div_cnt[0]~1_combout\ : std_logic;
SIGNAL \tx_clock|Div_cnt~0_combout\ : std_logic;
SIGNAL \tx_clock|Div_cnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \tx_clock|Div_cnt~2_combout\ : std_logic;
SIGNAL \tx_clock|Div_cnt~3_combout\ : std_logic;
SIGNAL \tx_clock|Div_cnt[2]~DUPLICATE_q\ : std_logic;
SIGNAL \tx_clock|Div_cnt~4_combout\ : std_logic;
SIGNAL \tx_clock|Trig~0_combout\ : std_logic;
SIGNAL \tx_clock|Trig~q\ : std_logic;
SIGNAL \tx_bit_count~2_combout\ : std_logic;
SIGNAL \tx_bit_count~0_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \tx_PS.t_send~q\ : std_logic;
SIGNAL \tx_bit_count[0]~1_combout\ : std_logic;
SIGNAL \DIN_VLD~combout\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \tx_PS.t_stop~q\ : std_logic;
SIGNAL \tx_PS~7_combout\ : std_logic;
SIGNAL \tx_PS.t_idle~q\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \tx_PS.t_sync~q\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \tx_PS.t_start~q\ : std_logic;
SIGNAL \rx_temp[1]~7_combout\ : std_logic;
SIGNAL \rx_temp[5]~8_combout\ : std_logic;
SIGNAL \rx_temp[1]~2_combout\ : std_logic;
SIGNAL \rx_temp[1]~3_combout\ : std_logic;
SIGNAL \rx_temp[0]~0_combout\ : std_logic;
SIGNAL \rx_temp[2]~4_combout\ : std_logic;
SIGNAL \rx_temp[3]~5_combout\ : std_logic;
SIGNAL \rx_temp[0]~1_combout\ : std_logic;
SIGNAL \Mux0~4_combout\ : std_logic;
SIGNAL \rx_temp[6]~9_combout\ : std_logic;
SIGNAL \rx_temp[7]~10_combout\ : std_logic;
SIGNAL \rx_temp[4]~6_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Tx~0_combout\ : std_logic;
SIGNAL \Tx~reg0_q\ : std_logic;
SIGNAL \tx_ready~2_combout\ : std_logic;
SIGNAL rx_bit_count : std_logic_vector(2 DOWNTO 0);
SIGNAL tx_bit_count : std_logic_vector(2 DOWNTO 0);
SIGNAL \rx_clock|Div_cnt\ : std_logic_vector(3 DOWNTO 0);
SIGNAL rx_temp : std_logic_vector(7 DOWNTO 0);
SIGNAL input : std_logic_vector(7 DOWNTO 0);
SIGNAL \main_clock|Div_cnt\ : std_logic_vector(4 DOWNTO 0);
SIGNAL tx_data : std_logic_vector(7 DOWNTO 0);
SIGNAL \tx_clock|Div_cnt\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \tx_clock|ALT_INV_Div_cnt[2]~DUPLICATE_q\ : std_logic;
SIGNAL \tx_clock|ALT_INV_Div_cnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \main_clock|ALT_INV_Div_cnt[3]~DUPLICATE_q\ : std_logic;
SIGNAL \main_clock|ALT_INV_Div_cnt[2]~DUPLICATE_q\ : std_logic;
SIGNAL \main_clock|ALT_INV_Div_cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \rx_clock|ALT_INV_Div_cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \main_clock|ALT_INV_Trig~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_Rx~input_o\ : std_logic;
SIGNAL \ALT_INV_RST~input_o\ : std_logic;
SIGNAL ALT_INV_input : std_logic_vector(7 DOWNTO 0);
SIGNAL ALT_INV_tx_data : std_logic_vector(7 DOWNTO 0);
SIGNAL \tx_clock|ALT_INV_Div_cnt\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_rx_PS.r_idle~q\ : std_logic;
SIGNAL \main_clock|ALT_INV_Div_cnt\ : std_logic_vector(4 DOWNTO 0);
SIGNAL ALT_INV_tx_bit_count : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_DIN_VLD~combout\ : std_logic;
SIGNAL \tx_clock|ALT_INV_Trig~q\ : std_logic;
SIGNAL \ALT_INV_Selector3~0_combout\ : std_logic;
SIGNAL \ALT_INV_rx_temp[1]~7_combout\ : std_logic;
SIGNAL \ALT_INV_rx_temp[1]~2_combout\ : std_logic;
SIGNAL \ALT_INV_rx_temp[0]~0_combout\ : std_logic;
SIGNAL \rx_clock|ALT_INV_Div_cnt\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \main_clock|ALT_INV_Trig~q\ : std_logic;
SIGNAL \ALT_INV_tx_PS.t_idle~q\ : std_logic;
SIGNAL ALT_INV_rx_temp : std_logic_vector(7 DOWNTO 0);
SIGNAL \rx_clock|ALT_INV_Trig~q\ : std_logic;
SIGNAL ALT_INV_rx_bit_count : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_rx_PS.r_start~q\ : std_logic;
SIGNAL \ALT_INV_tx_PS.t_sync~q\ : std_logic;
SIGNAL \ALT_INV_Mux0~4_combout\ : std_logic;
SIGNAL \ALT_INV_rx_PS.r_stop~q\ : std_logic;
SIGNAL \ALT_INV_rx_PS.r_rec~q\ : std_logic;
SIGNAL \ALT_INV_tx_PS.t_send~q\ : std_logic;
SIGNAL \ALT_INV_tx_PS.t_start~q\ : std_logic;
SIGNAL \ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_tx_PS.t_stop~q\ : std_logic;

BEGIN

ww_CLK <= CLK;
ww_RST <= RST;
Tx <= ww_Tx;
ww_Rx <= Rx;
STE <= ww_STE;
Sample_clk <= ww_Sample_clk;
LED <= ww_LED;
Tx_Flag <= ww_Tx_Flag;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\tx_clock|ALT_INV_Div_cnt[2]~DUPLICATE_q\ <= NOT \tx_clock|Div_cnt[2]~DUPLICATE_q\;
\tx_clock|ALT_INV_Div_cnt[0]~DUPLICATE_q\ <= NOT \tx_clock|Div_cnt[0]~DUPLICATE_q\;
\main_clock|ALT_INV_Div_cnt[3]~DUPLICATE_q\ <= NOT \main_clock|Div_cnt[3]~DUPLICATE_q\;
\main_clock|ALT_INV_Div_cnt[2]~DUPLICATE_q\ <= NOT \main_clock|Div_cnt[2]~DUPLICATE_q\;
\main_clock|ALT_INV_Div_cnt[1]~DUPLICATE_q\ <= NOT \main_clock|Div_cnt[1]~DUPLICATE_q\;
\rx_clock|ALT_INV_Div_cnt[1]~DUPLICATE_q\ <= NOT \rx_clock|Div_cnt[1]~DUPLICATE_q\;
\main_clock|ALT_INV_Trig~DUPLICATE_q\ <= NOT \main_clock|Trig~DUPLICATE_q\;
\ALT_INV_Rx~input_o\ <= NOT \Rx~input_o\;
\ALT_INV_RST~input_o\ <= NOT \RST~input_o\;
ALT_INV_input(2) <= NOT input(2);
ALT_INV_input(0) <= NOT input(0);
ALT_INV_input(3) <= NOT input(3);
ALT_INV_input(1) <= NOT input(1);
ALT_INV_input(6) <= NOT input(6);
ALT_INV_tx_data(2) <= NOT tx_data(2);
ALT_INV_tx_data(0) <= NOT tx_data(0);
ALT_INV_tx_data(3) <= NOT tx_data(3);
ALT_INV_tx_data(1) <= NOT tx_data(1);
ALT_INV_input(4) <= NOT input(4);
ALT_INV_input(7) <= NOT input(7);
ALT_INV_input(5) <= NOT input(5);
ALT_INV_tx_data(6) <= NOT tx_data(6);
ALT_INV_tx_data(4) <= NOT tx_data(4);
ALT_INV_tx_data(7) <= NOT tx_data(7);
ALT_INV_tx_data(5) <= NOT tx_data(5);
\tx_clock|ALT_INV_Div_cnt\(3) <= NOT \tx_clock|Div_cnt\(3);
\tx_clock|ALT_INV_Div_cnt\(2) <= NOT \tx_clock|Div_cnt\(2);
\tx_clock|ALT_INV_Div_cnt\(1) <= NOT \tx_clock|Div_cnt\(1);
\tx_clock|ALT_INV_Div_cnt\(0) <= NOT \tx_clock|Div_cnt\(0);
\ALT_INV_rx_PS.r_idle~q\ <= NOT \rx_PS.r_idle~q\;
\main_clock|ALT_INV_Div_cnt\(4) <= NOT \main_clock|Div_cnt\(4);
\main_clock|ALT_INV_Div_cnt\(3) <= NOT \main_clock|Div_cnt\(3);
\main_clock|ALT_INV_Div_cnt\(2) <= NOT \main_clock|Div_cnt\(2);
\main_clock|ALT_INV_Div_cnt\(0) <= NOT \main_clock|Div_cnt\(0);
\main_clock|ALT_INV_Div_cnt\(1) <= NOT \main_clock|Div_cnt\(1);
ALT_INV_tx_bit_count(0) <= NOT tx_bit_count(0);
ALT_INV_tx_bit_count(2) <= NOT tx_bit_count(2);
\ALT_INV_DIN_VLD~combout\ <= NOT \DIN_VLD~combout\;
\tx_clock|ALT_INV_Trig~q\ <= NOT \tx_clock|Trig~q\;
\ALT_INV_Selector3~0_combout\ <= NOT \Selector3~0_combout\;
\ALT_INV_rx_temp[1]~7_combout\ <= NOT \rx_temp[1]~7_combout\;
\ALT_INV_rx_temp[1]~2_combout\ <= NOT \rx_temp[1]~2_combout\;
\ALT_INV_rx_temp[0]~0_combout\ <= NOT \rx_temp[0]~0_combout\;
\rx_clock|ALT_INV_Div_cnt\(3) <= NOT \rx_clock|Div_cnt\(3);
\rx_clock|ALT_INV_Div_cnt\(2) <= NOT \rx_clock|Div_cnt\(2);
\rx_clock|ALT_INV_Div_cnt\(1) <= NOT \rx_clock|Div_cnt\(1);
\rx_clock|ALT_INV_Div_cnt\(0) <= NOT \rx_clock|Div_cnt\(0);
\main_clock|ALT_INV_Trig~q\ <= NOT \main_clock|Trig~q\;
\ALT_INV_tx_PS.t_idle~q\ <= NOT \tx_PS.t_idle~q\;
ALT_INV_rx_temp(7) <= NOT rx_temp(7);
ALT_INV_rx_temp(6) <= NOT rx_temp(6);
ALT_INV_rx_temp(5) <= NOT rx_temp(5);
ALT_INV_rx_temp(4) <= NOT rx_temp(4);
ALT_INV_rx_temp(3) <= NOT rx_temp(3);
ALT_INV_rx_temp(2) <= NOT rx_temp(2);
ALT_INV_rx_temp(1) <= NOT rx_temp(1);
ALT_INV_rx_temp(0) <= NOT rx_temp(0);
\rx_clock|ALT_INV_Trig~q\ <= NOT \rx_clock|Trig~q\;
ALT_INV_rx_bit_count(2) <= NOT rx_bit_count(2);
ALT_INV_rx_bit_count(0) <= NOT rx_bit_count(0);
\ALT_INV_rx_PS.r_start~q\ <= NOT \rx_PS.r_start~q\;
\ALT_INV_tx_PS.t_sync~q\ <= NOT \tx_PS.t_sync~q\;
\ALT_INV_Mux0~4_combout\ <= NOT \Mux0~4_combout\;
ALT_INV_tx_bit_count(1) <= NOT tx_bit_count(1);
\ALT_INV_rx_PS.r_stop~q\ <= NOT \rx_PS.r_stop~q\;
\ALT_INV_rx_PS.r_rec~q\ <= NOT \rx_PS.r_rec~q\;
\ALT_INV_tx_PS.t_send~q\ <= NOT \tx_PS.t_send~q\;
\ALT_INV_tx_PS.t_start~q\ <= NOT \tx_PS.t_start~q\;
\ALT_INV_Mux0~0_combout\ <= NOT \Mux0~0_combout\;
\ALT_INV_tx_PS.t_stop~q\ <= NOT \tx_PS.t_stop~q\;
ALT_INV_rx_bit_count(1) <= NOT rx_bit_count(1);

-- Location: IOOBUF_X46_Y0_N2
\Tx~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Tx~reg0_q\,
	devoe => ww_devoe,
	o => ww_Tx);

-- Location: IOOBUF_X64_Y0_N2
\STE[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_bit_count(0),
	devoe => ww_devoe,
	o => ww_STE(0));

-- Location: IOOBUF_X62_Y0_N59
\STE[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_bit_count(1),
	devoe => ww_devoe,
	o => ww_STE(1));

-- Location: IOOBUF_X50_Y0_N53
\STE[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_bit_count(2),
	devoe => ww_devoe,
	o => ww_STE(2));

-- Location: IOOBUF_X17_Y0_N76
\Sample_clk~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_clock|Trig~q\,
	devoe => ww_devoe,
	o => ww_Sample_clk);

-- Location: IOOBUF_X68_Y12_N22
\LED[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_temp(0),
	devoe => ww_devoe,
	o => ww_LED(0));

-- Location: IOOBUF_X68_Y13_N39
\LED[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_temp(1),
	devoe => ww_devoe,
	o => ww_LED(1));

-- Location: IOOBUF_X68_Y13_N5
\LED[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_temp(2),
	devoe => ww_devoe,
	o => ww_LED(2));

-- Location: IOOBUF_X68_Y13_N22
\LED[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_temp(3),
	devoe => ww_devoe,
	o => ww_LED(3));

-- Location: IOOBUF_X68_Y10_N79
\LED[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_temp(4),
	devoe => ww_devoe,
	o => ww_LED(4));

-- Location: IOOBUF_X68_Y10_N96
\LED[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_temp(5),
	devoe => ww_devoe,
	o => ww_LED(5));

-- Location: IOOBUF_X68_Y12_N5
\LED[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_temp(6),
	devoe => ww_devoe,
	o => ww_LED(6));

-- Location: IOOBUF_X68_Y13_N56
\LED[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_temp(7),
	devoe => ww_devoe,
	o => ww_LED(7));

-- Location: IOOBUF_X61_Y0_N36
\Tx_Flag~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \tx_ready~2_combout\,
	devoe => ww_devoe,
	o => ww_Tx_Flag);

-- Location: IOIBUF_X15_Y0_N1
\CLK~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: CLKCTRL_G6
\CLK~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~input_o\,
	outclk => \CLK~inputCLKENA0_outclk\);

-- Location: IOIBUF_X46_Y0_N35
\RST~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RST,
	o => \RST~input_o\);

-- Location: MLABCELL_X60_Y3_N9
\tx_bit_count~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \tx_bit_count~3_combout\ = ( \RST~input_o\ & ( !tx_bit_count(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_tx_bit_count(0),
	dataf => \ALT_INV_RST~input_o\,
	combout => \tx_bit_count~3_combout\);

-- Location: LABCELL_X58_Y3_N39
\rx_bit_count~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_bit_count~0_combout\ = ( !rx_bit_count(0) & ( \RST~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000000001111000011110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_RST~input_o\,
	datae => ALT_INV_rx_bit_count(0),
	combout => \rx_bit_count~0_combout\);

-- Location: IOIBUF_X65_Y0_N35
\Rx~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Rx,
	o => \Rx~input_o\);

-- Location: MLABCELL_X60_Y3_N48
\rx_bit_count~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_bit_count~3_combout\ = ( rx_bit_count(0) & ( (\RST~input_o\ & (!rx_bit_count(1) $ (!rx_bit_count(2)))) ) ) # ( !rx_bit_count(0) & ( (\RST~input_o\ & rx_bit_count(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000011000011000000001100001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_rx_bit_count(1),
	datac => \ALT_INV_RST~input_o\,
	datad => ALT_INV_rx_bit_count(2),
	dataf => ALT_INV_rx_bit_count(0),
	combout => \rx_bit_count~3_combout\);

-- Location: FF_X60_Y3_N50
\rx_bit_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_bit_count~3_combout\,
	ena => \rx_bit_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_bit_count(2));

-- Location: LABCELL_X59_Y3_N51
\Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = ( rx_bit_count(0) & ( (\rx_clock|Trig~q\ & (rx_bit_count(1) & (\rx_PS.r_rec~q\ & rx_bit_count(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \rx_clock|ALT_INV_Trig~q\,
	datab => ALT_INV_rx_bit_count(1),
	datac => \ALT_INV_rx_PS.r_rec~q\,
	datad => ALT_INV_rx_bit_count(2),
	dataf => ALT_INV_rx_bit_count(0),
	combout => \Selector3~0_combout\);

-- Location: MLABCELL_X60_Y3_N33
\Selector3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = ( \Selector3~0_combout\ ) # ( !\Selector3~0_combout\ & ( (\rx_PS.r_stop~q\ & ((!\Rx~input_o\) # (!\rx_clock|Trig~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111100000000001111110011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Rx~input_o\,
	datac => \rx_clock|ALT_INV_Trig~q\,
	datad => \ALT_INV_rx_PS.r_stop~q\,
	dataf => \ALT_INV_Selector3~0_combout\,
	combout => \Selector3~1_combout\);

-- Location: FF_X60_Y3_N35
\rx_PS.r_stop\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \Selector3~1_combout\,
	sclr => \ALT_INV_RST~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_PS.r_stop~q\);

-- Location: LABCELL_X59_Y3_N3
\rx_PS~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_PS~6_combout\ = ( \rx_clock|Trig~q\ & ( (\RST~input_o\ & ((!\Rx~input_o\) # ((!\rx_PS.r_stop~q\ & \rx_PS.r_idle~q\)))) ) ) # ( !\rx_clock|Trig~q\ & ( (\RST~input_o\ & ((!\Rx~input_o\) # (\rx_PS.r_idle~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001111000011000000111100001100000011100000110000001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rx_PS.r_stop~q\,
	datab => \ALT_INV_Rx~input_o\,
	datac => \ALT_INV_RST~input_o\,
	datad => \ALT_INV_rx_PS.r_idle~q\,
	dataf => \rx_clock|ALT_INV_Trig~q\,
	combout => \rx_PS~6_combout\);

-- Location: FF_X59_Y3_N5
\rx_PS.r_idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_PS~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_PS.r_idle~q\);

-- Location: LABCELL_X58_Y3_N42
\rx_clock|Div_cnt~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_clock|Div_cnt~0_combout\ = ( \rx_PS.r_idle~q\ & ( !\rx_clock|Div_cnt\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_rx_PS.r_idle~q\,
	dataf => \rx_clock|ALT_INV_Div_cnt\(0),
	combout => \rx_clock|Div_cnt~0_combout\);

-- Location: FF_X58_Y3_N49
\main_clock|Div_cnt[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \main_clock|Div_cnt~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_clock|Div_cnt[3]~DUPLICATE_q\);

-- Location: FF_X58_Y3_N34
\main_clock|Div_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \main_clock|Div_cnt[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_clock|Div_cnt\(2));

-- Location: LABCELL_X58_Y3_N24
\main_clock|Div_cnt~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \main_clock|Div_cnt~0_combout\ = ( \main_clock|Div_cnt\(2) & ( !\main_clock|Div_cnt\(0) $ (!\main_clock|Div_cnt\(1)) ) ) # ( !\main_clock|Div_cnt\(2) & ( (!\main_clock|Div_cnt\(0) & (\main_clock|Div_cnt\(1) & ((!\main_clock|Div_cnt\(3)) # 
-- (!\main_clock|Div_cnt\(4))))) # (\main_clock|Div_cnt\(0) & (((!\main_clock|Div_cnt\(1))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111100000000011111110000000001111111100000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \main_clock|ALT_INV_Div_cnt\(3),
	datab => \main_clock|ALT_INV_Div_cnt\(4),
	datac => \main_clock|ALT_INV_Div_cnt\(0),
	datad => \main_clock|ALT_INV_Div_cnt\(1),
	dataf => \main_clock|ALT_INV_Div_cnt\(2),
	combout => \main_clock|Div_cnt~0_combout\);

-- Location: FF_X58_Y3_N26
\main_clock|Div_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \main_clock|Div_cnt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_clock|Div_cnt\(1));

-- Location: LABCELL_X58_Y3_N30
\main_clock|Div_cnt~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \main_clock|Div_cnt~4_combout\ = ( \main_clock|Div_cnt\(2) & ( !\main_clock|Div_cnt\(4) $ (((!\main_clock|Div_cnt\(0)) # ((!\main_clock|Div_cnt[3]~DUPLICATE_q\) # (!\main_clock|Div_cnt\(1))))) ) ) # ( !\main_clock|Div_cnt\(2) & ( (\main_clock|Div_cnt\(4) 
-- & (((!\main_clock|Div_cnt[3]~DUPLICATE_q\) # (!\main_clock|Div_cnt\(1))) # (\main_clock|Div_cnt\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111101000000001111110100000001111111100000000111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \main_clock|ALT_INV_Div_cnt\(0),
	datab => \main_clock|ALT_INV_Div_cnt[3]~DUPLICATE_q\,
	datac => \main_clock|ALT_INV_Div_cnt\(1),
	datad => \main_clock|ALT_INV_Div_cnt\(4),
	dataf => \main_clock|ALT_INV_Div_cnt\(2),
	combout => \main_clock|Div_cnt~4_combout\);

-- Location: FF_X58_Y3_N32
\main_clock|Div_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \main_clock|Div_cnt~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_clock|Div_cnt\(4));

-- Location: FF_X58_Y3_N25
\main_clock|Div_cnt[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \main_clock|Div_cnt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_clock|Div_cnt[1]~DUPLICATE_q\);

-- Location: LABCELL_X58_Y3_N3
\main_clock|Div_cnt~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \main_clock|Div_cnt~1_combout\ = ( \main_clock|Div_cnt[1]~DUPLICATE_q\ & ( (!\main_clock|Div_cnt\(0) & (((!\main_clock|Div_cnt\(4)) # (!\main_clock|Div_cnt[3]~DUPLICATE_q\)) # (\main_clock|Div_cnt[2]~DUPLICATE_q\))) ) ) # ( 
-- !\main_clock|Div_cnt[1]~DUPLICATE_q\ & ( !\main_clock|Div_cnt\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111101000000001111110100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \main_clock|ALT_INV_Div_cnt[2]~DUPLICATE_q\,
	datab => \main_clock|ALT_INV_Div_cnt\(4),
	datac => \main_clock|ALT_INV_Div_cnt[3]~DUPLICATE_q\,
	datad => \main_clock|ALT_INV_Div_cnt\(0),
	dataf => \main_clock|ALT_INV_Div_cnt[1]~DUPLICATE_q\,
	combout => \main_clock|Div_cnt~1_combout\);

-- Location: FF_X58_Y3_N5
\main_clock|Div_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \main_clock|Div_cnt~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_clock|Div_cnt\(0));

-- Location: LABCELL_X58_Y3_N33
\main_clock|Div_cnt[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \main_clock|Div_cnt[2]~2_combout\ = ( \main_clock|Div_cnt[1]~DUPLICATE_q\ & ( !\main_clock|Div_cnt\(0) $ (!\main_clock|Div_cnt\(2)) ) ) # ( !\main_clock|Div_cnt[1]~DUPLICATE_q\ & ( \main_clock|Div_cnt\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111101010101101010100101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \main_clock|ALT_INV_Div_cnt\(0),
	datad => \main_clock|ALT_INV_Div_cnt\(2),
	dataf => \main_clock|ALT_INV_Div_cnt[1]~DUPLICATE_q\,
	combout => \main_clock|Div_cnt[2]~2_combout\);

-- Location: FF_X58_Y3_N35
\main_clock|Div_cnt[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \main_clock|Div_cnt[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_clock|Div_cnt[2]~DUPLICATE_q\);

-- Location: LABCELL_X58_Y3_N48
\main_clock|Div_cnt~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \main_clock|Div_cnt~3_combout\ = ( \main_clock|Div_cnt[1]~DUPLICATE_q\ & ( (!\main_clock|Div_cnt[2]~DUPLICATE_q\ & (\main_clock|Div_cnt\(3) & ((!\main_clock|Div_cnt\(4)) # (\main_clock|Div_cnt\(0))))) # (\main_clock|Div_cnt[2]~DUPLICATE_q\ & 
-- ((!\main_clock|Div_cnt\(0) $ (!\main_clock|Div_cnt\(3))))) ) ) # ( !\main_clock|Div_cnt[1]~DUPLICATE_q\ & ( \main_clock|Div_cnt\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000101110110100000010111011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \main_clock|ALT_INV_Div_cnt[2]~DUPLICATE_q\,
	datab => \main_clock|ALT_INV_Div_cnt\(4),
	datac => \main_clock|ALT_INV_Div_cnt\(0),
	datad => \main_clock|ALT_INV_Div_cnt\(3),
	dataf => \main_clock|ALT_INV_Div_cnt[1]~DUPLICATE_q\,
	combout => \main_clock|Div_cnt~3_combout\);

-- Location: FF_X58_Y3_N50
\main_clock|Div_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \main_clock|Div_cnt~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_clock|Div_cnt\(3));

-- Location: LABCELL_X58_Y3_N27
\main_clock|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \main_clock|Equal0~0_combout\ = ( \main_clock|Div_cnt[1]~DUPLICATE_q\ & ( (\main_clock|Div_cnt\(3) & (\main_clock|Div_cnt\(4) & (!\main_clock|Div_cnt\(2) & !\main_clock|Div_cnt\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000010000000000000001000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \main_clock|ALT_INV_Div_cnt\(3),
	datab => \main_clock|ALT_INV_Div_cnt\(4),
	datac => \main_clock|ALT_INV_Div_cnt\(2),
	datad => \main_clock|ALT_INV_Div_cnt\(0),
	dataf => \main_clock|ALT_INV_Div_cnt[1]~DUPLICATE_q\,
	combout => \main_clock|Equal0~0_combout\);

-- Location: FF_X58_Y3_N28
\main_clock|Trig~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \main_clock|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_clock|Trig~DUPLICATE_q\);

-- Location: LABCELL_X59_Y3_N21
\rx_clock|Div_cnt[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_clock|Div_cnt[0]~1_combout\ = ( \main_clock|Trig~DUPLICATE_q\ ) # ( !\main_clock|Trig~DUPLICATE_q\ & ( !\rx_PS.r_idle~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_rx_PS.r_idle~q\,
	dataf => \main_clock|ALT_INV_Trig~DUPLICATE_q\,
	combout => \rx_clock|Div_cnt[0]~1_combout\);

-- Location: FF_X59_Y3_N59
\rx_clock|Div_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \rx_clock|Div_cnt~0_combout\,
	sload => VCC,
	ena => \rx_clock|Div_cnt[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_clock|Div_cnt\(0));

-- Location: LABCELL_X58_Y3_N0
\rx_clock|Div_cnt~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_clock|Div_cnt~2_combout\ = ( \rx_clock|Div_cnt[1]~DUPLICATE_q\ & ( (\rx_PS.r_idle~q\ & !\rx_clock|Div_cnt\(0)) ) ) # ( !\rx_clock|Div_cnt[1]~DUPLICATE_q\ & ( (\rx_PS.r_idle~q\ & \rx_clock|Div_cnt\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_rx_PS.r_idle~q\,
	datad => \rx_clock|ALT_INV_Div_cnt\(0),
	dataf => \rx_clock|ALT_INV_Div_cnt[1]~DUPLICATE_q\,
	combout => \rx_clock|Div_cnt~2_combout\);

-- Location: FF_X59_Y3_N17
\rx_clock|Div_cnt[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \rx_clock|Div_cnt~2_combout\,
	sload => VCC,
	ena => \rx_clock|Div_cnt[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_clock|Div_cnt[1]~DUPLICATE_q\);

-- Location: FF_X59_Y3_N16
\rx_clock|Div_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \rx_clock|Div_cnt~2_combout\,
	sload => VCC,
	ena => \rx_clock|Div_cnt[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_clock|Div_cnt\(1));

-- Location: LABCELL_X59_Y3_N30
\rx_clock|Div_cnt~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_clock|Div_cnt~3_combout\ = ( \rx_clock|Div_cnt\(1) & ( (\rx_PS.r_idle~q\ & (!\rx_clock|Div_cnt\(0) $ (!\rx_clock|Div_cnt\(2)))) ) ) # ( !\rx_clock|Div_cnt\(1) & ( (\rx_PS.r_idle~q\ & \rx_clock|Div_cnt\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000011000011000000001100001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \rx_clock|ALT_INV_Div_cnt\(0),
	datac => \ALT_INV_rx_PS.r_idle~q\,
	datad => \rx_clock|ALT_INV_Div_cnt\(2),
	dataf => \rx_clock|ALT_INV_Div_cnt\(1),
	combout => \rx_clock|Div_cnt~3_combout\);

-- Location: FF_X59_Y3_N31
\rx_clock|Div_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_clock|Div_cnt~3_combout\,
	ena => \rx_clock|Div_cnt[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_clock|Div_cnt\(2));

-- Location: LABCELL_X59_Y3_N42
\rx_clock|Div_cnt~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_clock|Div_cnt~4_combout\ = ( \rx_clock|Div_cnt\(1) & ( (\rx_PS.r_idle~q\ & (!\rx_clock|Div_cnt\(3) $ (((!\rx_clock|Div_cnt\(0)) # (!\rx_clock|Div_cnt\(2)))))) ) ) # ( !\rx_clock|Div_cnt\(1) & ( (\rx_PS.r_idle~q\ & \rx_clock|Div_cnt\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010100000001010101000000000101010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rx_PS.r_idle~q\,
	datab => \rx_clock|ALT_INV_Div_cnt\(0),
	datac => \rx_clock|ALT_INV_Div_cnt\(2),
	datad => \rx_clock|ALT_INV_Div_cnt\(3),
	dataf => \rx_clock|ALT_INV_Div_cnt\(1),
	combout => \rx_clock|Div_cnt~4_combout\);

-- Location: FF_X59_Y3_N43
\rx_clock|Div_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_clock|Div_cnt~4_combout\,
	ena => \rx_clock|Div_cnt[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_clock|Div_cnt\(3));

-- Location: LABCELL_X59_Y3_N12
\rx_clock|Trig~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_clock|Trig~0_combout\ = ( \rx_clock|Div_cnt\(3) & ( !\rx_clock|Div_cnt\(2) & ( (!\rx_clock|Div_cnt[1]~DUPLICATE_q\ & (\main_clock|Trig~DUPLICATE_q\ & !\rx_clock|Div_cnt\(0))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \rx_clock|ALT_INV_Div_cnt[1]~DUPLICATE_q\,
	datac => \main_clock|ALT_INV_Trig~DUPLICATE_q\,
	datad => \rx_clock|ALT_INV_Div_cnt\(0),
	datae => \rx_clock|ALT_INV_Div_cnt\(3),
	dataf => \rx_clock|ALT_INV_Div_cnt\(2),
	combout => \rx_clock|Trig~0_combout\);

-- Location: FF_X60_Y3_N26
\rx_clock|Trig\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \rx_clock|Trig~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_clock|Trig~q\);

-- Location: LABCELL_X59_Y3_N54
\rx_bit_count[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_bit_count[0]~1_combout\ = ( \rx_PS.r_rec~q\ & ( (!\RST~input_o\) # (\rx_clock|Trig~q\) ) ) # ( !\rx_PS.r_rec~q\ & ( !\RST~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \rx_clock|ALT_INV_Trig~q\,
	datad => \ALT_INV_RST~input_o\,
	dataf => \ALT_INV_rx_PS.r_rec~q\,
	combout => \rx_bit_count[0]~1_combout\);

-- Location: FF_X58_Y3_N41
\rx_bit_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_bit_count~0_combout\,
	ena => \rx_bit_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_bit_count(0));

-- Location: LABCELL_X59_Y3_N6
\rx_bit_count~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_bit_count~2_combout\ = ( rx_bit_count(0) & ( !rx_bit_count(1) ) ) # ( !rx_bit_count(0) & ( rx_bit_count(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_rx_bit_count(1),
	dataf => ALT_INV_rx_bit_count(0),
	combout => \rx_bit_count~2_combout\);

-- Location: FF_X59_Y3_N8
\rx_bit_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_bit_count~2_combout\,
	sclr => \ALT_INV_RST~input_o\,
	ena => \rx_bit_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_bit_count(1));

-- Location: LABCELL_X59_Y3_N0
\Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = ( \rx_clock|Trig~q\ & ( (!\Rx~input_o\ & !\rx_PS.r_idle~q\) ) ) # ( !\rx_clock|Trig~q\ & ( ((!\Rx~input_o\ & !\rx_PS.r_idle~q\)) # (\rx_PS.r_start~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011111111110000001111111111000000110000001100000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Rx~input_o\,
	datac => \ALT_INV_rx_PS.r_idle~q\,
	datad => \ALT_INV_rx_PS.r_start~q\,
	dataf => \rx_clock|ALT_INV_Trig~q\,
	combout => \Selector1~0_combout\);

-- Location: FF_X59_Y3_N1
\rx_PS.r_start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \Selector1~0_combout\,
	sclr => \ALT_INV_RST~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_PS.r_start~q\);

-- Location: MLABCELL_X60_Y3_N18
\Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = ( \rx_PS.r_rec~q\ & ( \rx_clock|Trig~q\ & ( (!rx_bit_count(1)) # (((!rx_bit_count(2)) # (!rx_bit_count(0))) # (\rx_PS.r_start~q\)) ) ) ) # ( !\rx_PS.r_rec~q\ & ( \rx_clock|Trig~q\ & ( \rx_PS.r_start~q\ ) ) ) # ( \rx_PS.r_rec~q\ & ( 
-- !\rx_clock|Trig~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100110011001100111111111111111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rx_bit_count(1),
	datab => \ALT_INV_rx_PS.r_start~q\,
	datac => ALT_INV_rx_bit_count(2),
	datad => ALT_INV_rx_bit_count(0),
	datae => \ALT_INV_rx_PS.r_rec~q\,
	dataf => \rx_clock|ALT_INV_Trig~q\,
	combout => \Selector2~0_combout\);

-- Location: FF_X60_Y3_N20
\rx_PS.r_rec\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \Selector2~0_combout\,
	sclr => \ALT_INV_RST~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_PS.r_rec~q\);

-- Location: FF_X58_Y3_N29
\main_clock|Trig\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \main_clock|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \main_clock|Trig~q\);

-- Location: LABCELL_X58_Y3_N51
\tx_clock|Div_cnt[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \tx_clock|Div_cnt[0]~1_combout\ = ( \tx_PS.t_idle~q\ & ( \main_clock|Trig~q\ ) ) # ( !\tx_PS.t_idle~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \main_clock|ALT_INV_Trig~q\,
	dataf => \ALT_INV_tx_PS.t_idle~q\,
	combout => \tx_clock|Div_cnt[0]~1_combout\);

-- Location: FF_X58_Y3_N17
\tx_clock|Div_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \tx_clock|Div_cnt~0_combout\,
	ena => \tx_clock|Div_cnt[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_clock|Div_cnt\(0));

-- Location: LABCELL_X58_Y3_N15
\tx_clock|Div_cnt~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \tx_clock|Div_cnt~0_combout\ = (\tx_PS.t_idle~q\ & !\tx_clock|Div_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000010101010000000001010101000000000101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_tx_PS.t_idle~q\,
	datad => \tx_clock|ALT_INV_Div_cnt\(0),
	combout => \tx_clock|Div_cnt~0_combout\);

-- Location: FF_X58_Y3_N16
\tx_clock|Div_cnt[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \tx_clock|Div_cnt~0_combout\,
	ena => \tx_clock|Div_cnt[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_clock|Div_cnt[0]~DUPLICATE_q\);

-- Location: LABCELL_X58_Y3_N12
\tx_clock|Div_cnt~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \tx_clock|Div_cnt~2_combout\ = ( \tx_clock|Div_cnt[0]~DUPLICATE_q\ & ( (\tx_PS.t_idle~q\ & !\tx_clock|Div_cnt\(1)) ) ) # ( !\tx_clock|Div_cnt[0]~DUPLICATE_q\ & ( (\tx_PS.t_idle~q\ & \tx_clock|Div_cnt\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_tx_PS.t_idle~q\,
	datad => \tx_clock|ALT_INV_Div_cnt\(1),
	dataf => \tx_clock|ALT_INV_Div_cnt[0]~DUPLICATE_q\,
	combout => \tx_clock|Div_cnt~2_combout\);

-- Location: FF_X58_Y3_N14
\tx_clock|Div_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \tx_clock|Div_cnt~2_combout\,
	ena => \tx_clock|Div_cnt[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_clock|Div_cnt\(1));

-- Location: FF_X58_Y3_N56
\tx_clock|Div_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \tx_clock|Div_cnt~3_combout\,
	ena => \tx_clock|Div_cnt[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_clock|Div_cnt\(2));

-- Location: LABCELL_X58_Y3_N54
\tx_clock|Div_cnt~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \tx_clock|Div_cnt~3_combout\ = ( \tx_clock|Div_cnt[0]~DUPLICATE_q\ & ( (\tx_PS.t_idle~q\ & (!\tx_clock|Div_cnt\(1) $ (!\tx_clock|Div_cnt\(2)))) ) ) # ( !\tx_clock|Div_cnt[0]~DUPLICATE_q\ & ( (\tx_PS.t_idle~q\ & \tx_clock|Div_cnt\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000011000011000000001100001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \tx_clock|ALT_INV_Div_cnt\(1),
	datac => \ALT_INV_tx_PS.t_idle~q\,
	datad => \tx_clock|ALT_INV_Div_cnt\(2),
	dataf => \tx_clock|ALT_INV_Div_cnt[0]~DUPLICATE_q\,
	combout => \tx_clock|Div_cnt~3_combout\);

-- Location: FF_X58_Y3_N55
\tx_clock|Div_cnt[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \tx_clock|Div_cnt~3_combout\,
	ena => \tx_clock|Div_cnt[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_clock|Div_cnt[2]~DUPLICATE_q\);

-- Location: LABCELL_X58_Y3_N57
\tx_clock|Div_cnt~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \tx_clock|Div_cnt~4_combout\ = ( \tx_clock|Div_cnt[0]~DUPLICATE_q\ & ( (\tx_PS.t_idle~q\ & (!\tx_clock|Div_cnt\(3) $ (((!\tx_clock|Div_cnt\(1)) # (!\tx_clock|Div_cnt[2]~DUPLICATE_q\))))) ) ) # ( !\tx_clock|Div_cnt[0]~DUPLICATE_q\ & ( (\tx_PS.t_idle~q\ & 
-- \tx_clock|Div_cnt\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010100000001010101000000000101010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_tx_PS.t_idle~q\,
	datab => \tx_clock|ALT_INV_Div_cnt\(1),
	datac => \tx_clock|ALT_INV_Div_cnt[2]~DUPLICATE_q\,
	datad => \tx_clock|ALT_INV_Div_cnt\(3),
	dataf => \tx_clock|ALT_INV_Div_cnt[0]~DUPLICATE_q\,
	combout => \tx_clock|Div_cnt~4_combout\);

-- Location: FF_X58_Y3_N59
\tx_clock|Div_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \tx_clock|Div_cnt~4_combout\,
	ena => \tx_clock|Div_cnt[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_clock|Div_cnt\(3));

-- Location: LABCELL_X58_Y3_N9
\tx_clock|Trig~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \tx_clock|Trig~0_combout\ = ( \main_clock|Trig~q\ & ( !\tx_clock|Div_cnt\(1) & ( (!\tx_clock|Div_cnt\(3) & (\tx_clock|Div_cnt\(0) & !\tx_clock|Div_cnt\(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \tx_clock|ALT_INV_Div_cnt\(3),
	datac => \tx_clock|ALT_INV_Div_cnt\(0),
	datad => \tx_clock|ALT_INV_Div_cnt\(2),
	datae => \main_clock|ALT_INV_Trig~q\,
	dataf => \tx_clock|ALT_INV_Div_cnt\(1),
	combout => \tx_clock|Trig~0_combout\);

-- Location: FF_X58_Y3_N10
\tx_clock|Trig\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \tx_clock|Trig~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_clock|Trig~q\);

-- Location: MLABCELL_X60_Y3_N42
\tx_bit_count~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \tx_bit_count~2_combout\ = !tx_bit_count(0) $ (!tx_bit_count(1))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111001100001100111100110000110011110011000011001111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_tx_bit_count(0),
	datad => ALT_INV_tx_bit_count(1),
	combout => \tx_bit_count~2_combout\);

-- Location: FF_X60_Y3_N44
\tx_bit_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \tx_bit_count~2_combout\,
	sclr => \ALT_INV_RST~input_o\,
	ena => \tx_bit_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_bit_count(1));

-- Location: MLABCELL_X60_Y3_N45
\tx_bit_count~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \tx_bit_count~0_combout\ = ( \RST~input_o\ & ( !tx_bit_count(2) $ (((!tx_bit_count(0)) # (!tx_bit_count(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000011111111000000001111111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_tx_bit_count(0),
	datac => ALT_INV_tx_bit_count(1),
	datad => ALT_INV_tx_bit_count(2),
	dataf => \ALT_INV_RST~input_o\,
	combout => \tx_bit_count~0_combout\);

-- Location: FF_X60_Y3_N47
\tx_bit_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \tx_bit_count~0_combout\,
	ena => \tx_bit_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_bit_count(2));

-- Location: MLABCELL_X60_Y3_N36
\Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = ( \tx_PS.t_send~q\ & ( tx_bit_count(0) & ( ((!tx_bit_count(1)) # ((!\tx_clock|Trig~q\) # (!tx_bit_count(2)))) # (\tx_PS.t_start~q\) ) ) ) # ( !\tx_PS.t_send~q\ & ( tx_bit_count(0) & ( (\tx_PS.t_start~q\ & \tx_clock|Trig~q\) ) ) ) # 
-- ( \tx_PS.t_send~q\ & ( !tx_bit_count(0) ) ) # ( !\tx_PS.t_send~q\ & ( !tx_bit_count(0) & ( (\tx_PS.t_start~q\ & \tx_clock|Trig~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111111111111111100000101000001011111111111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_tx_PS.t_start~q\,
	datab => ALT_INV_tx_bit_count(1),
	datac => \tx_clock|ALT_INV_Trig~q\,
	datad => ALT_INV_tx_bit_count(2),
	datae => \ALT_INV_tx_PS.t_send~q\,
	dataf => ALT_INV_tx_bit_count(0),
	combout => \Selector6~0_combout\);

-- Location: FF_X60_Y3_N38
\tx_PS.t_send\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \Selector6~0_combout\,
	sclr => \ALT_INV_RST~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_PS.t_send~q\);

-- Location: MLABCELL_X60_Y3_N3
\tx_bit_count[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \tx_bit_count[0]~1_combout\ = ( \rx_clock|Trig~q\ & ( (!\RST~input_o\) # ((!\rx_PS.r_rec~q\ & (\tx_clock|Trig~q\ & \tx_PS.t_send~q\))) ) ) # ( !\rx_clock|Trig~q\ & ( (!\RST~input_o\) # ((\tx_clock|Trig~q\ & \tx_PS.t_send~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110011111100001111001111110000111100101111000011110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rx_PS.r_rec~q\,
	datab => \tx_clock|ALT_INV_Trig~q\,
	datac => \ALT_INV_RST~input_o\,
	datad => \ALT_INV_tx_PS.t_send~q\,
	dataf => \rx_clock|ALT_INV_Trig~q\,
	combout => \tx_bit_count[0]~1_combout\);

-- Location: FF_X60_Y3_N11
\tx_bit_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \tx_bit_count~3_combout\,
	ena => \tx_bit_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => tx_bit_count(0));

-- Location: MLABCELL_X60_Y3_N0
DIN_VLD : cyclonev_lcell_comb
-- Equation(s):
-- \DIN_VLD~combout\ = ( \rx_PS.r_stop~q\ & ( \rx_clock|Trig~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \rx_clock|ALT_INV_Trig~q\,
	dataf => \ALT_INV_rx_PS.r_stop~q\,
	combout => \DIN_VLD~combout\);

-- Location: LABCELL_X61_Y3_N18
\Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = ( !\tx_clock|Trig~q\ & ( (\tx_PS.t_stop~q\ & (((!\DIN_VLD~combout\)))) ) ) # ( \tx_clock|Trig~q\ & ( ((tx_bit_count(0) & (\tx_PS.t_send~q\ & (tx_bit_count(1) & tx_bit_count(2))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0101000001010000000000000000000001010000010100000000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_tx_PS.t_stop~q\,
	datab => ALT_INV_tx_bit_count(0),
	datac => \ALT_INV_tx_PS.t_send~q\,
	datad => ALT_INV_tx_bit_count(1),
	datae => \tx_clock|ALT_INV_Trig~q\,
	dataf => ALT_INV_tx_bit_count(2),
	datag => \ALT_INV_DIN_VLD~combout\,
	combout => \Selector8~0_combout\);

-- Location: FF_X61_Y3_N20
\tx_PS.t_stop\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \Selector8~0_combout\,
	sclr => \ALT_INV_RST~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_PS.t_stop~q\);

-- Location: LABCELL_X58_Y3_N18
\tx_PS~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \tx_PS~7_combout\ = ( \tx_PS.t_idle~q\ & ( \rx_clock|Trig~q\ & ( (\RST~input_o\ & ((!\tx_PS.t_stop~q\) # ((!\tx_clock|Trig~q\) # (\rx_PS.r_stop~q\)))) ) ) ) # ( !\tx_PS.t_idle~q\ & ( \rx_clock|Trig~q\ & ( (\RST~input_o\ & \rx_PS.r_stop~q\) ) ) ) # ( 
-- \tx_PS.t_idle~q\ & ( !\rx_clock|Trig~q\ & ( (\RST~input_o\ & ((!\tx_PS.t_stop~q\) # (!\tx_clock|Trig~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100100011001000000000001100110011001000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_tx_PS.t_stop~q\,
	datab => \ALT_INV_RST~input_o\,
	datac => \tx_clock|ALT_INV_Trig~q\,
	datad => \ALT_INV_rx_PS.r_stop~q\,
	datae => \ALT_INV_tx_PS.t_idle~q\,
	dataf => \rx_clock|ALT_INV_Trig~q\,
	combout => \tx_PS~7_combout\);

-- Location: FF_X58_Y3_N20
\tx_PS.t_idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \tx_PS~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_PS.t_idle~q\);

-- Location: LABCELL_X59_Y3_N24
\Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = ( \tx_PS.t_sync~q\ & ( \rx_clock|Trig~q\ & ( (!\tx_clock|Trig~q\) # ((\rx_PS.r_stop~q\ & ((!\tx_PS.t_idle~q\) # (\tx_PS.t_stop~q\)))) ) ) ) # ( !\tx_PS.t_sync~q\ & ( \rx_clock|Trig~q\ & ( (\rx_PS.r_stop~q\ & ((!\tx_PS.t_idle~q\) # 
-- (\tx_PS.t_stop~q\))) ) ) ) # ( \tx_PS.t_sync~q\ & ( !\rx_clock|Trig~q\ & ( !\tx_clock|Trig~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000001010000011111100111011001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_tx_PS.t_idle~q\,
	datab => \tx_clock|ALT_INV_Trig~q\,
	datac => \ALT_INV_rx_PS.r_stop~q\,
	datad => \ALT_INV_tx_PS.t_stop~q\,
	datae => \ALT_INV_tx_PS.t_sync~q\,
	dataf => \rx_clock|ALT_INV_Trig~q\,
	combout => \Selector7~0_combout\);

-- Location: FF_X59_Y3_N26
\tx_PS.t_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \Selector7~0_combout\,
	sclr => \ALT_INV_RST~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_PS.t_sync~q\);

-- Location: LABCELL_X59_Y3_N18
\Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = ( \tx_clock|Trig~q\ & ( \tx_PS.t_sync~q\ ) ) # ( !\tx_clock|Trig~q\ & ( \tx_PS.t_start~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_tx_PS.t_sync~q\,
	datad => \ALT_INV_tx_PS.t_start~q\,
	dataf => \tx_clock|ALT_INV_Trig~q\,
	combout => \Selector5~0_combout\);

-- Location: FF_X59_Y3_N20
\tx_PS.t_start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \Selector5~0_combout\,
	sclr => \ALT_INV_RST~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tx_PS.t_start~q\);

-- Location: LABCELL_X59_Y3_N57
\rx_temp[1]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_temp[1]~7_combout\ = ( rx_bit_count(0) & ( (\rx_clock|Trig~q\ & \rx_PS.r_rec~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \rx_clock|ALT_INV_Trig~q\,
	datac => \ALT_INV_rx_PS.r_rec~q\,
	dataf => ALT_INV_rx_bit_count(0),
	combout => \rx_temp[1]~7_combout\);

-- Location: LABCELL_X59_Y3_N39
\rx_temp[5]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_temp[5]~8_combout\ = ( \rx_temp[1]~7_combout\ & ( (!rx_bit_count(2) & (((rx_temp(5))))) # (rx_bit_count(2) & ((!rx_bit_count(1) & (\Rx~input_o\)) # (rx_bit_count(1) & ((rx_temp(5)))))) ) ) # ( !\rx_temp[1]~7_combout\ & ( rx_temp(5) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100010000110111110001000011011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Rx~input_o\,
	datab => ALT_INV_rx_bit_count(2),
	datac => ALT_INV_rx_bit_count(1),
	datad => ALT_INV_rx_temp(5),
	dataf => \ALT_INV_rx_temp[1]~7_combout\,
	combout => \rx_temp[5]~8_combout\);

-- Location: FF_X59_Y3_N41
\rx_temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_temp[5]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_temp(5));

-- Location: LABCELL_X59_Y3_N9
\input[5]\ : cyclonev_lcell_comb
-- Equation(s):
-- input(5) = ( rx_temp(5) & ( (\DIN_VLD~combout\) # (input(5)) ) ) # ( !rx_temp(5) & ( (input(5) & !\DIN_VLD~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_input(5),
	datad => \ALT_INV_DIN_VLD~combout\,
	dataf => ALT_INV_rx_temp(5),
	combout => input(5));

-- Location: LABCELL_X59_Y3_N36
\tx_data[5]\ : cyclonev_lcell_comb
-- Equation(s):
-- tx_data(5) = ( input(5) & ( (\DIN_VLD~combout\) # (tx_data(5)) ) ) # ( !input(5) & ( (tx_data(5) & !\DIN_VLD~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_tx_data(5),
	datad => \ALT_INV_DIN_VLD~combout\,
	dataf => ALT_INV_input(5),
	combout => tx_data(5));

-- Location: MLABCELL_X60_Y3_N27
\rx_temp[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_temp[1]~2_combout\ = (!rx_bit_count(2) & (\rx_clock|Trig~q\ & (\rx_PS.r_rec~q\ & rx_bit_count(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000010000000000000001000000000000000100000000000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rx_bit_count(2),
	datab => \rx_clock|ALT_INV_Trig~q\,
	datac => \ALT_INV_rx_PS.r_rec~q\,
	datad => ALT_INV_rx_bit_count(0),
	combout => \rx_temp[1]~2_combout\);

-- Location: LABCELL_X61_Y3_N12
\rx_temp[1]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_temp[1]~3_combout\ = ( \rx_temp[1]~2_combout\ & ( (!rx_bit_count(1) & (\Rx~input_o\)) # (rx_bit_count(1) & ((rx_temp(1)))) ) ) # ( !\rx_temp[1]~2_combout\ & ( rx_temp(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100100010011101110010001001110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rx_bit_count(1),
	datab => \ALT_INV_Rx~input_o\,
	datad => ALT_INV_rx_temp(1),
	dataf => \ALT_INV_rx_temp[1]~2_combout\,
	combout => \rx_temp[1]~3_combout\);

-- Location: FF_X61_Y3_N14
\rx_temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_temp[1]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_temp(1));

-- Location: LABCELL_X61_Y3_N45
\input[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- input(1) = ( rx_temp(1) & ( (input(1)) # (\DIN_VLD~combout\) ) ) # ( !rx_temp(1) & ( (!\DIN_VLD~combout\ & input(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_DIN_VLD~combout\,
	datad => ALT_INV_input(1),
	dataf => ALT_INV_rx_temp(1),
	combout => input(1));

-- Location: LABCELL_X61_Y3_N48
\tx_data[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- tx_data(1) = ( input(1) & ( (\DIN_VLD~combout\) # (tx_data(1)) ) ) # ( !input(1) & ( (tx_data(1) & !\DIN_VLD~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_tx_data(1),
	datad => \ALT_INV_DIN_VLD~combout\,
	dataf => ALT_INV_input(1),
	combout => tx_data(1));

-- Location: MLABCELL_X60_Y3_N12
\rx_temp[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_temp[0]~0_combout\ = ( \rx_clock|Trig~q\ & ( (\rx_PS.r_rec~q\ & !rx_bit_count(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_rx_PS.r_rec~q\,
	datad => ALT_INV_rx_bit_count(0),
	dataf => \rx_clock|ALT_INV_Trig~q\,
	combout => \rx_temp[0]~0_combout\);

-- Location: LABCELL_X61_Y3_N51
\rx_temp[2]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_temp[2]~4_combout\ = ( \rx_temp[0]~0_combout\ & ( (!rx_bit_count(1) & (((rx_temp(2))))) # (rx_bit_count(1) & ((!rx_bit_count(2) & (\Rx~input_o\)) # (rx_bit_count(2) & ((rx_temp(2)))))) ) ) # ( !\rx_temp[0]~0_combout\ & ( rx_temp(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000100101111110000010010111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rx_bit_count(1),
	datab => ALT_INV_rx_bit_count(2),
	datac => \ALT_INV_Rx~input_o\,
	datad => ALT_INV_rx_temp(2),
	dataf => \ALT_INV_rx_temp[0]~0_combout\,
	combout => \rx_temp[2]~4_combout\);

-- Location: FF_X61_Y3_N53
\rx_temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_temp[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_temp(2));

-- Location: LABCELL_X61_Y3_N39
\input[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- input(2) = ( rx_temp(2) & ( (input(2)) # (\DIN_VLD~combout\) ) ) # ( !rx_temp(2) & ( (!\DIN_VLD~combout\ & input(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_DIN_VLD~combout\,
	datad => ALT_INV_input(2),
	dataf => ALT_INV_rx_temp(2),
	combout => input(2));

-- Location: LABCELL_X61_Y3_N9
\tx_data[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- tx_data(2) = ( input(2) & ( (\DIN_VLD~combout\) # (tx_data(2)) ) ) # ( !input(2) & ( (tx_data(2) & !\DIN_VLD~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_tx_data(2),
	datad => \ALT_INV_DIN_VLD~combout\,
	dataf => ALT_INV_input(2),
	combout => tx_data(2));

-- Location: LABCELL_X61_Y3_N15
\rx_temp[3]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_temp[3]~5_combout\ = ( \rx_temp[1]~2_combout\ & ( (!rx_bit_count(1) & ((rx_temp(3)))) # (rx_bit_count(1) & (\Rx~input_o\)) ) ) # ( !\rx_temp[1]~2_combout\ & ( rx_temp(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000101101011110000010110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rx_bit_count(1),
	datac => \ALT_INV_Rx~input_o\,
	datad => ALT_INV_rx_temp(3),
	dataf => \ALT_INV_rx_temp[1]~2_combout\,
	combout => \rx_temp[3]~5_combout\);

-- Location: FF_X61_Y3_N17
\rx_temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_temp[3]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_temp(3));

-- Location: LABCELL_X61_Y3_N24
\input[3]\ : cyclonev_lcell_comb
-- Equation(s):
-- input(3) = ( input(3) & ( rx_temp(3) ) ) # ( !input(3) & ( rx_temp(3) & ( \DIN_VLD~combout\ ) ) ) # ( input(3) & ( !rx_temp(3) & ( !\DIN_VLD~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_DIN_VLD~combout\,
	datae => ALT_INV_input(3),
	dataf => ALT_INV_rx_temp(3),
	combout => input(3));

-- Location: LABCELL_X61_Y3_N42
\tx_data[3]\ : cyclonev_lcell_comb
-- Equation(s):
-- tx_data(3) = ( input(3) & ( (tx_data(3)) # (\DIN_VLD~combout\) ) ) # ( !input(3) & ( (!\DIN_VLD~combout\ & tx_data(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_DIN_VLD~combout\,
	datad => ALT_INV_tx_data(3),
	dataf => ALT_INV_input(3),
	combout => tx_data(3));

-- Location: LABCELL_X61_Y3_N6
\rx_temp[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_temp[0]~1_combout\ = ( \rx_temp[0]~0_combout\ & ( (!rx_bit_count(1) & ((!rx_bit_count(2) & (\Rx~input_o\)) # (rx_bit_count(2) & ((rx_temp(0)))))) # (rx_bit_count(1) & (((rx_temp(0))))) ) ) # ( !\rx_temp[0]~0_combout\ & ( rx_temp(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100100000011111110010000001111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rx_bit_count(1),
	datab => \ALT_INV_Rx~input_o\,
	datac => ALT_INV_rx_bit_count(2),
	datad => ALT_INV_rx_temp(0),
	dataf => \ALT_INV_rx_temp[0]~0_combout\,
	combout => \rx_temp[0]~1_combout\);

-- Location: FF_X61_Y3_N8
\rx_temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_temp[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_temp(0));

-- Location: LABCELL_X61_Y3_N3
\input[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- input(0) = ( rx_temp(0) & ( (input(0)) # (\DIN_VLD~combout\) ) ) # ( !rx_temp(0) & ( (!\DIN_VLD~combout\ & input(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_DIN_VLD~combout\,
	datad => ALT_INV_input(0),
	dataf => ALT_INV_rx_temp(0),
	combout => input(0));

-- Location: LABCELL_X61_Y3_N0
\tx_data[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- tx_data(0) = ( input(0) & ( (tx_data(0)) # (\DIN_VLD~combout\) ) ) # ( !input(0) & ( (!\DIN_VLD~combout\ & tx_data(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_DIN_VLD~combout\,
	datad => ALT_INV_tx_data(0),
	dataf => ALT_INV_input(0),
	combout => tx_data(0));

-- Location: LABCELL_X61_Y3_N30
\Mux0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~4_combout\ = ( !tx_bit_count(1) & ( (!tx_bit_count(0) & (((tx_data(0) & (!tx_bit_count(2)))))) # (tx_bit_count(0) & ((((tx_bit_count(2)))) # (tx_data(1)))) ) ) # ( tx_bit_count(1) & ( ((!tx_bit_count(0) & (tx_data(2) & (!tx_bit_count(2)))) # 
-- (tx_bit_count(0) & (((tx_data(3)) # (tx_bit_count(2)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0001110100110011000011000011001100011101001100110011111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_tx_data(1),
	datab => ALT_INV_tx_bit_count(0),
	datac => ALT_INV_tx_data(2),
	datad => ALT_INV_tx_bit_count(2),
	datae => ALT_INV_tx_bit_count(1),
	dataf => ALT_INV_tx_data(3),
	datag => ALT_INV_tx_data(0),
	combout => \Mux0~4_combout\);

-- Location: MLABCELL_X60_Y3_N15
\rx_temp[6]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_temp[6]~9_combout\ = ( \rx_temp[0]~0_combout\ & ( (!rx_bit_count(2) & (((rx_temp(6))))) # (rx_bit_count(2) & ((!rx_bit_count(1) & ((rx_temp(6)))) # (rx_bit_count(1) & (\Rx~input_o\)))) ) ) # ( !\rx_temp[0]~0_combout\ & ( rx_temp(6) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000001111011110000000111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rx_bit_count(2),
	datab => ALT_INV_rx_bit_count(1),
	datac => \ALT_INV_Rx~input_o\,
	datad => ALT_INV_rx_temp(6),
	dataf => \ALT_INV_rx_temp[0]~0_combout\,
	combout => \rx_temp[6]~9_combout\);

-- Location: FF_X60_Y3_N17
\rx_temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_temp[6]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_temp(6));

-- Location: MLABCELL_X60_Y3_N6
\input[6]\ : cyclonev_lcell_comb
-- Equation(s):
-- input(6) = ( rx_temp(6) & ( (\DIN_VLD~combout\) # (input(6)) ) ) # ( !rx_temp(6) & ( (input(6) & !\DIN_VLD~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000001100110000000000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_input(6),
	datad => \ALT_INV_DIN_VLD~combout\,
	dataf => ALT_INV_rx_temp(6),
	combout => input(6));

-- Location: MLABCELL_X60_Y3_N51
\tx_data[6]\ : cyclonev_lcell_comb
-- Equation(s):
-- tx_data(6) = ( input(6) & ( (\DIN_VLD~combout\) # (tx_data(6)) ) ) # ( !input(6) & ( (tx_data(6) & !\DIN_VLD~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000010101010000000001010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_tx_data(6),
	datad => \ALT_INV_DIN_VLD~combout\,
	dataf => ALT_INV_input(6),
	combout => tx_data(6));

-- Location: LABCELL_X59_Y3_N48
\rx_temp[7]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_temp[7]~10_combout\ = ( \Selector3~0_combout\ & ( \Rx~input_o\ ) ) # ( !\Selector3~0_combout\ & ( rx_temp(7) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Rx~input_o\,
	datad => ALT_INV_rx_temp(7),
	dataf => \ALT_INV_Selector3~0_combout\,
	combout => \rx_temp[7]~10_combout\);

-- Location: FF_X59_Y3_N50
\rx_temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_temp[7]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_temp(7));

-- Location: LABCELL_X59_Y3_N33
\input[7]\ : cyclonev_lcell_comb
-- Equation(s):
-- input(7) = ( rx_temp(7) & ( (\DIN_VLD~combout\) # (input(7)) ) ) # ( !rx_temp(7) & ( (input(7) & !\DIN_VLD~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000010101010000000001010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_input(7),
	datad => \ALT_INV_DIN_VLD~combout\,
	dataf => ALT_INV_rx_temp(7),
	combout => input(7));

-- Location: LABCELL_X59_Y3_N45
\tx_data[7]\ : cyclonev_lcell_comb
-- Equation(s):
-- tx_data(7) = ( input(7) & ( (\DIN_VLD~combout\) # (tx_data(7)) ) ) # ( !input(7) & ( (tx_data(7) & !\DIN_VLD~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_tx_data(7),
	datad => \ALT_INV_DIN_VLD~combout\,
	dataf => ALT_INV_input(7),
	combout => tx_data(7));

-- Location: MLABCELL_X60_Y3_N30
\rx_temp[4]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_temp[4]~6_combout\ = ( \rx_temp[0]~0_combout\ & ( (!rx_bit_count(1) & ((!rx_bit_count(2) & ((rx_temp(4)))) # (rx_bit_count(2) & (\Rx~input_o\)))) # (rx_bit_count(1) & (((rx_temp(4))))) ) ) # ( !\rx_temp[0]~0_combout\ & ( rx_temp(4) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000010111101110000001011110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_rx_bit_count(1),
	datab => \ALT_INV_Rx~input_o\,
	datac => ALT_INV_rx_bit_count(2),
	datad => ALT_INV_rx_temp(4),
	dataf => \ALT_INV_rx_temp[0]~0_combout\,
	combout => \rx_temp[4]~6_combout\);

-- Location: FF_X60_Y3_N32
\rx_temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_temp[4]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_temp(4));

-- Location: MLABCELL_X60_Y3_N57
\input[4]\ : cyclonev_lcell_comb
-- Equation(s):
-- input(4) = ( rx_temp(4) & ( (\DIN_VLD~combout\) # (input(4)) ) ) # ( !rx_temp(4) & ( (input(4) & !\DIN_VLD~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_input(4),
	datad => \ALT_INV_DIN_VLD~combout\,
	dataf => ALT_INV_rx_temp(4),
	combout => input(4));

-- Location: MLABCELL_X60_Y3_N54
\tx_data[4]\ : cyclonev_lcell_comb
-- Equation(s):
-- tx_data(4) = ( input(4) & ( (tx_data(4)) # (\DIN_VLD~combout\) ) ) # ( !input(4) & ( (!\DIN_VLD~combout\ & tx_data(4)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_DIN_VLD~combout\,
	datad => ALT_INV_tx_data(4),
	dataf => ALT_INV_input(4),
	combout => tx_data(4));

-- Location: LABCELL_X61_Y3_N54
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( !tx_bit_count(1) & ( (!\Mux0~4_combout\ & (((tx_data(4) & (tx_bit_count(2)))))) # (\Mux0~4_combout\ & ((((!tx_bit_count(2)))) # (tx_data(5)))) ) ) # ( tx_bit_count(1) & ( ((!\Mux0~4_combout\ & (tx_data(6) & (tx_bit_count(2)))) # 
-- (\Mux0~4_combout\ & (((!tx_bit_count(2)) # (tx_data(7)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0011001100011101001100110000110000110011000111010011001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_tx_data(5),
	datab => \ALT_INV_Mux0~4_combout\,
	datac => ALT_INV_tx_data(6),
	datad => ALT_INV_tx_bit_count(2),
	datae => ALT_INV_tx_bit_count(1),
	dataf => ALT_INV_tx_data(7),
	datag => ALT_INV_tx_data(4),
	combout => \Mux0~0_combout\);

-- Location: LABCELL_X61_Y3_N36
\Tx~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Tx~0_combout\ = ( \Mux0~0_combout\ & ( (!\tx_PS.t_start~q\) # (!\RST~input_o\) ) ) # ( !\Mux0~0_combout\ & ( (!\RST~input_o\) # ((!\tx_PS.t_start~q\ & !\tx_PS.t_send~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110110011101100111011001110110011101110111011101110111011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_tx_PS.t_start~q\,
	datab => \ALT_INV_RST~input_o\,
	datac => \ALT_INV_tx_PS.t_send~q\,
	dataf => \ALT_INV_Mux0~0_combout\,
	combout => \Tx~0_combout\);

-- Location: FF_X61_Y3_N37
\Tx~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \Tx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Tx~reg0_q\);

-- Location: MLABCELL_X60_Y3_N24
\tx_ready~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \tx_ready~2_combout\ = ( \tx_PS.t_idle~q\ & ( \tx_PS.t_stop~q\ ) ) # ( !\tx_PS.t_idle~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_tx_PS.t_stop~q\,
	dataf => \ALT_INV_tx_PS.t_idle~q\,
	combout => \tx_ready~2_combout\);

-- Location: LABCELL_X17_Y17_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


