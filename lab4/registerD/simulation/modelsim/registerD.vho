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

-- DATE "11/15/2017 06:58:48"

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

ENTITY 	registerD IS
    PORT (
	input : IN std_logic_vector(3 DOWNTO 0);
	loadEnable : IN std_logic;
	countEnable : IN std_logic;
	reset : IN std_logic;
	clock : IN std_logic;
	output : OUT std_logic_vector(3 DOWNTO 0)
	);
END registerD;

-- Design Ports Information
-- input[0]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[0]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[1]	=>  Location: PIN_AC29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[2]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[3]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[1]	=>  Location: PIN_AA30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- loadEnable	=>  Location: PIN_AA28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- countEnable	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[2]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[3]	=>  Location: PIN_AB30,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF registerD IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_input : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_loadEnable : std_logic;
SIGNAL ww_countEnable : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_output : std_logic_vector(3 DOWNTO 0);
SIGNAL \input[0]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \loadEnable~input_o\ : std_logic;
SIGNAL \input[1]~input_o\ : std_logic;
SIGNAL \shiftBits~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \countEnable~input_o\ : std_logic;
SIGNAL \shiftBits[0]~1_combout\ : std_logic;
SIGNAL \input[2]~input_o\ : std_logic;
SIGNAL \shiftBits~2_combout\ : std_logic;
SIGNAL \input[3]~input_o\ : std_logic;
SIGNAL \shiftBits~3_combout\ : std_logic;
SIGNAL \shiftBits~4_combout\ : std_logic;
SIGNAL shiftBits : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_input[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_countEnable~input_o\ : std_logic;
SIGNAL \ALT_INV_loadEnable~input_o\ : std_logic;
SIGNAL \ALT_INV_input[1]~input_o\ : std_logic;
SIGNAL ALT_INV_shiftBits : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_input <= input;
ww_loadEnable <= loadEnable;
ww_countEnable <= countEnable;
ww_reset <= reset;
ww_clock <= clock;
output <= ww_output;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_input[3]~input_o\ <= NOT \input[3]~input_o\;
\ALT_INV_input[2]~input_o\ <= NOT \input[2]~input_o\;
\ALT_INV_countEnable~input_o\ <= NOT \countEnable~input_o\;
\ALT_INV_loadEnable~input_o\ <= NOT \loadEnable~input_o\;
\ALT_INV_input[1]~input_o\ <= NOT \input[1]~input_o\;
ALT_INV_shiftBits(3) <= NOT shiftBits(3);
ALT_INV_shiftBits(2) <= NOT shiftBits(2);
ALT_INV_shiftBits(1) <= NOT shiftBits(1);
ALT_INV_shiftBits(0) <= NOT shiftBits(0);

-- Location: IOOBUF_X89_Y20_N79
\output[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_shiftBits(0),
	devoe => ww_devoe,
	o => ww_output(0));

-- Location: IOOBUF_X89_Y20_N96
\output[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_shiftBits(1),
	devoe => ww_devoe,
	o => ww_output(1));

-- Location: IOOBUF_X89_Y20_N62
\output[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_shiftBits(2),
	devoe => ww_devoe,
	o => ww_output(2));

-- Location: IOOBUF_X89_Y20_N45
\output[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_shiftBits(3),
	devoe => ww_devoe,
	o => ww_output(3));

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

-- Location: IOIBUF_X89_Y21_N55
\loadEnable~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_loadEnable,
	o => \loadEnable~input_o\);

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

-- Location: LABCELL_X88_Y21_N48
\shiftBits~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \shiftBits~0_combout\ = ( !\loadEnable~input_o\ & ( !\input[1]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_loadEnable~input_o\,
	dataf => \ALT_INV_input[1]~input_o\,
	combout => \shiftBits~0_combout\);

-- Location: IOIBUF_X89_Y23_N55
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: IOIBUF_X89_Y23_N4
\countEnable~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_countEnable,
	o => \countEnable~input_o\);

-- Location: LABCELL_X88_Y21_N27
\shiftBits[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \shiftBits[0]~1_combout\ = ( \loadEnable~input_o\ & ( \countEnable~input_o\ ) ) # ( !\loadEnable~input_o\ & ( \countEnable~input_o\ ) ) # ( \loadEnable~input_o\ & ( !\countEnable~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_loadEnable~input_o\,
	dataf => \ALT_INV_countEnable~input_o\,
	combout => \shiftBits[0]~1_combout\);

-- Location: FF_X88_Y21_N49
\shiftBits[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \shiftBits~0_combout\,
	clrn => \reset~input_o\,
	ena => \shiftBits[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => shiftBits(0));

-- Location: IOIBUF_X89_Y21_N38
\input[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(2),
	o => \input[2]~input_o\);

-- Location: LABCELL_X88_Y21_N33
\shiftBits~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \shiftBits~2_combout\ = ( !\loadEnable~input_o\ & ( !\input[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_loadEnable~input_o\,
	dataf => \ALT_INV_input[2]~input_o\,
	combout => \shiftBits~2_combout\);

-- Location: FF_X88_Y21_N34
\shiftBits[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \shiftBits~2_combout\,
	clrn => \reset~input_o\,
	ena => \shiftBits[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => shiftBits(1));

-- Location: IOIBUF_X89_Y21_N4
\input[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(3),
	o => \input[3]~input_o\);

-- Location: LABCELL_X88_Y21_N12
\shiftBits~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \shiftBits~3_combout\ = ( !\loadEnable~input_o\ & ( !\input[3]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_loadEnable~input_o\,
	dataf => \ALT_INV_input[3]~input_o\,
	combout => \shiftBits~3_combout\);

-- Location: FF_X88_Y21_N13
\shiftBits[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \shiftBits~3_combout\,
	clrn => \reset~input_o\,
	ena => \shiftBits[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => shiftBits(2));

-- Location: LABCELL_X88_Y21_N42
\shiftBits~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \shiftBits~4_combout\ = ( shiftBits(3) & ( \countEnable~input_o\ & ( !\loadEnable~input_o\ ) ) ) # ( !shiftBits(3) & ( \countEnable~input_o\ & ( !\loadEnable~input_o\ ) ) ) # ( shiftBits(3) & ( !\countEnable~input_o\ & ( !\loadEnable~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_loadEnable~input_o\,
	datae => ALT_INV_shiftBits(3),
	dataf => \ALT_INV_countEnable~input_o\,
	combout => \shiftBits~4_combout\);

-- Location: FF_X88_Y21_N43
\shiftBits[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \shiftBits~4_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => shiftBits(3));

-- Location: IOIBUF_X20_Y0_N1
\input[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(0),
	o => \input[0]~input_o\);

-- Location: LABCELL_X42_Y39_N3
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


