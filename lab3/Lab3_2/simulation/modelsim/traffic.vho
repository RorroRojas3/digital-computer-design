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

-- DATE "10/13/2017 01:40:53"

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

ENTITY 	traffic IS
    PORT (
	clock : IN std_logic;
	resetn : IN std_logic;
	ivalid : IN std_logic;
	iready : IN std_logic;
	datain : IN std_logic_vector(7 DOWNTO 0);
	oready : BUFFER std_logic;
	ovalid : BUFFER std_logic;
	dataout : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END traffic;

-- Design Ports Information
-- iready	=>  Location: PIN_AH3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[3]	=>  Location: PIN_AE14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[4]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[5]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[6]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[7]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oready	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ovalid	=>  Location: PIN_AJ26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataout[0]	=>  Location: PIN_AA30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataout[1]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataout[2]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataout[3]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataout[4]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataout[5]	=>  Location: PIN_AB30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataout[6]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataout[7]	=>  Location: PIN_AC29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[1]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[2]	=>  Location: PIN_AA28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- resetn	=>  Location: PIN_AE29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ivalid	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF traffic IS
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
SIGNAL ww_resetn : std_logic;
SIGNAL ww_ivalid : std_logic;
SIGNAL ww_iready : std_logic;
SIGNAL ww_datain : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_oready : std_logic;
SIGNAL ww_ovalid : std_logic;
SIGNAL ww_dataout : std_logic_vector(7 DOWNTO 0);
SIGNAL \iready~input_o\ : std_logic;
SIGNAL \datain[3]~input_o\ : std_logic;
SIGNAL \datain[4]~input_o\ : std_logic;
SIGNAL \datain[5]~input_o\ : std_logic;
SIGNAL \datain[6]~input_o\ : std_logic;
SIGNAL \datain[7]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \datain[1]~input_o\ : std_logic;
SIGNAL \datain[2]~input_o\ : std_logic;
SIGNAL \datain[0]~input_o\ : std_logic;
SIGNAL \trafficColors|Selector1~1_combout\ : std_logic;
SIGNAL \trafficColors|trafficColors.flash_red~feeder_combout\ : std_logic;
SIGNAL \resetn~input_o\ : std_logic;
SIGNAL \ivalid~input_o\ : std_logic;
SIGNAL \trafficColors|trafficColors.flash_red~q\ : std_logic;
SIGNAL \trafficColors|Selector4~0_combout\ : std_logic;
SIGNAL \trafficColors|trafficColors.left_turn~q\ : std_logic;
SIGNAL \trafficColors|Selector3~0_combout\ : std_logic;
SIGNAL \trafficColors|trafficColors.yellow~q\ : std_logic;
SIGNAL \trafficColors|Selector5~0_combout\ : std_logic;
SIGNAL \trafficColors|trafficColors.right_turn~q\ : std_logic;
SIGNAL \trafficColors|Selector1~0_combout\ : std_logic;
SIGNAL \trafficColors|trafficColors.red~q\ : std_logic;
SIGNAL \trafficColors|Selector2~0_combout\ : std_logic;
SIGNAL \trafficColors|trafficColors.green~q\ : std_logic;
SIGNAL \ALT_INV_datain[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[1]~input_o\ : std_logic;
SIGNAL \trafficColors|ALT_INV_Selector1~1_combout\ : std_logic;
SIGNAL \trafficColors|ALT_INV_trafficColors.flash_red~q\ : std_logic;
SIGNAL \trafficColors|ALT_INV_trafficColors.right_turn~q\ : std_logic;
SIGNAL \trafficColors|ALT_INV_trafficColors.left_turn~q\ : std_logic;
SIGNAL \trafficColors|ALT_INV_trafficColors.red~q\ : std_logic;
SIGNAL \trafficColors|ALT_INV_trafficColors.yellow~q\ : std_logic;
SIGNAL \trafficColors|ALT_INV_trafficColors.green~q\ : std_logic;

BEGIN

ww_clock <= clock;
ww_resetn <= resetn;
ww_ivalid <= ivalid;
ww_iready <= iready;
ww_datain <= datain;
oready <= ww_oready;
ovalid <= ww_ovalid;
dataout <= ww_dataout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_datain[0]~input_o\ <= NOT \datain[0]~input_o\;
\ALT_INV_datain[2]~input_o\ <= NOT \datain[2]~input_o\;
\ALT_INV_datain[1]~input_o\ <= NOT \datain[1]~input_o\;
\trafficColors|ALT_INV_Selector1~1_combout\ <= NOT \trafficColors|Selector1~1_combout\;
\trafficColors|ALT_INV_trafficColors.flash_red~q\ <= NOT \trafficColors|trafficColors.flash_red~q\;
\trafficColors|ALT_INV_trafficColors.right_turn~q\ <= NOT \trafficColors|trafficColors.right_turn~q\;
\trafficColors|ALT_INV_trafficColors.left_turn~q\ <= NOT \trafficColors|trafficColors.left_turn~q\;
\trafficColors|ALT_INV_trafficColors.red~q\ <= NOT \trafficColors|trafficColors.red~q\;
\trafficColors|ALT_INV_trafficColors.yellow~q\ <= NOT \trafficColors|trafficColors.yellow~q\;
\trafficColors|ALT_INV_trafficColors.green~q\ <= NOT \trafficColors|trafficColors.green~q\;

-- Location: IOOBUF_X36_Y81_N19
\oready~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oready);

-- Location: IOOBUF_X76_Y0_N36
\ovalid~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ovalid);

