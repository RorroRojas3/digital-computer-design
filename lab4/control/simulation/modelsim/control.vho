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

-- DATE "11/15/2017 09:50:08"

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

ENTITY 	control IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	start : IN std_logic;
	timeCount : IN std_logic;
	busy : BUFFER std_logic;
	load : BUFFER std_logic;
	shift : BUFFER std_logic;
	add : BUFFER std_logic;
	resetO : BUFFER std_logic;
	countO : BUFFER std_logic;
	ovalid : BUFFER std_logic
	);
END control;

-- Design Ports Information
-- busy	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- load	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- shift	=>  Location: PIN_AD30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- add	=>  Location: PIN_AA28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- resetO	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- countO	=>  Location: PIN_AA30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ovalid	=>  Location: PIN_AE29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_AC30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- timeCount	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF control IS
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
SIGNAL ww_start : std_logic;
SIGNAL ww_timeCount : std_logic;
SIGNAL ww_busy : std_logic;
SIGNAL ww_load : std_logic;
SIGNAL ww_shift : std_logic;
SIGNAL ww_add : std_logic;
SIGNAL ww_resetO : std_logic;
SIGNAL ww_countO : std_logic;
SIGNAL ww_ovalid : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \timeCount~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \controlState.shiftReg~q\ : std_logic;
SIGNAL \controlState.loadReg~feeder_combout\ : std_logic;
SIGNAL \controlState.loadReg~q\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \controlState.addReg~q\ : std_logic;
SIGNAL \controlState.shiftReg~DUPLICATE_q\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \controlState.done~q\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \controlState.resetS~q\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \controlState.startS~q\ : std_logic;
SIGNAL \WideOr1~combout\ : std_logic;
SIGNAL \controlState.loadReg~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_timeCount~input_o\ : std_logic;
SIGNAL \ALT_INV_start~input_o\ : std_logic;
SIGNAL \ALT_INV_controlState.shiftReg~q\ : std_logic;
SIGNAL \ALT_INV_controlState.loadReg~q\ : std_logic;
SIGNAL \ALT_INV_WideOr1~combout\ : std_logic;
SIGNAL \ALT_INV_controlState.done~q\ : std_logic;
SIGNAL \ALT_INV_controlState.resetS~q\ : std_logic;
SIGNAL \ALT_INV_controlState.startS~q\ : std_logic;
SIGNAL \ALT_INV_controlState.shiftReg~DUPLICATE_q\ : std_logic;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_start <= start;
ww_timeCount <= timeCount;
busy <= ww_busy;
load <= ww_load;
shift <= ww_shift;
add <= ww_add;
resetO <= ww_resetO;
countO <= ww_countO;
ovalid <= ww_ovalid;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_timeCount~input_o\ <= NOT \timeCount~input_o\;
\ALT_INV_start~input_o\ <= NOT \start~input_o\;
\ALT_INV_controlState.shiftReg~q\ <= NOT \controlState.shiftReg~q\;
\ALT_INV_controlState.loadReg~q\ <= NOT \controlState.loadReg~q\;
\ALT_INV_WideOr1~combout\ <= NOT \WideOr1~combout\;
\ALT_INV_controlState.done~q\ <= NOT \controlState.done~q\;
\ALT_INV_controlState.resetS~q\ <= NOT \controlState.resetS~q\;
\ALT_INV_controlState.startS~q\ <= NOT \controlState.startS~q\;
\ALT_INV_controlState.shiftReg~DUPLICATE_q\ <= NOT \controlState.shiftReg~DUPLICATE_q\;

-- Location: IOOBUF_X89_Y23_N56
\busy~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr1~combout\,
	devoe => ww_devoe,
	o => ww_busy);

-- Location: IOOBUF_X89_Y23_N5
\load~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \controlState.loadReg~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_load);

-- Location: IOOBUF_X89_Y25_N39
\shift~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \controlState.shiftReg~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_shift);

-- Location: IOOBUF_X89_Y21_N56
\add~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \controlState.addReg~q\,
	devoe => ww_devoe,
	o => ww_add);

-- Location: IOOBUF_X89_Y25_N22
\resetO~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \controlState.resetS~q\,
	devoe => ww_devoe,
	o => ww_resetO);

-- Location: IOOBUF_X89_Y21_N22
\countO~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \controlState.addReg~q\,
	devoe => ww_devoe,
	o => ww_countO);

