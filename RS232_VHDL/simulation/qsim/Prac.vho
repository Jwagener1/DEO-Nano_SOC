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

-- DATE "08/23/2021 17:50:55"

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
	Input_data : IN std_logic_vector(7 DOWNTO 0);
	Output_data : OUT std_logic_vector(7 DOWNTO 0);
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
-- Input_data[0]	=>  Location: PIN_U9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input_data[1]	=>  Location: PIN_AA11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input_data[2]	=>  Location: PIN_AE22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input_data[3]	=>  Location: PIN_AF6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input_data[4]	=>  Location: PIN_AH6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input_data[5]	=>  Location: PIN_AE15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input_data[6]	=>  Location: PIN_AG24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Input_data[7]	=>  Location: PIN_AG14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Output_data[0]	=>  Location: PIN_AC24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Output_data[1]	=>  Location: PIN_AG26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Output_data[2]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Output_data[3]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Output_data[4]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Output_data[5]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Output_data[6]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Output_data[7]	=>  Location: PIN_Y18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[0]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[1]	=>  Location: PIN_AE24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[2]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[3]	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[4]	=>  Location: PIN_AF26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[5]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[6]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[7]	=>  Location: PIN_AA23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Tx_Flag	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RST	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rx	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_V11,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_Input_data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Output_data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_LED : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Tx_Flag : std_logic;
SIGNAL \Input_data[0]~input_o\ : std_logic;
SIGNAL \Input_data[1]~input_o\ : std_logic;
SIGNAL \Input_data[2]~input_o\ : std_logic;
SIGNAL \Input_data[3]~input_o\ : std_logic;
SIGNAL \Input_data[4]~input_o\ : std_logic;
SIGNAL \Input_data[5]~input_o\ : std_logic;
SIGNAL \Input_data[6]~input_o\ : std_logic;
SIGNAL \Input_data[7]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputCLKENA0_outclk\ : std_logic;
SIGNAL \RST~input_o\ : std_logic;
SIGNAL \Rx~input_o\ : std_logic;
SIGNAL \main_clock|Div_cnt~0_combout\ : std_logic;
SIGNAL \main_clock|Div_cnt~1_combout\ : std_logic;
SIGNAL \main_clock|Div_cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \main_clock|Div_cnt[2]~2_combout\ : std_logic;
SIGNAL \main_clock|Div_cnt[2]~DUPLICATE_q\ : std_logic;
SIGNAL \main_clock|Div_cnt~3_combout\ : std_logic;
SIGNAL \main_clock|Div_cnt~4_combout\ : std_logic;
SIGNAL \main_clock|Equal0~0_combout\ : std_logic;
SIGNAL \main_clock|Trig~q\ : std_logic;
SIGNAL \rx_clock|Div_cnt[0]~0_combout\ : std_logic;
SIGNAL \rx_clock|Div_cnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \rx_clock|Div_cnt[1]~1_combout\ : std_logic;
SIGNAL \rx_clock|Div_cnt[2]~2_combout\ : std_logic;
SIGNAL \rx_clock|Div_cnt[3]~3_combout\ : std_logic;
SIGNAL \rx_clock|Div_cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \rx_clock|Trig~0_combout\ : std_logic;
SIGNAL \rx_clock|Trig~q\ : std_logic;
SIGNAL \rx_clock|Trig~DUPLICATE_q\ : std_logic;
SIGNAL \rx_PS~9_combout\ : std_logic;
SIGNAL \rx_PS.r_start~q\ : std_logic;
SIGNAL \rx_bit_count~2_combout\ : std_logic;
SIGNAL \rx_bit_count[0]~1_combout\ : std_logic;
SIGNAL \rx_bit_count~3_combout\ : std_logic;
SIGNAL \rx_bit_count~0_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \rx_PS~8_combout\ : std_logic;
SIGNAL \rx_PS.r_rec~q\ : std_logic;
SIGNAL \rx_PS~7_combout\ : std_logic;
SIGNAL \rx_PS.r_stop~q\ : std_logic;
SIGNAL \rx_PS~6_combout\ : std_logic;
SIGNAL \rx_PS.r_idle~q\ : std_logic;
SIGNAL \uart_recieve~0_combout\ : std_logic;
SIGNAL \rx_temp[6]~feeder_combout\ : std_logic;
SIGNAL \rx_temp[5]~feeder_combout\ : std_logic;
SIGNAL \rx_temp[3]~feeder_combout\ : std_logic;
SIGNAL \rx_temp[1]~feeder_combout\ : std_logic;
SIGNAL \rx_temp[4]~DUPLICATE_q\ : std_logic;
SIGNAL rx_temp : std_logic_vector(7 DOWNTO 0);
SIGNAL \main_clock|Div_cnt\ : std_logic_vector(4 DOWNTO 0);
SIGNAL rx_bit_count : std_logic_vector(2 DOWNTO 0);
SIGNAL \rx_clock|Div_cnt\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \main_clock|ALT_INV_Div_cnt[2]~DUPLICATE_q\ : std_logic;
SIGNAL \main_clock|ALT_INV_Div_cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \rx_clock|ALT_INV_Div_cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \rx_clock|ALT_INV_Div_cnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \rx_clock|ALT_INV_Trig~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_Rx~input_o\ : std_logic;
SIGNAL \ALT_INV_RST~input_o\ : std_logic;
SIGNAL \main_clock|ALT_INV_Div_cnt\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \rx_clock|ALT_INV_Div_cnt\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \main_clock|ALT_INV_Trig~q\ : std_logic;
SIGNAL \ALT_INV_rx_PS.r_start~q\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL ALT_INV_rx_bit_count : std_logic_vector(2 DOWNTO 0);
SIGNAL ALT_INV_rx_temp : std_logic_vector(7 DOWNTO 2);
SIGNAL \rx_clock|ALT_INV_Trig~q\ : std_logic;
SIGNAL \ALT_INV_rx_PS.r_rec~q\ : std_logic;
SIGNAL \ALT_INV_rx_PS.r_stop~q\ : std_logic;
SIGNAL \ALT_INV_rx_PS.r_idle~q\ : std_logic;

