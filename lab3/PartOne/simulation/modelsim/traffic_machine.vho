-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 15.0.2 Build 153 07/15/2015 SJ Web Edition"

-- DATE "10/19/2017 10:00:43"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
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

ENTITY 	traffic_machine IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	ivalid : IN std_logic;
	input : IN std_logic_vector(2 DOWNTO 0);
	output : OUT std_logic_vector(7 DOWNTO 0)
	);
END traffic_machine;

-- Design Ports Information
-- output[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[1]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[2]	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[3]	=>  Location: PIN_AA28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[4]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[5]	=>  Location: PIN_AE29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[6]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[7]	=>  Location: PIN_AB30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[1]	=>  Location: PIN_AA30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[2]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[0]	=>  Location: PIN_AC29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ivalid	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF traffic_machine IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_ivalid : std_logic;
SIGNAL ww_input : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_output : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \input[1]~input_o\ : std_logic;
SIGNAL \input[2]~input_o\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \input[0]~input_o\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \ivalid~input_o\ : std_logic;
SIGNAL \trafficColors.yellow~q\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \trafficColors.right_turn~q\ : std_logic;
SIGNAL \trafficColors.flash_red~feeder_combout\ : std_logic;
SIGNAL \trafficColors.flash_red~q\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \trafficColors.red~q\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \trafficColors.left_turn~q\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \trafficColors.green~q\ : std_logic;
SIGNAL \ALT_INV_trafficColors.red~q\ : std_logic;
SIGNAL \ALT_INV_trafficColors.yellow~q\ : std_logic;
SIGNAL \ALT_INV_trafficColors.green~q\ : std_logic;
SIGNAL \ALT_INV_input[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_Selector1~1_combout\ : std_logic;
SIGNAL \ALT_INV_trafficColors.flash_red~q\ : std_logic;
SIGNAL \ALT_INV_trafficColors.right_turn~q\ : std_logic;
SIGNAL \ALT_INV_trafficColors.left_turn~q\ : std_logic;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_ivalid <= ivalid;
ww_input <= input;
output <= ww_output;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_trafficColors.red~q\ <= NOT \trafficColors.red~q\;
\ALT_INV_trafficColors.yellow~q\ <= NOT \trafficColors.yellow~q\;
\ALT_INV_trafficColors.green~q\ <= NOT \trafficColors.green~q\;
\ALT_INV_input[0]~input_o\ <= NOT \input[0]~input_o\;
\ALT_INV_input[2]~input_o\ <= NOT \input[2]~input_o\;
\ALT_INV_input[1]~input_o\ <= NOT \input[1]~input_o\;
\ALT_INV_Selector1~1_combout\ <= NOT \Selector1~1_combout\;
\ALT_INV_trafficColors.flash_red~q\ <= NOT \trafficColors.flash_red~q\;
\ALT_INV_trafficColors.right_turn~q\ <= NOT \trafficColors.right_turn~q\;
\ALT_INV_trafficColors.left_turn~q\ <= NOT \trafficColors.left_turn~q\;

-- Location: IOOBUF_X89_Y21_N39
\output[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_trafficColors.green~q\,
	devoe => ww_devoe,
	o => ww_output(0));

-- Location: IOOBUF_X89_Y23_N5
\output[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_trafficColors.yellow~q\,
	devoe => ww_devoe,
	o => ww_output(1));

-- Location: IOOBUF_X89_Y23_N56
\output[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_trafficColors.red~q\,
	devoe => ww_devoe,
	o => ww_output(2));

-- Location: IOOBUF_X89_Y21_N56
\output[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_trafficColors.left_turn~q\,
	devoe => ww_devoe,
	o => ww_output(3));

-- Location: IOOBUF_X28_Y81_N53
\output[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_output(4));

-- Location: IOOBUF_X89_Y23_N39
\output[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_trafficColors.right_turn~q\,
	devoe => ww_devoe,
	o => ww_output(5));

-- Location: IOOBUF_X50_Y0_N42
\output[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_output(6));

-- Location: IOOBUF_X89_Y21_N5
\output[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \trafficColors.flash_red~q\,
	devoe => ww_devoe,
	o => ww_output(7));

-- Location: IOIBUF_X89_Y23_N21
\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G11
\clock~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clock~input_o\,
	outclk => \clock~inputCLKENA0_outclk\);

-- Location: IOIBUF_X89_Y21_N21
\input[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(1),
	o => \input[1]~input_o\);

-- Location: IOIBUF_X89_Y20_N61
\input[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(2),
	o => \input[2]~input_o\);

-- Location: LABCELL_X88_Y21_N57
\Selector1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = ( !\input[2]~input_o\ & ( !\input[1]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[1]~input_o\,
	dataf => \ALT_INV_input[2]~input_o\,
	combout => \Selector1~1_combout\);

-- Location: IOIBUF_X89_Y20_N95
\input[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(0),
	o => \input[0]~input_o\);

-- Location: LABCELL_X88_Y21_N54
\Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = ( \trafficColors.left_turn~q\ & ( ((!\input[1]~input_o\ & !\input[0]~input_o\)) # (\trafficColors.green~q\) ) ) # ( !\trafficColors.left_turn~q\ & ( \trafficColors.green~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111110001000111111111000100011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[1]~input_o\,
	datab => \ALT_INV_input[0]~input_o\,
	datad => \ALT_INV_trafficColors.green~q\,
	dataf => \ALT_INV_trafficColors.left_turn~q\,
	combout => \Selector3~0_combout\);

-- Location: IOIBUF_X89_Y20_N78
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: IOIBUF_X89_Y20_N44
\ivalid~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ivalid,
	o => \ivalid~input_o\);

-- Location: FF_X88_Y21_N56
\trafficColors.yellow\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Selector3~0_combout\,
	clrn => \reset~input_o\,
	ena => \ivalid~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \trafficColors.yellow~q\);

-- Location: LABCELL_X88_Y21_N39
\Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = ( \trafficColors.yellow~q\ & ( \trafficColors.red~q\ & ( \input[0]~input_o\ ) ) ) # ( !\trafficColors.yellow~q\ & ( \trafficColors.red~q\ & ( (!\input[1]~input_o\ & (\input[0]~input_o\ & !\input[2]~input_o\)) ) ) ) # ( 
-- \trafficColors.yellow~q\ & ( !\trafficColors.red~q\ & ( \input[0]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100100000001000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[1]~input_o\,
	datab => \ALT_INV_input[0]~input_o\,
	datac => \ALT_INV_input[2]~input_o\,
	datae => \ALT_INV_trafficColors.yellow~q\,
	dataf => \ALT_INV_trafficColors.red~q\,
	combout => \Selector5~0_combout\);

-- Location: FF_X88_Y21_N41
\trafficColors.right_turn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Selector5~0_combout\,
	clrn => \reset~input_o\,
	ena => \ivalid~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \trafficColors.right_turn~q\);

-- Location: LABCELL_X88_Y21_N42
\trafficColors.flash_red~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \trafficColors.flash_red~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \trafficColors.flash_red~feeder_combout\);