-- Location: IOOBUF_X89_Y21_N22
\dataout[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \trafficColors|ALT_INV_trafficColors.green~q\,
	devoe => ww_devoe,
	o => ww_dataout(0));

-- Location: IOOBUF_X89_Y20_N45
\dataout[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \trafficColors|ALT_INV_trafficColors.yellow~q\,
	devoe => ww_devoe,
	o => ww_dataout(1));

-- Location: IOOBUF_X89_Y20_N62
\dataout[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \trafficColors|ALT_INV_trafficColors.red~q\,
	devoe => ww_devoe,
	o => ww_dataout(2));

-- Location: IOOBUF_X89_Y20_N79
\dataout[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \trafficColors|ALT_INV_trafficColors.left_turn~q\,
	devoe => ww_devoe,
	o => ww_dataout(3));

-- Location: IOOBUF_X12_Y0_N19
\dataout[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_dataout(4));

-- Location: IOOBUF_X89_Y21_N5
\dataout[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \trafficColors|ALT_INV_trafficColors.right_turn~q\,
	devoe => ww_devoe,
	o => ww_dataout(5));

-- Location: IOOBUF_X22_Y81_N19
\dataout[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_dataout(6));

-- Location: IOOBUF_X89_Y20_N96
\dataout[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \trafficColors|trafficColors.flash_red~q\,
	devoe => ww_devoe,
	o => ww_dataout(7));

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

-- Location: IOIBUF_X89_Y23_N4
\datain[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(1),
	o => \datain[1]~input_o\);

-- Location: IOIBUF_X89_Y21_N55
\datain[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(2),
	o => \datain[2]~input_o\);

-- Location: IOIBUF_X89_Y21_N38
\datain[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(0),
	o => \datain[0]~input_o\);

-- Location: LABCELL_X88_Y21_N3
\trafficColors|Selector1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \trafficColors|Selector1~1_combout\ = (!\datain[1]~input_o\ & !\datain[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101000000000101010100000000010101010000000001010101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[1]~input_o\,
	datad => \ALT_INV_datain[2]~input_o\,
	combout => \trafficColors|Selector1~1_combout\);

-- Location: LABCELL_X88_Y21_N42
\trafficColors|trafficColors.flash_red~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \trafficColors|trafficColors.flash_red~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \trafficColors|trafficColors.flash_red~feeder_combout\);

-- Location: IOIBUF_X89_Y23_N38
\resetn~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_resetn,
	o => \resetn~input_o\);

-- Location: IOIBUF_X89_Y23_N55
\ivalid~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ivalid,
	o => \ivalid~input_o\);

-- Location: FF_X88_Y21_N44
\trafficColors|trafficColors.flash_red\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \trafficColors|trafficColors.flash_red~feeder_combout\,
	clrn => \resetn~input_o\,
	ena => \ivalid~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \trafficColors|trafficColors.flash_red~q\);

-- Location: LABCELL_X88_Y21_N48
\trafficColors|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \trafficColors|Selector4~0_combout\ = ( \trafficColors|trafficColors.red~q\ & ( \datain[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \trafficColors|ALT_INV_trafficColors.red~q\,
	dataf => \ALT_INV_datain[2]~input_o\,
	combout => \trafficColors|Selector4~0_combout\);

-- Location: FF_X88_Y21_N50
\trafficColors|trafficColors.left_turn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \trafficColors|Selector4~0_combout\,
	clrn => \resetn~input_o\,
	ena => \ivalid~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \trafficColors|trafficColors.left_turn~q\);

-- Location: LABCELL_X88_Y21_N0
\trafficColors|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \trafficColors|Selector3~0_combout\ = ( \trafficColors|trafficColors.left_turn~q\ & ( ((!\datain[1]~input_o\ & !\datain[0]~input_o\)) # (\trafficColors|trafficColors.green~q\) ) ) # ( !\trafficColors|trafficColors.left_turn~q\ & ( 
-- \trafficColors|trafficColors.green~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111110001000111111111000100011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[1]~input_o\,
	datab => \ALT_INV_datain[0]~input_o\,
	datad => \trafficColors|ALT_INV_trafficColors.green~q\,
	dataf => \trafficColors|ALT_INV_trafficColors.left_turn~q\,
	combout => \trafficColors|Selector3~0_combout\);

-- Location: FF_X88_Y21_N2
\trafficColors|trafficColors.yellow\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \trafficColors|Selector3~0_combout\,
	clrn => \resetn~input_o\,
	ena => \ivalid~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \trafficColors|trafficColors.yellow~q\);

-- Location: LABCELL_X88_Y21_N39
\trafficColors|Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \trafficColors|Selector5~0_combout\ = ( \trafficColors|trafficColors.yellow~q\ & ( \trafficColors|trafficColors.red~q\ & ( \datain[0]~input_o\ ) ) ) # ( !\trafficColors|trafficColors.yellow~q\ & ( \trafficColors|trafficColors.red~q\ & ( 
-- (!\datain[1]~input_o\ & (\datain[0]~input_o\ & !\datain[2]~input_o\)) ) ) ) # ( \trafficColors|trafficColors.yellow~q\ & ( !\trafficColors|trafficColors.red~q\ & ( \datain[0]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100001010000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[1]~input_o\,
	datac => \ALT_INV_datain[0]~input_o\,
	datad => \ALT_INV_datain[2]~input_o\,
	datae => \trafficColors|ALT_INV_trafficColors.yellow~q\,
	dataf => \trafficColors|ALT_INV_trafficColors.red~q\,
	combout => \trafficColors|Selector5~0_combout\);