BEGIN

ww_CLK <= CLK;
ww_RST <= RST;
Tx <= ww_Tx;
ww_Rx <= Rx;
STE <= ww_STE;
Sample_clk <= ww_Sample_clk;
ww_Input_data <= Input_data;
Output_data <= ww_Output_data;
LED <= ww_LED;
Tx_Flag <= ww_Tx_Flag;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\main_clock|ALT_INV_Div_cnt[2]~DUPLICATE_q\ <= NOT \main_clock|Div_cnt[2]~DUPLICATE_q\;
\main_clock|ALT_INV_Div_cnt[1]~DUPLICATE_q\ <= NOT \main_clock|Div_cnt[1]~DUPLICATE_q\;
\rx_clock|ALT_INV_Div_cnt[1]~DUPLICATE_q\ <= NOT \rx_clock|Div_cnt[1]~DUPLICATE_q\;
\rx_clock|ALT_INV_Div_cnt[0]~DUPLICATE_q\ <= NOT \rx_clock|Div_cnt[0]~DUPLICATE_q\;
\rx_clock|ALT_INV_Trig~DUPLICATE_q\ <= NOT \rx_clock|Trig~DUPLICATE_q\;
\ALT_INV_Rx~input_o\ <= NOT \Rx~input_o\;
\ALT_INV_RST~input_o\ <= NOT \RST~input_o\;
\main_clock|ALT_INV_Div_cnt\(4) <= NOT \main_clock|Div_cnt\(4);
\main_clock|ALT_INV_Div_cnt\(3) <= NOT \main_clock|Div_cnt\(3);
\main_clock|ALT_INV_Div_cnt\(2) <= NOT \main_clock|Div_cnt\(2);
\main_clock|ALT_INV_Div_cnt\(0) <= NOT \main_clock|Div_cnt\(0);
\main_clock|ALT_INV_Div_cnt\(1) <= NOT \main_clock|Div_cnt\(1);
\rx_clock|ALT_INV_Div_cnt\(3) <= NOT \rx_clock|Div_cnt\(3);
\rx_clock|ALT_INV_Div_cnt\(2) <= NOT \rx_clock|Div_cnt\(2);
\rx_clock|ALT_INV_Div_cnt\(1) <= NOT \rx_clock|Div_cnt\(1);
\rx_clock|ALT_INV_Div_cnt\(0) <= NOT \rx_clock|Div_cnt\(0);
\main_clock|ALT_INV_Trig~q\ <= NOT \main_clock|Trig~q\;
\ALT_INV_rx_PS.r_start~q\ <= NOT \rx_PS.r_start~q\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
ALT_INV_rx_bit_count(1) <= NOT rx_bit_count(1);
ALT_INV_rx_bit_count(0) <= NOT rx_bit_count(0);
ALT_INV_rx_bit_count(2) <= NOT rx_bit_count(2);
ALT_INV_rx_temp(7) <= NOT rx_temp(7);
ALT_INV_rx_temp(6) <= NOT rx_temp(6);
ALT_INV_rx_temp(4) <= NOT rx_temp(4);
ALT_INV_rx_temp(2) <= NOT rx_temp(2);
\rx_clock|ALT_INV_Trig~q\ <= NOT \rx_clock|Trig~q\;
\ALT_INV_rx_PS.r_rec~q\ <= NOT \rx_PS.r_rec~q\;
\ALT_INV_rx_PS.r_stop~q\ <= NOT \rx_PS.r_stop~q\;
\ALT_INV_rx_PS.r_idle~q\ <= NOT \rx_PS.r_idle~q\;