-- Location: FF_X88_Y21_N44
\trafficColors.flash_red\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \trafficColors.flash_red~feeder_combout\,
	clrn => \reset~input_o\,
	ena => \ivalid~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \trafficColors.flash_red~q\);

-- Location: LABCELL_X88_Y21_N48
\Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = ( \trafficColors.red~q\ & ( \trafficColors.flash_red~q\ & ( ((!\input[0]~input_o\ & ((\trafficColors.yellow~q\) # (\Selector1~1_combout\)))) # (\trafficColors.right_turn~q\) ) ) ) # ( !\trafficColors.red~q\ & ( 
-- \trafficColors.flash_red~q\ & ( ((!\input[0]~input_o\ & \trafficColors.yellow~q\)) # (\trafficColors.right_turn~q\) ) ) ) # ( \trafficColors.red~q\ & ( !\trafficColors.flash_red~q\ ) ) # ( !\trafficColors.red~q\ & ( !\trafficColors.flash_red~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100001100111111110100110011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector1~1_combout\,
	datab => \ALT_INV_input[0]~input_o\,
	datac => \ALT_INV_trafficColors.yellow~q\,
	datad => \ALT_INV_trafficColors.right_turn~q\,
	datae => \ALT_INV_trafficColors.red~q\,
	dataf => \ALT_INV_trafficColors.flash_red~q\,
	combout => \Selector1~0_combout\);

-- Location: FF_X88_Y21_N50
\trafficColors.red\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Selector1~0_combout\,
	clrn => \reset~input_o\,
	ena => \ivalid~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \trafficColors.red~q\);

-- Location: LABCELL_X88_Y21_N30
\Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = ( \trafficColors.red~q\ & ( \input[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_input[2]~input_o\,
	dataf => \ALT_INV_trafficColors.red~q\,
	combout => \Selector4~0_combout\);

-- Location: FF_X88_Y21_N32
\trafficColors.left_turn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Selector4~0_combout\,
	clrn => \reset~input_o\,
	ena => \ivalid~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \trafficColors.left_turn~q\);

-- Location: LABCELL_X88_Y21_N45
\Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = ( \trafficColors.red~q\ & ( (!\input[1]~input_o\ & (((\trafficColors.left_turn~q\ & \input[0]~input_o\)))) # (\input[1]~input_o\ & ((!\input[2]~input_o\) # ((\trafficColors.left_turn~q\)))) ) ) # ( !\trafficColors.red~q\ & ( 
-- (\trafficColors.left_turn~q\ & ((\input[0]~input_o\) # (\input[1]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100001111000001010000111101000101010011110100010101001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[1]~input_o\,
	datab => \ALT_INV_input[2]~input_o\,
	datac => \ALT_INV_trafficColors.left_turn~q\,
	datad => \ALT_INV_input[0]~input_o\,
	dataf => \ALT_INV_trafficColors.red~q\,
	combout => \Selector2~0_combout\);

-- Location: FF_X88_Y21_N47
\trafficColors.green\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Selector2~0_combout\,
	clrn => \reset~input_o\,
	ena => \ivalid~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \trafficColors.green~q\);

-- Location: LABCELL_X24_Y43_N0
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


