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

-- DATE "09/18/2017 21:46:41"

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

ENTITY 	FourBitFullAdder IS
    PORT (
	SW : IN std_logic_vector(9 DOWNTO 0);
	SWLEDS : BUFFER std_logic_vector(9 DOWNTO 0)
	);
END FourBitFullAdder;

-- Design Ports Information
-- SWLEDS[0]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[1]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[2]	=>  Location: PIN_V17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[3]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[4]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[5]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[6]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[7]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[8]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[9]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF FourBitFullAdder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SW : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_SWLEDS : std_logic_vector(9 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \finalResult~0_combout\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \finalResult~1_combout\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \FullAdder1|Cout~0_combout\ : std_logic;
SIGNAL \finalResult~2_combout\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \finalResult~3_combout\ : std_logic;
SIGNAL \finalResult~8_combout\ : std_logic;
SIGNAL \finalResult~4_combout\ : std_logic;
SIGNAL \finalResult~5_combout\ : std_logic;
SIGNAL \finalResult~6_combout\ : std_logic;
SIGNAL \finalResult~7_combout\ : std_logic;
SIGNAL \ALT_INV_SW[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[0]~input_o\ : std_logic;
SIGNAL \FullAdder1|ALT_INV_Cout~0_combout\ : std_logic;

BEGIN

ww_SW <= SW;
SWLEDS <= ww_SWLEDS;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_SW[7]~input_o\ <= NOT \SW[7]~input_o\;
\ALT_INV_SW[3]~input_o\ <= NOT \SW[3]~input_o\;
\ALT_INV_SW[6]~input_o\ <= NOT \SW[6]~input_o\;
\ALT_INV_SW[2]~input_o\ <= NOT \SW[2]~input_o\;
\ALT_INV_SW[5]~input_o\ <= NOT \SW[5]~input_o\;
\ALT_INV_SW[1]~input_o\ <= NOT \SW[1]~input_o\;
\ALT_INV_SW[8]~input_o\ <= NOT \SW[8]~input_o\;
\ALT_INV_SW[4]~input_o\ <= NOT \SW[4]~input_o\;
\ALT_INV_SW[9]~input_o\ <= NOT \SW[9]~input_o\;
\ALT_INV_SW[0]~input_o\ <= NOT \SW[0]~input_o\;
\FullAdder1|ALT_INV_Cout~0_combout\ <= NOT \FullAdder1|Cout~0_combout\;

-- Location: IOOBUF_X52_Y0_N2
\SWLEDS[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \finalResult~0_combout\,
	devoe => ww_devoe,
	o => ww_SWLEDS(0));

-- Location: IOOBUF_X52_Y0_N19
\SWLEDS[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \finalResult~1_combout\,
	devoe => ww_devoe,
	o => ww_SWLEDS(1));

-- Location: IOOBUF_X60_Y0_N2
\SWLEDS[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \finalResult~2_combout\,
	devoe => ww_devoe,
	o => ww_SWLEDS(2));

-- Location: IOOBUF_X80_Y0_N2
\SWLEDS[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \finalResult~3_combout\,
	devoe => ww_devoe,
	o => ww_SWLEDS(3));

-- Location: IOOBUF_X60_Y0_N19
\SWLEDS[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \finalResult~8_combout\,
	devoe => ww_devoe,
	o => ww_SWLEDS(4));

-- Location: IOOBUF_X80_Y0_N19
\SWLEDS[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \finalResult~4_combout\,
	devoe => ww_devoe,
	o => ww_SWLEDS(5));

-- Location: IOOBUF_X84_Y0_N2
\SWLEDS[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \finalResult~5_combout\,
	devoe => ww_devoe,
	o => ww_SWLEDS(6));

-- Location: IOOBUF_X89_Y6_N5
\SWLEDS[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \finalResult~6_combout\,
	devoe => ww_devoe,
	o => ww_SWLEDS(7));

-- Location: IOOBUF_X89_Y8_N5
\SWLEDS[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \finalResult~7_combout\,
	devoe => ww_devoe,
	o => ww_SWLEDS(8));

-- Location: IOOBUF_X89_Y6_N22
\SWLEDS[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_SWLEDS(9));

-- Location: IOIBUF_X2_Y0_N58
\SW[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: IOIBUF_X2_Y0_N41
\SW[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: IOIBUF_X4_Y0_N18
\SW[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: IOIBUF_X12_Y0_N18
\SW[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: LABCELL_X17_Y1_N6
\finalResult~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~0_combout\ = ( \SW[8]~input_o\ & ( \SW[0]~input_o\ & ( (!\SW[9]~input_o\) # (\SW[4]~input_o\) ) ) ) # ( !\SW[8]~input_o\ & ( \SW[0]~input_o\ & ( (!\SW[9]~input_o\) # (!\SW[4]~input_o\) ) ) ) # ( \SW[8]~input_o\ & ( !\SW[0]~input_o\ & ( 
-- (\SW[9]~input_o\ & !\SW[4]~input_o\) ) ) ) # ( !\SW[8]~input_o\ & ( !\SW[0]~input_o\ & ( (\SW[9]~input_o\ & \SW[4]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011001100000011000011111100111111001100111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_SW[9]~input_o\,
	datac => \ALT_INV_SW[4]~input_o\,
	datae => \ALT_INV_SW[8]~input_o\,
	dataf => \ALT_INV_SW[0]~input_o\,
	combout => \finalResult~0_combout\);

-- Location: IOIBUF_X16_Y0_N1
\SW[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: IOIBUF_X16_Y0_N18
\SW[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: LABCELL_X17_Y1_N42
\finalResult~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~1_combout\ = ( \SW[8]~input_o\ & ( \SW[5]~input_o\ & ( !\SW[1]~input_o\ $ (((!\SW[9]~input_o\) # ((\SW[0]~input_o\) # (\SW[4]~input_o\)))) ) ) ) # ( !\SW[8]~input_o\ & ( \SW[5]~input_o\ & ( !\SW[1]~input_o\ $ (((!\SW[9]~input_o\) # 
-- ((\SW[4]~input_o\ & \SW[0]~input_o\)))) ) ) ) # ( \SW[8]~input_o\ & ( !\SW[5]~input_o\ & ( !\SW[1]~input_o\ $ (((!\SW[9]~input_o\) # ((!\SW[4]~input_o\ & !\SW[0]~input_o\)))) ) ) ) # ( !\SW[8]~input_o\ & ( !\SW[5]~input_o\ & ( !\SW[1]~input_o\ $ 
-- (((!\SW[9]~input_o\) # ((!\SW[4]~input_o\) # (!\SW[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010110010101100110011001100110011001010110010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[1]~input_o\,
	datab => \ALT_INV_SW[9]~input_o\,
	datac => \ALT_INV_SW[4]~input_o\,
	datad => \ALT_INV_SW[0]~input_o\,
	datae => \ALT_INV_SW[8]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \finalResult~1_combout\);

-- Location: IOIBUF_X4_Y0_N35
\SW[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: IOIBUF_X8_Y0_N35
\SW[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: LABCELL_X17_Y1_N51
\FullAdder1|Cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FullAdder1|Cout~0_combout\ = ( \SW[8]~input_o\ & ( \SW[5]~input_o\ & ( ((\SW[1]~input_o\) # (\SW[0]~input_o\)) # (\SW[4]~input_o\) ) ) ) # ( !\SW[8]~input_o\ & ( \SW[5]~input_o\ & ( ((\SW[4]~input_o\ & \SW[0]~input_o\)) # (\SW[1]~input_o\) ) ) ) # ( 
-- \SW[8]~input_o\ & ( !\SW[5]~input_o\ & ( (\SW[1]~input_o\ & ((\SW[0]~input_o\) # (\SW[4]~input_o\))) ) ) ) # ( !\SW[8]~input_o\ & ( !\SW[5]~input_o\ & ( (\SW[4]~input_o\ & (\SW[0]~input_o\ & \SW[1]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000000000101111100000101111111110101111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[4]~input_o\,
	datac => \ALT_INV_SW[0]~input_o\,
	datad => \ALT_INV_SW[1]~input_o\,
	datae => \ALT_INV_SW[8]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \FullAdder1|Cout~0_combout\);

-- Location: LABCELL_X17_Y1_N24
\finalResult~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~2_combout\ = ( \SW[2]~input_o\ & ( \FullAdder1|Cout~0_combout\ & ( (!\SW[9]~input_o\) # (\SW[6]~input_o\) ) ) ) # ( !\SW[2]~input_o\ & ( \FullAdder1|Cout~0_combout\ & ( (\SW[9]~input_o\ & !\SW[6]~input_o\) ) ) ) # ( \SW[2]~input_o\ & ( 
-- !\FullAdder1|Cout~0_combout\ & ( (!\SW[9]~input_o\) # (!\SW[6]~input_o\) ) ) ) # ( !\SW[2]~input_o\ & ( !\FullAdder1|Cout~0_combout\ & ( (\SW[9]~input_o\ & \SW[6]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011111111111100110000110011000000001100110011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_SW[9]~input_o\,
	datad => \ALT_INV_SW[6]~input_o\,
	datae => \ALT_INV_SW[2]~input_o\,
	dataf => \FullAdder1|ALT_INV_Cout~0_combout\,
	combout => \finalResult~2_combout\);

-- Location: IOIBUF_X4_Y0_N52
\SW[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: IOIBUF_X4_Y0_N1
\SW[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: LABCELL_X17_Y1_N30
\finalResult~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~3_combout\ = ( \SW[2]~input_o\ & ( \FullAdder1|Cout~0_combout\ & ( !\SW[3]~input_o\ $ (((!\SW[9]~input_o\) # (\SW[7]~input_o\))) ) ) ) # ( !\SW[2]~input_o\ & ( \FullAdder1|Cout~0_combout\ & ( !\SW[3]~input_o\ $ (((!\SW[9]~input_o\) # 
-- (!\SW[7]~input_o\ $ (\SW[6]~input_o\)))) ) ) ) # ( \SW[2]~input_o\ & ( !\FullAdder1|Cout~0_combout\ & ( !\SW[3]~input_o\ $ (((!\SW[9]~input_o\) # (!\SW[7]~input_o\ $ (\SW[6]~input_o\)))) ) ) ) # ( !\SW[2]~input_o\ & ( !\FullAdder1|Cout~0_combout\ & ( 
-- !\SW[3]~input_o\ $ (((!\SW[9]~input_o\) # (!\SW[7]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011001010110010101100110010101010110011001010110010101100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[3]~input_o\,
	datab => \ALT_INV_SW[9]~input_o\,
	datac => \ALT_INV_SW[7]~input_o\,
	datad => \ALT_INV_SW[6]~input_o\,
	datae => \ALT_INV_SW[2]~input_o\,
	dataf => \FullAdder1|ALT_INV_Cout~0_combout\,
	combout => \finalResult~3_combout\);

-- Location: LABCELL_X17_Y1_N0
\finalResult~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~8_combout\ = ( !\SW[9]~input_o\ & ( (((\SW[4]~input_o\))) ) ) # ( \SW[9]~input_o\ & ( (!\SW[7]~input_o\ & (\SW[3]~input_o\ & ((!\SW[6]~input_o\ & (\FullAdder1|Cout~0_combout\ & \SW[2]~input_o\)) # (\SW[6]~input_o\ & ((\SW[2]~input_o\) # 
-- (\FullAdder1|Cout~0_combout\)))))) # (\SW[7]~input_o\ & (((!\SW[6]~input_o\ & (\FullAdder1|Cout~0_combout\ & \SW[2]~input_o\)) # (\SW[6]~input_o\ & ((\SW[2]~input_o\) # (\FullAdder1|Cout~0_combout\)))) # (\SW[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111100001111000000010001010100001111000011110101011101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[7]~input_o\,
	datab => \ALT_INV_SW[6]~input_o\,
	datac => \FullAdder1|ALT_INV_Cout~0_combout\,
	datad => \ALT_INV_SW[2]~input_o\,
	datae => \ALT_INV_SW[9]~input_o\,
	dataf => \ALT_INV_SW[3]~input_o\,
	datag => \ALT_INV_SW[4]~input_o\,
	combout => \finalResult~8_combout\);

-- Location: LABCELL_X17_Y1_N36
\finalResult~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~4_combout\ = ( \SW[5]~input_o\ & ( !\SW[9]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_SW[9]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \finalResult~4_combout\);

-- Location: LABCELL_X17_Y1_N12
\finalResult~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~5_combout\ = ( !\SW[9]~input_o\ & ( \SW[6]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_SW[6]~input_o\,
	dataf => \ALT_INV_SW[9]~input_o\,
	combout => \finalResult~5_combout\);

-- Location: LABCELL_X17_Y1_N21
\finalResult~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~6_combout\ = ( \SW[7]~input_o\ & ( !\SW[9]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_SW[9]~input_o\,
	datae => \ALT_INV_SW[7]~input_o\,
	combout => \finalResult~6_combout\);

-- Location: LABCELL_X17_Y1_N57
\finalResult~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~7_combout\ = ( \SW[8]~input_o\ & ( !\SW[9]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_SW[8]~input_o\,
	dataf => \ALT_INV_SW[9]~input_o\,
	combout => \finalResult~7_combout\);

-- Location: LABCELL_X46_Y29_N0
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