-- Location: IOOBUF_X46_Y0_N2
\Tx~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
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
	i => \ALT_INV_rx_PS.r_idle~q\,
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
	i => \rx_PS.r_stop~q\,
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
	i => \rx_PS.r_rec~q\,
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
	i => \rx_clock|Trig~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_Sample_clk);

-- Location: IOOBUF_X68_Y12_N39
\Output_data[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_temp(0),
	devoe => ww_devoe,
	o => ww_Output_data(0));

-- Location: IOOBUF_X62_Y0_N76
\Output_data[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_temp(1),
	devoe => ww_devoe,
	o => ww_Output_data(1));

-- Location: IOOBUF_X68_Y11_N5
\Output_data[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_temp(2),
	devoe => ww_devoe,
	o => ww_Output_data(2));

-- Location: IOOBUF_X68_Y13_N39
\Output_data[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_temp(3),
	devoe => ww_devoe,
	o => ww_Output_data(3));

-- Location: IOOBUF_X68_Y10_N62
\Output_data[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_temp[4]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_Output_data(4));

-- Location: IOOBUF_X68_Y10_N45
\Output_data[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_temp(5),
	devoe => ww_devoe,
	o => ww_Output_data(5));

-- Location: IOOBUF_X68_Y12_N56
\Output_data[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_temp(6),
	devoe => ww_devoe,
	o => ww_Output_data(6));

-- Location: IOOBUF_X68_Y11_N22
\Output_data[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rx_temp(7),
	devoe => ww_devoe,
	o => ww_Output_data(7));

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

-- Location: IOOBUF_X62_Y0_N42
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
	i => \rx_temp[4]~DUPLICATE_q\,
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

-- Location: IOOBUF_X12_Y0_N36
\Tx_Flag~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
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

-- Location: FF_X63_Y2_N34
\rx_clock|Div_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_clock|Div_cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_clock|Div_cnt\(0));

-- Location: LABCELL_X63_Y2_N12
\main_clock|Div_cnt~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \main_clock|Div_cnt~0_combout\ = ( \main_clock|Div_cnt\(0) & ( !\main_clock|Div_cnt\(1) ) ) # ( !\main_clock|Div_cnt\(0) & ( (\main_clock|Div_cnt\(1) & (((!\main_clock|Div_cnt\(4)) # (!\main_clock|Div_cnt\(3))) # (\main_clock|Div_cnt[2]~DUPLICATE_q\))) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111101000000001111110111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \main_clock|ALT_INV_Div_cnt[2]~DUPLICATE_q\,
	datab => \main_clock|ALT_INV_Div_cnt\(4),
	datac => \main_clock|ALT_INV_Div_cnt\(3),
	datad => \main_clock|ALT_INV_Div_cnt\(1),
	dataf => \main_clock|ALT_INV_Div_cnt\(0),
	combout => \main_clock|Div_cnt~0_combout\);

