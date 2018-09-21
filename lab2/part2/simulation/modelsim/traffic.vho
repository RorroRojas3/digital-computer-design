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

-- DATE "10/03/2017 19:41:30"

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

ENTITY 	traffic IS
    PORT (
	clock : IN std_logic;
	resetn : IN std_logic;
	ivalid : IN std_logic;
	iready : IN std_logic;
	datain : IN std_logic_vector(7 DOWNTO 0);
	oready : OUT std_logic;
	ovalid : OUT std_logic;
	dataout : OUT std_logic_vector(7 DOWNTO 0)
	);
END traffic;

-- Design Ports Information
-- clock	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- resetn	=>  Location: PIN_AH15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iready	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[3]	=>  Location: PIN_AG16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[4]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[5]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[6]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[7]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oready	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ovalid	=>  Location: PIN_AG10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataout[0]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataout[1]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataout[2]	=>  Location: PIN_AB30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataout[3]	=>  Location: PIN_AA30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataout[4]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataout[5]	=>  Location: PIN_AE29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataout[6]	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataout[7]	=>  Location: PIN_AA28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ivalid	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[0]	=>  Location: PIN_AC30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[1]	=>  Location: PIN_AD30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[2]	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \resetn~input_o\ : std_logic;
SIGNAL \iready~input_o\ : std_logic;
SIGNAL \datain[3]~input_o\ : std_logic;
SIGNAL \datain[4]~input_o\ : std_logic;
SIGNAL \datain[5]~input_o\ : std_logic;
SIGNAL \datain[6]~input_o\ : std_logic;
SIGNAL \datain[7]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \datain[0]~input_o\ : std_logic;
SIGNAL \datain[2]~input_o\ : std_logic;
SIGNAL \datain[1]~input_o\ : std_logic;
SIGNAL \ivalid~input_o\ : std_logic;
SIGNAL \TrafficDecoder|output[0]~0_combout\ : std_logic;
SIGNAL \TrafficDecoder|output[1]~1_combout\ : std_logic;
SIGNAL \TrafficDecoder|output[2]~2_combout\ : std_logic;
SIGNAL \TrafficDecoder|output[3]~3_combout\ : std_logic;
SIGNAL \TrafficDecoder|output[4]~4_combout\ : std_logic;
SIGNAL \TrafficDecoder|output[5]~5_combout\ : std_logic;
SIGNAL \TrafficDecoder|output[6]~6_combout\ : std_logic;
SIGNAL \TrafficDecoder|output[7]~7_combout\ : std_logic;
SIGNAL \ALT_INV_datain[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_ivalid~input_o\ : std_logic;

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
\ALT_INV_datain[2]~input_o\ <= NOT \datain[2]~input_o\;
\ALT_INV_datain[1]~input_o\ <= NOT \datain[1]~input_o\;
\ALT_INV_datain[0]~input_o\ <= NOT \datain[0]~input_o\;
\ALT_INV_ivalid~input_o\ <= NOT \ivalid~input_o\;

-- Location: IOOBUF_X52_Y0_N19
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

-- Location: IOOBUF_X18_Y0_N76
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

-- Location: IOOBUF_X89_Y23_N5
\dataout[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TrafficDecoder|output[0]~0_combout\,
	devoe => ww_devoe,
	o => ww_dataout(0));

-- Location: IOOBUF_X89_Y23_N22
\dataout[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TrafficDecoder|output[1]~1_combout\,
	devoe => ww_devoe,
	o => ww_dataout(1));

-- Location: IOOBUF_X89_Y21_N5
\dataout[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TrafficDecoder|output[2]~2_combout\,
	devoe => ww_devoe,
	o => ww_dataout(2));

-- Location: IOOBUF_X89_Y21_N22
\dataout[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TrafficDecoder|output[3]~3_combout\,
	devoe => ww_devoe,
	o => ww_dataout(3));

-- Location: IOOBUF_X89_Y21_N39
\dataout[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TrafficDecoder|output[4]~4_combout\,
	devoe => ww_devoe,
	o => ww_dataout(4));

-- Location: IOOBUF_X89_Y23_N39
\dataout[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TrafficDecoder|output[5]~5_combout\,
	devoe => ww_devoe,
	o => ww_dataout(5));

-- Location: IOOBUF_X89_Y23_N56
\dataout[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TrafficDecoder|output[6]~6_combout\,
	devoe => ww_devoe,
	o => ww_dataout(6));

-- Location: IOOBUF_X89_Y21_N56
\dataout[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TrafficDecoder|output[7]~7_combout\,
	devoe => ww_devoe,
	o => ww_dataout(7));

-- Location: IOIBUF_X89_Y25_N55
\datain[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(0),
	o => \datain[0]~input_o\);

-- Location: IOIBUF_X89_Y25_N21
\datain[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(2),
	o => \datain[2]~input_o\);

-- Location: IOIBUF_X89_Y25_N38
\datain[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(1),
	o => \datain[1]~input_o\);

-- Location: IOIBUF_X89_Y25_N4
\ivalid~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ivalid,
	o => \ivalid~input_o\);