-- Location: IOOBUF_X89_Y23_N39
\ovalid~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \controlState.done~q\,
	devoe => ww_devoe,
	o => ww_ovalid);

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

-- Location: IOIBUF_X89_Y25_N4
\start~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: IOIBUF_X89_Y21_N38
\timeCount~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_timeCount,
	o => \timeCount~input_o\);

-- Location: IOIBUF_X89_Y25_N55
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X88_Y36_N29
\controlState.shiftReg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \controlState.addReg~q\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controlState.shiftReg~q\);

-- Location: LABCELL_X88_Y36_N15
\controlState.loadReg~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \controlState.loadReg~feeder_combout\ = ( \controlState.startS~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_controlState.startS~q\,
	combout => \controlState.loadReg~feeder_combout\);

-- Location: FF_X88_Y36_N16
\controlState.loadReg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \controlState.loadReg~feeder_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controlState.loadReg~q\);

-- Location: LABCELL_X88_Y36_N36
\Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = ( \controlState.shiftReg~q\ & ( \controlState.loadReg~q\ ) ) # ( !\controlState.shiftReg~q\ & ( \controlState.loadReg~q\ ) ) # ( \controlState.shiftReg~q\ & ( !\controlState.loadReg~q\ & ( \timeCount~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_timeCount~input_o\,
	datae => \ALT_INV_controlState.shiftReg~q\,
	dataf => \ALT_INV_controlState.loadReg~q\,
	combout => \Selector2~0_combout\);

-- Location: FF_X88_Y36_N38
\controlState.addReg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Selector2~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controlState.addReg~q\);

-- Location: FF_X88_Y36_N28
\controlState.shiftReg~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \controlState.addReg~q\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controlState.shiftReg~DUPLICATE_q\);

-- Location: LABCELL_X88_Y36_N48
\Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = ( \controlState.done~q\ & ( \controlState.shiftReg~DUPLICATE_q\ & ( (!\timeCount~input_o\) # (\start~input_o\) ) ) ) # ( !\controlState.done~q\ & ( \controlState.shiftReg~DUPLICATE_q\ & ( !\timeCount~input_o\ ) ) ) # ( 
-- \controlState.done~q\ & ( !\controlState.shiftReg~DUPLICATE_q\ & ( \start~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111111001100110011001100111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_timeCount~input_o\,
	datac => \ALT_INV_start~input_o\,
	datae => \ALT_INV_controlState.done~q\,
	dataf => \ALT_INV_controlState.shiftReg~DUPLICATE_q\,
	combout => \Selector3~0_combout\);

-- Location: FF_X88_Y36_N50
\controlState.done\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Selector3~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controlState.done~q\);

-- Location: LABCELL_X88_Y36_N57
\Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = ( \controlState.resetS~q\ & ( \controlState.done~q\ & ( \start~input_o\ ) ) ) # ( !\controlState.resetS~q\ & ( \controlState.done~q\ & ( \start~input_o\ ) ) ) # ( \controlState.resetS~q\ & ( !\controlState.done~q\ ) ) # ( 
-- !\controlState.resetS~q\ & ( !\controlState.done~q\ & ( \start~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101111111111111111101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_start~input_o\,
	datae => \ALT_INV_controlState.resetS~q\,
	dataf => \ALT_INV_controlState.done~q\,
	combout => \Selector4~0_combout\);

-- Location: FF_X88_Y36_N59
\controlState.resetS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Selector4~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controlState.resetS~q\);

-- Location: LABCELL_X88_Y36_N42
\Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = ( !\controlState.resetS~q\ & ( \start~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_start~input_o\,
	dataf => \ALT_INV_controlState.resetS~q\,
	combout => \Selector5~0_combout\);

-- Location: FF_X88_Y36_N44
\controlState.startS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \Selector5~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controlState.startS~q\);

-- Location: LABCELL_X88_Y36_N24
WideOr1 : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr1~combout\ = ( \controlState.resetS~q\ & ( (\controlState.done~q\) # (\controlState.startS~q\) ) ) # ( !\controlState.resetS~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_controlState.startS~q\,
	datac => \ALT_INV_controlState.done~q\,
	dataf => \ALT_INV_controlState.resetS~q\,
	combout => \WideOr1~combout\);

-- Location: FF_X88_Y36_N17
\controlState.loadReg~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \controlState.loadReg~feeder_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controlState.loadReg~DUPLICATE_q\);

-- Location: MLABCELL_X72_Y13_N3
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