-- Location: FF_X63_Y2_N14
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

-- Location: FF_X63_Y2_N25
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

-- Location: LABCELL_X63_Y2_N45
\main_clock|Div_cnt~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \main_clock|Div_cnt~1_combout\ = ( \main_clock|Div_cnt\(2) & ( !\main_clock|Div_cnt\(0) ) ) # ( !\main_clock|Div_cnt\(2) & ( (!\main_clock|Div_cnt\(0) & ((!\main_clock|Div_cnt\(3)) # ((!\main_clock|Div_cnt\(1)) # (!\main_clock|Div_cnt\(4))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111000000000111111100000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \main_clock|ALT_INV_Div_cnt\(3),
	datab => \main_clock|ALT_INV_Div_cnt\(1),
	datac => \main_clock|ALT_INV_Div_cnt\(4),
	datad => \main_clock|ALT_INV_Div_cnt\(0),
	dataf => \main_clock|ALT_INV_Div_cnt\(2),
	combout => \main_clock|Div_cnt~1_combout\);

-- Location: FF_X63_Y2_N47
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

-- Location: FF_X63_Y2_N13
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

-- Location: LABCELL_X63_Y2_N24
\main_clock|Div_cnt[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \main_clock|Div_cnt[2]~2_combout\ = ( \main_clock|Div_cnt[1]~DUPLICATE_q\ & ( !\main_clock|Div_cnt\(0) $ (!\main_clock|Div_cnt\(2)) ) ) # ( !\main_clock|Div_cnt[1]~DUPLICATE_q\ & ( \main_clock|Div_cnt\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100110011110011000011001111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \main_clock|ALT_INV_Div_cnt\(0),
	datad => \main_clock|ALT_INV_Div_cnt\(2),
	dataf => \main_clock|ALT_INV_Div_cnt[1]~DUPLICATE_q\,
	combout => \main_clock|Div_cnt[2]~2_combout\);

-- Location: FF_X63_Y2_N26
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

-- Location: LABCELL_X63_Y2_N15
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

-- Location: FF_X63_Y2_N17
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

