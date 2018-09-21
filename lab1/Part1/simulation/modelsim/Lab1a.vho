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

-- DATE "09/19/2017 22:27:12"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Lab1a IS
    PORT (
	V : IN std_logic_vector(3 DOWNTO 0);
	HEX1 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX0 : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END Lab1a;

-- Design Ports Information
-- HEX1[0]	=>  Location: PIN_AJ29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_AH29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_AH30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_AG30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_AF29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_AF30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[0]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_AH28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V[3]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V[1]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V[2]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Lab1a IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_V : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \V[3]~input_o\ : std_logic;
SIGNAL \V[2]~input_o\ : std_logic;
SIGNAL \V[1]~input_o\ : std_logic;
SIGNAL \BCDConversion[4]~0_combout\ : std_logic;
SIGNAL \V[0]~input_o\ : std_logic;
SIGNAL \DISPLAY|Mux12~0_combout\ : std_logic;
SIGNAL \DISPLAY|Mux11~0_combout\ : std_logic;
SIGNAL \DISPLAY|Mux10~0_combout\ : std_logic;
SIGNAL \DISPLAY|Mux9~0_combout\ : std_logic;
SIGNAL \DISPLAY|Mux8~0_combout\ : std_logic;
SIGNAL \DISPLAY|Mux7~0_combout\ : std_logic;
SIGNAL \DISPLAY|Mux6~0_combout\ : std_logic;
SIGNAL \ALT_INV_V[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_V[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_V[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_V[3]~input_o\ : std_logic;
SIGNAL \DISPLAY|ALT_INV_Mux6~0_combout\ : std_logic;

BEGIN

ww_V <= V;
HEX1 <= ww_HEX1;
HEX0 <= ww_HEX0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_V[0]~input_o\ <= NOT \V[0]~input_o\;
\ALT_INV_V[2]~input_o\ <= NOT \V[2]~input_o\;
\ALT_INV_V[1]~input_o\ <= NOT \V[1]~input_o\;
\ALT_INV_V[3]~input_o\ <= NOT \V[3]~input_o\;
\DISPLAY|ALT_INV_Mux6~0_combout\ <= NOT \DISPLAY|Mux6~0_combout\;

-- Location: IOOBUF_X89_Y6_N39
\HEX1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \BCDConversion[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(0));

-- Location: IOOBUF_X89_Y6_N56
\HEX1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_HEX1(1));

-- Location: IOOBUF_X89_Y16_N39
\HEX1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_HEX1(2));

-- Location: IOOBUF_X89_Y16_N56
\HEX1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \BCDConversion[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(3));

-- Location: IOOBUF_X89_Y15_N39
\HEX1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \BCDConversion[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(4));

-- Location: IOOBUF_X89_Y15_N56
\HEX1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \BCDConversion[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(5));

-- Location: IOOBUF_X89_Y8_N56
\HEX1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_HEX1(6));

-- Location: IOOBUF_X89_Y8_N39
\HEX0[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DISPLAY|Mux12~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(0));

-- Location: IOOBUF_X89_Y11_N79
\HEX0[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DISPLAY|Mux11~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(1));

-- Location: IOOBUF_X89_Y11_N96
\HEX0[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DISPLAY|Mux10~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(2));

-- Location: IOOBUF_X89_Y4_N79
\HEX0[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DISPLAY|Mux9~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(3));

-- Location: IOOBUF_X89_Y13_N56
\HEX0[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DISPLAY|Mux8~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(4));

-- Location: IOOBUF_X89_Y13_N39
\HEX0[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DISPLAY|Mux7~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(5));

-- Location: IOOBUF_X89_Y4_N96
\HEX0[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DISPLAY|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(6));

-- Location: IOIBUF_X4_Y0_N52
\V[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_V(3),
	o => \V[3]~input_o\);

-- Location: IOIBUF_X8_Y0_N35
\V[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_V(2),
	o => \V[2]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\V[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_V(1),
	o => \V[1]~input_o\);

-- Location: MLABCELL_X87_Y4_N30
\BCDConversion[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \BCDConversion[4]~0_combout\ = ( \V[2]~input_o\ & ( \V[1]~input_o\ & ( \V[3]~input_o\ ) ) ) # ( !\V[2]~input_o\ & ( \V[1]~input_o\ & ( \V[3]~input_o\ ) ) ) # ( \V[2]~input_o\ & ( !\V[1]~input_o\ & ( \V[3]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_V[3]~input_o\,
	datae => \ALT_INV_V[2]~input_o\,
	dataf => \ALT_INV_V[1]~input_o\,
	combout => \BCDConversion[4]~0_combout\);

-- Location: IOIBUF_X12_Y0_N18
\V[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_V(0),
	o => \V[0]~input_o\);

-- Location: MLABCELL_X87_Y4_N39
\DISPLAY|Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DISPLAY|Mux12~0_combout\ = ( \V[2]~input_o\ & ( \V[1]~input_o\ & ( (!\V[0]~input_o\ & \V[3]~input_o\) ) ) ) # ( !\V[2]~input_o\ & ( \V[1]~input_o\ & ( (\V[0]~input_o\ & \V[3]~input_o\) ) ) ) # ( \V[2]~input_o\ & ( !\V[1]~input_o\ & ( (!\V[0]~input_o\ & 
-- !\V[3]~input_o\) ) ) ) # ( !\V[2]~input_o\ & ( !\V[1]~input_o\ & ( (\V[0]~input_o\ & !\V[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000101000001010000000000101000001010000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_V[0]~input_o\,
	datac => \ALT_INV_V[3]~input_o\,
	datae => \ALT_INV_V[2]~input_o\,
	dataf => \ALT_INV_V[1]~input_o\,
	combout => \DISPLAY|Mux12~0_combout\);

