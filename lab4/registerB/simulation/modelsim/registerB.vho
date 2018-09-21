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

-- DATE "11/15/2017 06:33:10"

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

ENTITY 	registerB IS
    PORT (
	input : IN std_logic_vector(7 DOWNTO 0);
	inputS : IN std_logic_vector(7 DOWNTO 0);
	twoBits : IN std_logic_vector(1 DOWNTO 0);
	clock : IN std_logic;
	reset : IN std_logic;
	loadEnable : IN std_logic;
	shiftEnable : IN std_logic;
	bitsToMul : BUFFER std_logic_vector(2 DOWNTO 0);
	output : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END registerB;

-- Design Ports Information
-- inputS[0]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitsToMul[0]	=>  Location: PIN_AG23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitsToMul[1]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitsToMul[2]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[0]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[1]	=>  Location: PIN_AK19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[2]	=>  Location: PIN_AJ22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[3]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[4]	=>  Location: PIN_AJ17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[5]	=>  Location: PIN_AF21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[6]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[7]	=>  Location: PIN_AC18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- loadEnable	=>  Location: PIN_AJ20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- shiftEnable	=>  Location: PIN_AJ21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inputS[1]	=>  Location: PIN_AK18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_AG22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[0]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inputS[2]	=>  Location: PIN_V17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[1]	=>  Location: PIN_AH24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inputS[3]	=>  Location: PIN_AJ19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[2]	=>  Location: PIN_AF20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inputS[4]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[3]	=>  Location: PIN_AK23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inputS[5]	=>  Location: PIN_AH23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[4]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inputS[6]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[5]	=>  Location: PIN_AH22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inputS[7]	=>  Location: PIN_AK22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[6]	=>  Location: PIN_AK21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- twoBits[0]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[7]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- twoBits[1]	=>  Location: PIN_AG20,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF registerB IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_input : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_inputS : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_twoBits : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_loadEnable : std_logic;
SIGNAL ww_shiftEnable : std_logic;
SIGNAL ww_bitsToMul : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_output : std_logic_vector(7 DOWNTO 0);
SIGNAL \inputS[0]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \loadEnable~input_o\ : std_logic;
SIGNAL \inputS[1]~input_o\ : std_logic;
SIGNAL \shiftEnable~input_o\ : std_logic;
SIGNAL \bitsToMul~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \bitsToMul[0]~reg0_q\ : std_logic;
SIGNAL \input[0]~input_o\ : std_logic;
SIGNAL \allBits[0]~feeder_combout\ : std_logic;
SIGNAL \inputS[2]~input_o\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \allBits[0]~0_combout\ : std_logic;
SIGNAL \input[1]~input_o\ : std_logic;
SIGNAL \allBits[1]~feeder_combout\ : std_logic;
SIGNAL \inputS[3]~input_o\ : std_logic;
SIGNAL \input[2]~input_o\ : std_logic;
SIGNAL \allBits[2]~feeder_combout\ : std_logic;
SIGNAL \inputS[4]~input_o\ : std_logic;
SIGNAL \input[3]~input_o\ : std_logic;
SIGNAL \allBits[3]~feeder_combout\ : std_logic;
SIGNAL \inputS[5]~input_o\ : std_logic;
SIGNAL \input[4]~input_o\ : std_logic;
SIGNAL \allBits[4]~feeder_combout\ : std_logic;
SIGNAL \inputS[6]~input_o\ : std_logic;
SIGNAL \input[5]~input_o\ : std_logic;
SIGNAL \allBits[5]~feeder_combout\ : std_logic;
SIGNAL \inputS[7]~input_o\ : std_logic;
SIGNAL \input[6]~input_o\ : std_logic;
SIGNAL \allBits[6]~feeder_combout\ : std_logic;
SIGNAL \twoBits[0]~input_o\ : std_logic;
SIGNAL \input[7]~input_o\ : std_logic;
SIGNAL \allBits[7]~feeder_combout\ : std_logic;
SIGNAL \twoBits[1]~input_o\ : std_logic;
SIGNAL allBits : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_input[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_inputS[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_shiftEnable~input_o\ : std_logic;
SIGNAL \ALT_INV_loadEnable~input_o\ : std_logic;
SIGNAL \ALT_INV_bitsToMul[0]~reg0_q\ : std_logic;

BEGIN

ww_input <= input;
ww_inputS <= inputS;
ww_twoBits <= twoBits;
ww_clock <= clock;
ww_reset <= reset;
ww_loadEnable <= loadEnable;
ww_shiftEnable <= shiftEnable;
bitsToMul <= ww_bitsToMul;
output <= ww_output;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_input[7]~input_o\ <= NOT \input[7]~input_o\;
\ALT_INV_input[6]~input_o\ <= NOT \input[6]~input_o\;
\ALT_INV_input[5]~input_o\ <= NOT \input[5]~input_o\;
\ALT_INV_input[4]~input_o\ <= NOT \input[4]~input_o\;
\ALT_INV_input[3]~input_o\ <= NOT \input[3]~input_o\;
\ALT_INV_input[2]~input_o\ <= NOT \input[2]~input_o\;
\ALT_INV_input[1]~input_o\ <= NOT \input[1]~input_o\;
\ALT_INV_input[0]~input_o\ <= NOT \input[0]~input_o\;
\ALT_INV_inputS[1]~input_o\ <= NOT \inputS[1]~input_o\;
\ALT_INV_shiftEnable~input_o\ <= NOT \shiftEnable~input_o\;
\ALT_INV_loadEnable~input_o\ <= NOT \loadEnable~input_o\;
\ALT_INV_bitsToMul[0]~reg0_q\ <= NOT \bitsToMul[0]~reg0_q\;

-- Location: IOOBUF_X64_Y0_N36
\bitsToMul[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \bitsToMul[0]~reg0_q\,
	devoe => ww_devoe,
	o => ww_bitsToMul(0));

-- Location: IOOBUF_X56_Y0_N53
\bitsToMul[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => allBits(0),
	devoe => ww_devoe,
	o => ww_bitsToMul(1));

-- Location: IOOBUF_X60_Y0_N19
\bitsToMul[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => allBits(1),
	devoe => ww_devoe,
	o => ww_bitsToMul(2));

-- Location: IOOBUF_X56_Y0_N36
\output[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => allBits(0),
	devoe => ww_devoe,
	o => ww_output(0));

-- Location: IOOBUF_X60_Y0_N53
\output[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => allBits(1),
	devoe => ww_devoe,
	o => ww_output(1));

-- Location: IOOBUF_X70_Y0_N53
\output[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => allBits(2),
	devoe => ww_devoe,
	o => ww_output(2));

-- Location: IOOBUF_X66_Y0_N42
\output[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => allBits(3),
	devoe => ww_devoe,
	o => ww_output(3));

-- Location: IOOBUF_X58_Y0_N42
\output[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => allBits(4),
	devoe => ww_devoe,
	o => ww_output(4));

-- Location: IOOBUF_X70_Y0_N19
\output[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => allBits(5),
	devoe => ww_devoe,
	o => ww_output(5));

-- Location: IOOBUF_X66_Y0_N59
\output[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => allBits(6),
	devoe => ww_devoe,
	o => ww_output(6));

-- Location: IOOBUF_X64_Y0_N2
\output[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => allBits(7),
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

-- Location: IOIBUF_X62_Y0_N35
\loadEnable~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_loadEnable,
	o => \loadEnable~input_o\);

-- Location: IOIBUF_X58_Y0_N58
\inputS[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inputS(1),
	o => \inputS[1]~input_o\);

-- Location: IOIBUF_X62_Y0_N52
\shiftEnable~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_shiftEnable,
	o => \shiftEnable~input_o\);

-- Location: LABCELL_X61_Y1_N36
\bitsToMul~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \bitsToMul~0_combout\ = ( \bitsToMul[0]~reg0_q\ & ( \shiftEnable~input_o\ & ( (\inputS[1]~input_o\) # (\loadEnable~input_o\) ) ) ) # ( !\bitsToMul[0]~reg0_q\ & ( \shiftEnable~input_o\ & ( (!\loadEnable~input_o\ & \inputS[1]~input_o\) ) ) ) # ( 
-- \bitsToMul[0]~reg0_q\ & ( !\shiftEnable~input_o\ & ( !\loadEnable~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000001010000010100101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_loadEnable~input_o\,
	datac => \ALT_INV_inputS[1]~input_o\,
	datae => \ALT_INV_bitsToMul[0]~reg0_q\,
	dataf => \ALT_INV_shiftEnable~input_o\,
	combout => \bitsToMul~0_combout\);

-- Location: IOIBUF_X66_Y0_N75
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X61_Y1_N37
\bitsToMul[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \bitsToMul~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bitsToMul[0]~reg0_q\);

-- Location: IOIBUF_X62_Y0_N1
\input[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(0),
	o => \input[0]~input_o\);

-- Location: LABCELL_X61_Y1_N15
\allBits[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \allBits[0]~feeder_combout\ = ( \input[0]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_input[0]~input_o\,
	combout => \allBits[0]~feeder_combout\);

-- Location: IOIBUF_X60_Y0_N1
\inputS[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inputS(2),
	o => \inputS[2]~input_o\);

-- Location: LABCELL_X61_Y1_N45
\process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = ( \loadEnable~input_o\ & ( \shiftEnable~input_o\ ) ) # ( !\loadEnable~input_o\ & ( \shiftEnable~input_o\ ) ) # ( !\loadEnable~input_o\ & ( !\shiftEnable~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_loadEnable~input_o\,
	dataf => \ALT_INV_shiftEnable~input_o\,
	combout => \process_0~0_combout\);

-- Location: LABCELL_X61_Y1_N48
\allBits[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \allBits[0]~0_combout\ = ( !\loadEnable~input_o\ & ( \shiftEnable~input_o\ ) ) # ( \loadEnable~input_o\ & ( !\shiftEnable~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_loadEnable~input_o\,
	dataf => \ALT_INV_shiftEnable~input_o\,
	combout => \allBits[0]~0_combout\);

-- Location: FF_X61_Y1_N17
\allBits[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \allBits[0]~feeder_combout\,
	asdata => \inputS[2]~input_o\,
	clrn => \reset~input_o\,
	sload => \process_0~0_combout\,
	ena => \allBits[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => allBits(0));

-- Location: IOIBUF_X64_Y0_N52
\input[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(1),
	o => \input[1]~input_o\);

-- Location: LABCELL_X61_Y1_N21
\allBits[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \allBits[1]~feeder_combout\ = \input[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_input[1]~input_o\,
	combout => \allBits[1]~feeder_combout\);

-- Location: IOIBUF_X60_Y0_N35
\inputS[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inputS(3),
	o => \inputS[3]~input_o\);

-- Location: FF_X61_Y1_N23
\allBits[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \allBits[1]~feeder_combout\,
	asdata => \inputS[3]~input_o\,
	clrn => \reset~input_o\,
	sload => \process_0~0_combout\,
	ena => \allBits[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => allBits(1));

-- Location: IOIBUF_X70_Y0_N1
\input[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(2),
	o => \input[2]~input_o\);

-- Location: LABCELL_X67_Y1_N3
\allBits[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \allBits[2]~feeder_combout\ = ( \input[2]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_input[2]~input_o\,
	combout => \allBits[2]~feeder_combout\);

-- Location: IOIBUF_X68_Y0_N18
\inputS[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inputS(4),
	o => \inputS[4]~input_o\);

-- Location: FF_X67_Y1_N4
\allBits[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \allBits[2]~feeder_combout\,
	asdata => \inputS[4]~input_o\,
	clrn => \reset~input_o\,
	sload => \process_0~0_combout\,
	ena => \allBits[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => allBits(2));

-- Location: IOIBUF_X72_Y0_N35
\input[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(3),
	o => \input[3]~input_o\);

-- Location: LABCELL_X67_Y1_N54
\allBits[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \allBits[3]~feeder_combout\ = ( \input[3]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_input[3]~input_o\,
	combout => \allBits[3]~feeder_combout\);

-- Location: IOIBUF_X70_Y0_N35
\inputS[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inputS(5),
	o => \inputS[5]~input_o\);

-- Location: FF_X67_Y1_N56
\allBits[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \allBits[3]~feeder_combout\,
	asdata => \inputS[5]~input_o\,
	clrn => \reset~input_o\,
	sload => \process_0~0_combout\,
	ena => \allBits[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => allBits(3));

-- Location: IOIBUF_X64_Y0_N18
\input[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(4),
	o => \input[4]~input_o\);

-- Location: LABCELL_X61_Y1_N24
\allBits[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \allBits[4]~feeder_combout\ = ( \input[4]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_input[4]~input_o\,
	combout => \allBits[4]~feeder_combout\);

-- Location: IOIBUF_X58_Y0_N75
\inputS[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inputS(6),
	o => \inputS[6]~input_o\);

-- Location: FF_X61_Y1_N25
\allBits[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \allBits[4]~feeder_combout\,
	asdata => \inputS[6]~input_o\,
	clrn => \reset~input_o\,
	sload => \process_0~0_combout\,
	ena => \allBits[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => allBits(4));

-- Location: IOIBUF_X66_Y0_N92
\input[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(5),
	o => \input[5]~input_o\);

-- Location: LABCELL_X67_Y1_N36
\allBits[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \allBits[5]~feeder_combout\ = \input[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_input[5]~input_o\,
	combout => \allBits[5]~feeder_combout\);

-- Location: IOIBUF_X68_Y0_N52
\inputS[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inputS(7),
	o => \inputS[7]~input_o\);

-- Location: FF_X67_Y1_N37
\allBits[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \allBits[5]~feeder_combout\,
	asdata => \inputS[7]~input_o\,
	clrn => \reset~input_o\,
	sload => \process_0~0_combout\,
	ena => \allBits[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => allBits(5));

-- Location: IOIBUF_X68_Y0_N35
\input[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(6),
	o => \input[6]~input_o\);

-- Location: LABCELL_X67_Y1_N33
\allBits[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \allBits[6]~feeder_combout\ = \input[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_input[6]~input_o\,
	combout => \allBits[6]~feeder_combout\);

-- Location: IOIBUF_X68_Y0_N1
\twoBits[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_twoBits(0),
	o => \twoBits[0]~input_o\);

-- Location: FF_X67_Y1_N35
\allBits[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \allBits[6]~feeder_combout\,
	asdata => \twoBits[0]~input_o\,
	clrn => \reset~input_o\,
	sload => \process_0~0_combout\,
	ena => \allBits[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => allBits(6));

-- Location: IOIBUF_X58_Y0_N92
\input[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(7),
	o => \input[7]~input_o\);

-- Location: LABCELL_X61_Y1_N30
\allBits[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \allBits[7]~feeder_combout\ = ( \input[7]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_input[7]~input_o\,
	combout => \allBits[7]~feeder_combout\);

-- Location: IOIBUF_X62_Y0_N18
\twoBits[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_twoBits(1),
	o => \twoBits[1]~input_o\);

-- Location: FF_X61_Y1_N31
\allBits[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \allBits[7]~feeder_combout\,
	asdata => \twoBits[1]~input_o\,
	clrn => \reset~input_o\,
	sload => \process_0~0_combout\,
	ena => \allBits[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => allBits(7));

-- Location: IOIBUF_X12_Y81_N18
\inputS[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inputS(0),
	o => \inputS[0]~input_o\);

-- Location: LABCELL_X71_Y8_N0
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