-- Location: LABCELL_X63_Y2_N42
\main_clock|Div_cnt~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \main_clock|Div_cnt~4_combout\ = ( \main_clock|Div_cnt\(0) & ( !\main_clock|Div_cnt\(4) $ (((!\main_clock|Div_cnt\(3)) # ((!\main_clock|Div_cnt\(1)) # (!\main_clock|Div_cnt[2]~DUPLICATE_q\)))) ) ) # ( !\main_clock|Div_cnt\(0) & ( (\main_clock|Div_cnt\(4) 
-- & ((!\main_clock|Div_cnt\(3)) # ((!\main_clock|Div_cnt\(1)) # (\main_clock|Div_cnt[2]~DUPLICATE_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011101111000000001110111100000001111111100000000111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \main_clock|ALT_INV_Div_cnt\(3),
	datab => \main_clock|ALT_INV_Div_cnt\(1),
	datac => \main_clock|ALT_INV_Div_cnt[2]~DUPLICATE_q\,
	datad => \main_clock|ALT_INV_Div_cnt\(4),
	dataf => \main_clock|ALT_INV_Div_cnt\(0),
	combout => \main_clock|Div_cnt~4_combout\);

-- Location: FF_X63_Y2_N44
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

-- Location: LABCELL_X63_Y2_N27
\main_clock|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \main_clock|Equal0~0_combout\ = ( !\main_clock|Div_cnt\(2) & ( (\main_clock|Div_cnt\(4) & (!\main_clock|Div_cnt\(0) & (\main_clock|Div_cnt\(1) & \main_clock|Div_cnt\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000000000000010000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \main_clock|ALT_INV_Div_cnt\(4),
	datab => \main_clock|ALT_INV_Div_cnt\(0),
	datac => \main_clock|ALT_INV_Div_cnt\(1),
	datad => \main_clock|ALT_INV_Div_cnt\(3),
	dataf => \main_clock|ALT_INV_Div_cnt\(2),
	combout => \main_clock|Equal0~0_combout\);

-- Location: FF_X63_Y2_N28
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

-- Location: LABCELL_X63_Y2_N33
\rx_clock|Div_cnt[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_clock|Div_cnt[0]~0_combout\ = ( !\rx_clock|Div_cnt\(0) & ( \main_clock|Trig~q\ ) ) # ( \rx_clock|Div_cnt\(0) & ( !\main_clock|Trig~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \rx_clock|ALT_INV_Div_cnt\(0),
	dataf => \main_clock|ALT_INV_Trig~q\,
	combout => \rx_clock|Div_cnt[0]~0_combout\);

-- Location: FF_X63_Y2_N35
\rx_clock|Div_cnt[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_clock|Div_cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_clock|Div_cnt[0]~DUPLICATE_q\);

-- Location: LABCELL_X63_Y2_N0
\rx_clock|Div_cnt[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_clock|Div_cnt[1]~1_combout\ = ( \rx_clock|Div_cnt\(1) & ( \main_clock|Trig~q\ & ( !\rx_clock|Div_cnt[0]~DUPLICATE_q\ ) ) ) # ( !\rx_clock|Div_cnt\(1) & ( \main_clock|Trig~q\ & ( \rx_clock|Div_cnt[0]~DUPLICATE_q\ ) ) ) # ( \rx_clock|Div_cnt\(1) & ( 
-- !\main_clock|Trig~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100001111000011111111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \rx_clock|ALT_INV_Div_cnt[0]~DUPLICATE_q\,
	datae => \rx_clock|ALT_INV_Div_cnt\(1),
	dataf => \main_clock|ALT_INV_Trig~q\,
	combout => \rx_clock|Div_cnt[1]~1_combout\);

-- Location: FF_X63_Y2_N2
\rx_clock|Div_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_clock|Div_cnt[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_clock|Div_cnt\(1));

-- Location: LABCELL_X63_Y2_N54
\rx_clock|Div_cnt[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_clock|Div_cnt[2]~2_combout\ = ( \main_clock|Trig~q\ & ( !\rx_clock|Div_cnt\(2) $ (((!\rx_clock|Div_cnt[0]~DUPLICATE_q\) # (!\rx_clock|Div_cnt\(1)))) ) ) # ( !\main_clock|Trig~q\ & ( \rx_clock|Div_cnt\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000101111110100000010111111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \rx_clock|ALT_INV_Div_cnt[0]~DUPLICATE_q\,
	datac => \rx_clock|ALT_INV_Div_cnt\(1),
	datad => \rx_clock|ALT_INV_Div_cnt\(2),
	dataf => \main_clock|ALT_INV_Trig~q\,
	combout => \rx_clock|Div_cnt[2]~2_combout\);

-- Location: FF_X63_Y2_N55
\rx_clock|Div_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_clock|Div_cnt[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_clock|Div_cnt\(2));

-- Location: LABCELL_X63_Y2_N57
\rx_clock|Div_cnt[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_clock|Div_cnt[3]~3_combout\ = ( \main_clock|Trig~q\ & ( !\rx_clock|Div_cnt\(3) $ (((!\rx_clock|Div_cnt[0]~DUPLICATE_q\) # ((!\rx_clock|Div_cnt\(2)) # (!\rx_clock|Div_cnt\(1))))) ) ) # ( !\main_clock|Trig~q\ & ( \rx_clock|Div_cnt\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000001111111100000000111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \rx_clock|ALT_INV_Div_cnt[0]~DUPLICATE_q\,
	datab => \rx_clock|ALT_INV_Div_cnt\(2),
	datac => \rx_clock|ALT_INV_Div_cnt\(1),
	datad => \rx_clock|ALT_INV_Div_cnt\(3),
	dataf => \main_clock|ALT_INV_Trig~q\,
	combout => \rx_clock|Div_cnt[3]~3_combout\);

-- Location: FF_X63_Y2_N58
\rx_clock|Div_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_clock|Div_cnt[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_clock|Div_cnt\(3));

-- Location: FF_X63_Y2_N1
\rx_clock|Div_cnt[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_clock|Div_cnt[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_clock|Div_cnt[1]~DUPLICATE_q\);

-- Location: LABCELL_X64_Y2_N12
\rx_clock|Trig~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_clock|Trig~0_combout\ = ( !\rx_clock|Div_cnt\(0) & ( !\rx_clock|Div_cnt\(2) & ( (\rx_clock|Div_cnt\(3) & (\main_clock|Trig~q\ & !\rx_clock|Div_cnt[1]~DUPLICATE_q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \rx_clock|ALT_INV_Div_cnt\(3),
	datac => \main_clock|ALT_INV_Trig~q\,
	datad => \rx_clock|ALT_INV_Div_cnt[1]~DUPLICATE_q\,
	datae => \rx_clock|ALT_INV_Div_cnt\(0),
	dataf => \rx_clock|ALT_INV_Div_cnt\(2),
	combout => \rx_clock|Trig~0_combout\);

-- Location: FF_X64_Y2_N14
\rx_clock|Trig\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_clock|Trig~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_clock|Trig~q\);

-- Location: FF_X64_Y2_N13
\rx_clock|Trig~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_clock|Trig~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_clock|Trig~DUPLICATE_q\);

-- Location: LABCELL_X64_Y2_N3
\rx_PS~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_PS~9_combout\ = ( \rx_PS.r_idle~q\ & ( (\RST~input_o\ & (!\rx_clock|Trig~DUPLICATE_q\ & \rx_PS.r_start~q\)) ) ) # ( !\rx_PS.r_idle~q\ & ( (\RST~input_o\ & ((!\Rx~input_o\) # ((!\rx_clock|Trig~DUPLICATE_q\ & \rx_PS.r_start~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010100010100000101010000000000010001000000000001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_RST~input_o\,
	datab => \rx_clock|ALT_INV_Trig~DUPLICATE_q\,
	datac => \ALT_INV_Rx~input_o\,
	datad => \ALT_INV_rx_PS.r_start~q\,
	dataf => \ALT_INV_rx_PS.r_idle~q\,
	combout => \rx_PS~9_combout\);

-- Location: FF_X64_Y2_N5
\rx_PS.r_start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_PS~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_PS.r_start~q\);

-- Location: LABCELL_X64_Y2_N45
\rx_bit_count~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_bit_count~2_combout\ = (\RST~input_o\ & !rx_bit_count(0))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000001100110000000000110011000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_RST~input_o\,
	datad => ALT_INV_rx_bit_count(0),
	combout => \rx_bit_count~2_combout\);

-- Location: LABCELL_X64_Y2_N21
\rx_bit_count[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_bit_count[0]~1_combout\ = ( \rx_clock|Trig~q\ & ( (!\RST~input_o\) # (\rx_PS.r_rec~q\) ) ) # ( !\rx_clock|Trig~q\ & ( !\RST~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010111111111010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_RST~input_o\,
	datad => \ALT_INV_rx_PS.r_rec~q\,
	dataf => \rx_clock|ALT_INV_Trig~q\,
	combout => \rx_bit_count[0]~1_combout\);

-- Location: FF_X64_Y2_N47
\rx_bit_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_bit_count~2_combout\,
	ena => \rx_bit_count[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_bit_count(0));

-- Location: LABCELL_X64_Y2_N24
\rx_bit_count~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_bit_count~3_combout\ = ( !rx_bit_count(1) & ( rx_bit_count(0) & ( \RST~input_o\ ) ) ) # ( rx_bit_count(1) & ( !rx_bit_count(0) & ( \RST~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100110011001100110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_RST~input_o\,
	datae => ALT_INV_rx_bit_count(1),
	dataf => ALT_INV_rx_bit_count(0),
	combout => \rx_bit_count~3_combout\);

-- Location: FF_X64_Y2_N26
\rx_bit_count[1]\ : dffeas
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
	q => rx_bit_count(1));

-- Location: LABCELL_X64_Y2_N42
\rx_bit_count~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_bit_count~0_combout\ = ( rx_bit_count(0) & ( (\RST~input_o\ & (!rx_bit_count(1) $ (!rx_bit_count(2)))) ) ) # ( !rx_bit_count(0) & ( (\RST~input_o\ & rx_bit_count(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011000000000011001100000011001100000000001100110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_RST~input_o\,
	datac => ALT_INV_rx_bit_count(1),
	datad => ALT_INV_rx_bit_count(2),
	dataf => ALT_INV_rx_bit_count(0),
	combout => \rx_bit_count~0_combout\);

-- Location: FF_X64_Y2_N44
\rx_bit_count[2]\ : dffeas
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
	q => rx_bit_count(2));

-- Location: LABCELL_X64_Y2_N39
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( rx_bit_count(1) & ( (rx_bit_count(2) & rx_bit_count(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_rx_bit_count(2),
	datad => ALT_INV_rx_bit_count(0),
	dataf => ALT_INV_rx_bit_count(1),
	combout => \Equal0~0_combout\);

-- Location: LABCELL_X64_Y2_N0
\rx_PS~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_PS~8_combout\ = ( \Equal0~0_combout\ & ( (\RST~input_o\ & ((!\rx_clock|Trig~DUPLICATE_q\ & ((\rx_PS.r_rec~q\))) # (\rx_clock|Trig~DUPLICATE_q\ & (\rx_PS.r_start~q\)))) ) ) # ( !\Equal0~0_combout\ & ( (\RST~input_o\ & (((\rx_clock|Trig~DUPLICATE_q\ & 
-- \rx_PS.r_start~q\)) # (\rx_PS.r_rec~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101010101000000010101010100000001010001010000000101000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_RST~input_o\,
	datab => \rx_clock|ALT_INV_Trig~DUPLICATE_q\,
	datac => \ALT_INV_rx_PS.r_start~q\,
	datad => \ALT_INV_rx_PS.r_rec~q\,
	dataf => \ALT_INV_Equal0~0_combout\,
	combout => \rx_PS~8_combout\);

-- Location: FF_X64_Y2_N2
\rx_PS.r_rec\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_PS~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_PS.r_rec~q\);

-- Location: LABCELL_X64_Y2_N18
\rx_PS~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_PS~7_combout\ = ( \Equal0~0_combout\ & ( (\RST~input_o\ & ((!\rx_clock|Trig~q\ & ((\rx_PS.r_stop~q\))) # (\rx_clock|Trig~q\ & (\rx_PS.r_rec~q\)))) ) ) # ( !\Equal0~0_combout\ & ( (\RST~input_o\ & (!\rx_clock|Trig~q\ & \rx_PS.r_stop~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000100000000000100010000000001010001010000000101000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_RST~input_o\,
	datab => \rx_clock|ALT_INV_Trig~q\,
	datac => \ALT_INV_rx_PS.r_rec~q\,
	datad => \ALT_INV_rx_PS.r_stop~q\,
	dataf => \ALT_INV_Equal0~0_combout\,
	combout => \rx_PS~7_combout\);

-- Location: FF_X64_Y2_N20
\rx_PS.r_stop\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_PS~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_PS.r_stop~q\);

-- Location: LABCELL_X64_Y2_N36
\rx_PS~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_PS~6_combout\ = ( \rx_clock|Trig~DUPLICATE_q\ & ( (\RST~input_o\ & (!\rx_PS.r_stop~q\ & ((!\Rx~input_o\) # (\rx_PS.r_idle~q\)))) ) ) # ( !\rx_clock|Trig~DUPLICATE_q\ & ( (\RST~input_o\ & ((!\Rx~input_o\) # (\rx_PS.r_idle~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001010101010001000101010101000000010100000100000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_RST~input_o\,
	datab => \ALT_INV_Rx~input_o\,
	datac => \ALT_INV_rx_PS.r_stop~q\,
	datad => \ALT_INV_rx_PS.r_idle~q\,
	dataf => \rx_clock|ALT_INV_Trig~DUPLICATE_q\,
	combout => \rx_PS~6_combout\);

-- Location: FF_X64_Y2_N38
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

-- Location: LABCELL_X64_Y2_N9
\uart_recieve~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \uart_recieve~0_combout\ = ( \rx_PS.r_rec~q\ & ( \rx_clock|Trig~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_rx_PS.r_rec~q\,
	dataf => \rx_clock|ALT_INV_Trig~q\,
	combout => \uart_recieve~0_combout\);

-- Location: FF_X64_Y2_N35
\rx_temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \Rx~input_o\,
	sload => VCC,
	ena => \uart_recieve~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_temp(7));

-- Location: LABCELL_X64_Y2_N57
\rx_temp[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_temp[6]~feeder_combout\ = ( rx_temp(7) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_rx_temp(7),
	combout => \rx_temp[6]~feeder_combout\);

-- Location: FF_X64_Y2_N58
\rx_temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_temp[6]~feeder_combout\,
	ena => \uart_recieve~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_temp(6));

-- Location: LABCELL_X64_Y2_N51
\rx_temp[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_temp[5]~feeder_combout\ = ( rx_temp(6) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_rx_temp(6),
	combout => \rx_temp[5]~feeder_combout\);

-- Location: FF_X64_Y2_N52
\rx_temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_temp[5]~feeder_combout\,
	ena => \uart_recieve~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_temp(5));

-- Location: FF_X64_Y2_N50
\rx_temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => rx_temp(5),
	sload => VCC,
	ena => \uart_recieve~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_temp(4));

-- Location: LABCELL_X64_Y2_N54
\rx_temp[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_temp[3]~feeder_combout\ = ( rx_temp(4) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_rx_temp(4),
	combout => \rx_temp[3]~feeder_combout\);

-- Location: FF_X64_Y2_N56
\rx_temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_temp[3]~feeder_combout\,
	ena => \uart_recieve~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_temp(3));

-- Location: FF_X64_Y2_N8
\rx_temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => rx_temp(3),
	sload => VCC,
	ena => \uart_recieve~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_temp(2));

-- Location: LABCELL_X64_Y2_N30
\rx_temp[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \rx_temp[1]~feeder_combout\ = ( rx_temp(2) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_rx_temp(2),
	combout => \rx_temp[1]~feeder_combout\);

-- Location: FF_X64_Y2_N32
\rx_temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \rx_temp[1]~feeder_combout\,
	ena => \uart_recieve~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_temp(1));

-- Location: FF_X64_Y2_N11
\rx_temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => rx_temp(1),
	sload => VCC,
	ena => \uart_recieve~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rx_temp(0));

-- Location: FF_X64_Y2_N49
\rx_temp[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => rx_temp(5),
	sload => VCC,
	ena => \uart_recieve~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_temp[4]~DUPLICATE_q\);

-- Location: IOIBUF_X4_Y0_N1
\Input_data[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input_data(0),
	o => \Input_data[0]~input_o\);

-- Location: IOIBUF_X7_Y0_N18
\Input_data[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input_data(1),
	o => \Input_data[1]~input_o\);

-- Location: IOIBUF_X57_Y0_N18
\Input_data[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input_data(2),
	o => \Input_data[2]~input_o\);

-- Location: IOIBUF_X15_Y0_N52
\Input_data[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input_data(3),
	o => \Input_data[3]~input_o\);

-- Location: IOIBUF_X21_Y0_N35
\Input_data[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input_data(4),
	o => \Input_data[4]~input_o\);

-- Location: IOIBUF_X36_Y0_N18
\Input_data[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input_data(5),
	o => \Input_data[5]~input_o\);

-- Location: IOIBUF_X61_Y0_N35
\Input_data[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input_data(6),
	o => \Input_data[6]~input_o\);

-- Location: IOIBUF_X42_Y0_N35
\Input_data[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input_data(7),
	o => \Input_data[7]~input_o\);

-- Location: LABCELL_X49_Y6_N3
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