-- Location: MLABCELL_X87_Y4_N12
\DISPLAY|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DISPLAY|Mux11~0_combout\ = ( \V[2]~input_o\ & ( \V[1]~input_o\ & ( !\V[3]~input_o\ $ (\V[0]~input_o\) ) ) ) # ( \V[2]~input_o\ & ( !\V[1]~input_o\ & ( (!\V[3]~input_o\ & \V[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011000000110000000000000000001100001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_V[3]~input_o\,
	datac => \ALT_INV_V[0]~input_o\,
	datae => \ALT_INV_V[2]~input_o\,
	dataf => \ALT_INV_V[1]~input_o\,
	combout => \DISPLAY|Mux11~0_combout\);

-- Location: MLABCELL_X87_Y4_N51
\DISPLAY|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DISPLAY|Mux10~0_combout\ = ( !\V[2]~input_o\ & ( \V[1]~input_o\ & ( (!\V[0]~input_o\ & !\V[3]~input_o\) ) ) ) # ( \V[2]~input_o\ & ( !\V[1]~input_o\ & ( (!\V[0]~input_o\ & \V[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010100000101010100000101000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_V[0]~input_o\,
	datac => \ALT_INV_V[3]~input_o\,
	datae => \ALT_INV_V[2]~input_o\,
	dataf => \ALT_INV_V[1]~input_o\,
	combout => \DISPLAY|Mux10~0_combout\);

-- Location: MLABCELL_X87_Y4_N54
\DISPLAY|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DISPLAY|Mux9~0_combout\ = ( \V[2]~input_o\ & ( \V[1]~input_o\ & ( !\V[3]~input_o\ $ (!\V[0]~input_o\) ) ) ) # ( !\V[2]~input_o\ & ( \V[1]~input_o\ & ( (\V[3]~input_o\ & \V[0]~input_o\) ) ) ) # ( \V[2]~input_o\ & ( !\V[1]~input_o\ & ( (!\V[3]~input_o\ & 
-- !\V[0]~input_o\) ) ) ) # ( !\V[2]~input_o\ & ( !\V[1]~input_o\ & ( \V[0]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111110000001100000000000011000000110011110000111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_V[3]~input_o\,
	datac => \ALT_INV_V[0]~input_o\,
	datae => \ALT_INV_V[2]~input_o\,
	dataf => \ALT_INV_V[1]~input_o\,
	combout => \DISPLAY|Mux9~0_combout\);

-- Location: MLABCELL_X87_Y4_N3
\DISPLAY|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DISPLAY|Mux8~0_combout\ = ( \V[2]~input_o\ & ( \V[1]~input_o\ & ( (\V[3]~input_o\) # (\V[0]~input_o\) ) ) ) # ( !\V[2]~input_o\ & ( \V[1]~input_o\ & ( \V[0]~input_o\ ) ) ) # ( \V[2]~input_o\ & ( !\V[1]~input_o\ & ( (!\V[3]~input_o\) # (\V[0]~input_o\) ) 
-- ) ) # ( !\V[2]~input_o\ & ( !\V[1]~input_o\ & ( \V[0]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101111101011111010101010101010101010101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_V[0]~input_o\,
	datac => \ALT_INV_V[3]~input_o\,
	datae => \ALT_INV_V[2]~input_o\,
	dataf => \ALT_INV_V[1]~input_o\,
	combout => \DISPLAY|Mux8~0_combout\);

-- Location: MLABCELL_X87_Y4_N6
\DISPLAY|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DISPLAY|Mux7~0_combout\ = ( \V[2]~input_o\ & ( \V[1]~input_o\ & ( (!\V[3]~input_o\ & \V[0]~input_o\) ) ) ) # ( !\V[2]~input_o\ & ( \V[1]~input_o\ & ( (!\V[3]~input_o\) # (\V[0]~input_o\) ) ) ) # ( \V[2]~input_o\ & ( !\V[1]~input_o\ & ( \V[3]~input_o\ ) ) 
-- ) # ( !\V[2]~input_o\ & ( !\V[1]~input_o\ & ( (!\V[3]~input_o\ & \V[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100001100110011001111001111110011110000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_V[3]~input_o\,
	datac => \ALT_INV_V[0]~input_o\,
	datae => \ALT_INV_V[2]~input_o\,
	dataf => \ALT_INV_V[1]~input_o\,
	combout => \DISPLAY|Mux7~0_combout\);

-- Location: MLABCELL_X87_Y4_N45
\DISPLAY|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DISPLAY|Mux6~0_combout\ = ( \V[2]~input_o\ & ( \V[1]~input_o\ & ( (!\V[0]~input_o\) # (\V[3]~input_o\) ) ) ) # ( !\V[2]~input_o\ & ( \V[1]~input_o\ & ( !\V[3]~input_o\ ) ) ) # ( \V[2]~input_o\ & ( !\V[1]~input_o\ ) ) # ( !\V[2]~input_o\ & ( 
-- !\V[1]~input_o\ & ( \V[3]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111111111111111111110000111100001010111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_V[0]~input_o\,
	datac => \ALT_INV_V[3]~input_o\,
	datae => \ALT_INV_V[2]~input_o\,
	dataf => \ALT_INV_V[1]~input_o\,
	combout => \DISPLAY|Mux6~0_combout\);

-- Location: LABCELL_X42_Y11_N3
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