-- Location: FF_X88_Y21_N41
\trafficColors|trafficColors.right_turn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \trafficColors|Selector5~0_combout\,
	clrn => \resetn~input_o\,
	ena => \ivalid~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \trafficColors|trafficColors.right_turn~q\);

-- Location: LABCELL_X88_Y21_N54
\trafficColors|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \trafficColors|Selector1~0_combout\ = ( \trafficColors|trafficColors.red~q\ & ( \trafficColors|trafficColors.yellow~q\ & ( (!\trafficColors|trafficColors.flash_red~q\) # ((!\datain[0]~input_o\) # (\trafficColors|trafficColors.right_turn~q\)) ) ) ) # ( 
-- !\trafficColors|trafficColors.red~q\ & ( \trafficColors|trafficColors.yellow~q\ & ( (!\trafficColors|trafficColors.flash_red~q\) # ((!\datain[0]~input_o\) # (\trafficColors|trafficColors.right_turn~q\)) ) ) ) # ( \trafficColors|trafficColors.red~q\ & ( 
-- !\trafficColors|trafficColors.yellow~q\ & ( (!\trafficColors|trafficColors.flash_red~q\) # (((\trafficColors|Selector1~1_combout\ & !\datain[0]~input_o\)) # (\trafficColors|trafficColors.right_turn~q\)) ) ) ) # ( !\trafficColors|trafficColors.red~q\ & ( 
-- !\trafficColors|trafficColors.yellow~q\ & ( (!\trafficColors|trafficColors.flash_red~q\) # (\trafficColors|trafficColors.right_turn~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011111111110111001111111111111100111111111111110011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \trafficColors|ALT_INV_Selector1~1_combout\,
	datab => \trafficColors|ALT_INV_trafficColors.flash_red~q\,
	datac => \ALT_INV_datain[0]~input_o\,
	datad => \trafficColors|ALT_INV_trafficColors.right_turn~q\,
	datae => \trafficColors|ALT_INV_trafficColors.red~q\,
	dataf => \trafficColors|ALT_INV_trafficColors.yellow~q\,
	combout => \trafficColors|Selector1~0_combout\);

-- Location: FF_X88_Y21_N56
\trafficColors|trafficColors.red\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \trafficColors|Selector1~0_combout\,
	clrn => \resetn~input_o\,
	ena => \ivalid~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \trafficColors|trafficColors.red~q\);

-- Location: LABCELL_X88_Y21_N45
\trafficColors|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \trafficColors|Selector2~0_combout\ = ( \trafficColors|trafficColors.left_turn~q\ & ( (\datain[0]~input_o\) # (\datain[1]~input_o\) ) ) # ( !\trafficColors|trafficColors.left_turn~q\ & ( (\datain[1]~input_o\ & (!\datain[2]~input_o\ & 
-- \trafficColors|trafficColors.red~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000100000000000100010001011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[1]~input_o\,
	datab => \ALT_INV_datain[2]~input_o\,
	datac => \ALT_INV_datain[0]~input_o\,
	datad => \trafficColors|ALT_INV_trafficColors.red~q\,
	dataf => \trafficColors|ALT_INV_trafficColors.left_turn~q\,
	combout => \trafficColors|Selector2~0_combout\);

-- Location: FF_X88_Y21_N47
\trafficColors|trafficColors.green\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \trafficColors|Selector2~0_combout\,
	clrn => \resetn~input_o\,
	ena => \ivalid~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \trafficColors|trafficColors.green~q\);

-- Location: IOIBUF_X16_Y0_N52
\iready~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iready,
	o => \iready~input_o\);

-- Location: IOIBUF_X24_Y0_N18
\datain[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(3),
	o => \datain[3]~input_o\);

-- Location: IOIBUF_X89_Y8_N4
\datain[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(4),
	o => \datain[4]~input_o\);

-- Location: IOIBUF_X66_Y0_N58
\datain[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(5),
	o => \datain[5]~input_o\);

-- Location: IOIBUF_X36_Y81_N35
\datain[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(6),
	o => \datain[6]~input_o\);

-- Location: IOIBUF_X10_Y81_N41
\datain[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(7),
	o => \datain[7]~input_o\);

-- Location: MLABCELL_X28_Y49_N3
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