-- Location: LABCELL_X88_Y23_N0
\TrafficDecoder|output[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TrafficDecoder|output[0]~0_combout\ = ( \ivalid~input_o\ & ( ((\datain[1]~input_o\) # (\datain[2]~input_o\)) # (\datain[0]~input_o\) ) ) # ( !\ivalid~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111011111110111111111111111111111110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[0]~input_o\,
	datab => \ALT_INV_datain[2]~input_o\,
	datac => \ALT_INV_datain[1]~input_o\,
	datae => \ALT_INV_ivalid~input_o\,
	combout => \TrafficDecoder|output[0]~0_combout\);

-- Location: LABCELL_X88_Y23_N9
\TrafficDecoder|output[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TrafficDecoder|output[1]~1_combout\ = ( \ivalid~input_o\ & ( ((!\datain[0]~input_o\) # (\datain[2]~input_o\)) # (\datain[1]~input_o\) ) ) # ( !\ivalid~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111110101111111111111111111111111111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[1]~input_o\,
	datac => \ALT_INV_datain[2]~input_o\,
	datad => \ALT_INV_datain[0]~input_o\,
	datae => \ALT_INV_ivalid~input_o\,
	combout => \TrafficDecoder|output[1]~1_combout\);

-- Location: LABCELL_X88_Y23_N12
\TrafficDecoder|output[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \TrafficDecoder|output[2]~2_combout\ = ( \ivalid~input_o\ & ( ((!\datain[1]~input_o\) # (\datain[2]~input_o\)) # (\datain[0]~input_o\) ) ) # ( !\ivalid~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111101111111011111111111111111111111011111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[0]~input_o\,
	datab => \ALT_INV_datain[2]~input_o\,
	datac => \ALT_INV_datain[1]~input_o\,
	datae => \ALT_INV_ivalid~input_o\,
	combout => \TrafficDecoder|output[2]~2_combout\);

-- Location: LABCELL_X88_Y23_N51
\TrafficDecoder|output[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \TrafficDecoder|output[3]~3_combout\ = ( \ivalid~input_o\ & ( (!\datain[1]~input_o\) # ((!\datain[0]~input_o\) # (\datain[2]~input_o\)) ) ) # ( !\ivalid~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111010111111111111111111111111111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[1]~input_o\,
	datac => \ALT_INV_datain[2]~input_o\,
	datad => \ALT_INV_datain[0]~input_o\,
	datae => \ALT_INV_ivalid~input_o\,
	combout => \TrafficDecoder|output[3]~3_combout\);

-- Location: LABCELL_X88_Y23_N24
\TrafficDecoder|output[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \TrafficDecoder|output[4]~4_combout\ = ( \ivalid~input_o\ & ( ((!\datain[2]~input_o\) # (\datain[1]~input_o\)) # (\datain[0]~input_o\) ) ) # ( !\ivalid~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111110111111101111111111111111111111101111111011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[0]~input_o\,
	datab => \ALT_INV_datain[2]~input_o\,
	datac => \ALT_INV_datain[1]~input_o\,
	datae => \ALT_INV_ivalid~input_o\,
	combout => \TrafficDecoder|output[4]~4_combout\);

-- Location: LABCELL_X88_Y23_N33
\TrafficDecoder|output[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \TrafficDecoder|output[5]~5_combout\ = ( \ivalid~input_o\ & ( ((!\datain[2]~input_o\) # (!\datain[0]~input_o\)) # (\datain[1]~input_o\) ) ) # ( !\ivalid~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111010111111111111111111111111111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[1]~input_o\,
	datac => \ALT_INV_datain[2]~input_o\,
	datad => \ALT_INV_datain[0]~input_o\,
	datae => \ALT_INV_ivalid~input_o\,
	combout => \TrafficDecoder|output[5]~5_combout\);

-- Location: LABCELL_X88_Y23_N36
\TrafficDecoder|output[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \TrafficDecoder|output[6]~6_combout\ = ( \ivalid~input_o\ & ( ((!\datain[2]~input_o\) # (!\datain[1]~input_o\)) # (\datain[0]~input_o\) ) ) # ( !\ivalid~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111011111110111111111111111111111110111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[0]~input_o\,
	datab => \ALT_INV_datain[2]~input_o\,
	datac => \ALT_INV_datain[1]~input_o\,
	datae => \ALT_INV_ivalid~input_o\,
	combout => \TrafficDecoder|output[6]~6_combout\);

-- Location: LABCELL_X88_Y23_N45
\TrafficDecoder|output[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \TrafficDecoder|output[7]~7_combout\ = ( \ivalid~input_o\ & ( (!\datain[1]~input_o\) # ((!\datain[2]~input_o\) # (!\datain[0]~input_o\)) ) ) # ( !\ivalid~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111101011111111111111111111111111111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[1]~input_o\,
	datac => \ALT_INV_datain[2]~input_o\,
	datad => \ALT_INV_datain[0]~input_o\,
	datae => \ALT_INV_ivalid~input_o\,
	combout => \TrafficDecoder|output[7]~7_combout\);

-- Location: IOIBUF_X30_Y81_N1
\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: IOIBUF_X38_Y0_N18
\resetn~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_resetn,
	o => \resetn~input_o\);

-- Location: IOIBUF_X14_Y81_N18
\iready~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iready,
	o => \iready~input_o\);

-- Location: IOIBUF_X50_Y0_N75
\datain[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(3),
	o => \datain[3]~input_o\);

-- Location: IOIBUF_X89_Y9_N38
\datain[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(4),
	o => \datain[4]~input_o\);

-- Location: IOIBUF_X34_Y81_N58
\datain[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(5),
	o => \datain[5]~input_o\);

-- Location: IOIBUF_X32_Y81_N52
\datain[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(6),
	o => \datain[6]~input_o\);

-- Location: IOIBUF_X12_Y0_N1
\datain[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(7),
	o => \datain[7]~input_o\);

-- Location: LABCELL_X83_Y35_N0
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


