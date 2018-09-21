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

-- DATE "11/15/2017 04:31:58"

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

ENTITY 	adder IS
    PORT (
	Cin : IN std_logic;
	registerC : IN std_logic_vector(7 DOWNTO 0);
	bitPair : IN std_logic_vector(7 DOWNTO 0);
	sum : BUFFER std_logic_vector(7 DOWNTO 0);
	Cout : BUFFER std_logic
	);
END adder;

-- Design Ports Information
-- sum[0]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[1]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[2]	=>  Location: PIN_AA28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[3]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[4]	=>  Location: PIN_AA30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[5]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[6]	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[7]	=>  Location: PIN_AF30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cout	=>  Location: PIN_AE29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cin	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- registerC[0]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitPair[0]	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- registerC[1]	=>  Location: PIN_AH30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitPair[1]	=>  Location: PIN_AC29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- registerC[2]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitPair[2]	=>  Location: PIN_AD30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- registerC[3]	=>  Location: PIN_AC30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitPair[3]	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- registerC[4]	=>  Location: PIN_AB30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitPair[4]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- registerC[5]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitPair[5]	=>  Location: PIN_AG30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- registerC[6]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitPair[6]	=>  Location: PIN_AF29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- registerC[7]	=>  Location: PIN_V23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bitPair[7]	=>  Location: PIN_W24,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF adder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Cin : std_logic;
SIGNAL ww_registerC : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_bitPair : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_sum : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Cout : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \registerC[0]~input_o\ : std_logic;
SIGNAL \Cin~input_o\ : std_logic;
SIGNAL \bitPair[0]~input_o\ : std_logic;
SIGNAL \Generate_label:0:stage|Sum~0_combout\ : std_logic;
SIGNAL \registerC[1]~input_o\ : std_logic;
SIGNAL \bitPair[1]~input_o\ : std_logic;
SIGNAL \Generate_label:1:stage|Sum~0_combout\ : std_logic;
SIGNAL \registerC[2]~input_o\ : std_logic;
SIGNAL \Generate_label:1:stage|Cout~0_combout\ : std_logic;
SIGNAL \bitPair[2]~input_o\ : std_logic;
SIGNAL \Generate_label:2:stage|Sum~0_combout\ : std_logic;
SIGNAL \bitPair[3]~input_o\ : std_logic;
SIGNAL \registerC[3]~input_o\ : std_logic;
SIGNAL \Generate_label:3:stage|Sum~0_combout\ : std_logic;
SIGNAL \registerC[4]~input_o\ : std_logic;
SIGNAL \bitPair[4]~input_o\ : std_logic;
SIGNAL \Generate_label:4:stage|Sum~0_combout\ : std_logic;
SIGNAL \Generate_label:4:stage|Sum~1_combout\ : std_logic;
SIGNAL \registerC[5]~input_o\ : std_logic;
SIGNAL \bitPair[5]~input_o\ : std_logic;
SIGNAL \Generate_label:3:stage|Cout~0_combout\ : std_logic;
SIGNAL \Generate_label:5:stage|Sum~0_combout\ : std_logic;
SIGNAL \registerC[6]~input_o\ : std_logic;
SIGNAL \bitPair[6]~input_o\ : std_logic;
SIGNAL \Generate_label:6:stage|Sum~0_combout\ : std_logic;
SIGNAL \Generate_label:6:stage|Sum~1_combout\ : std_logic;
SIGNAL \registerC[7]~input_o\ : std_logic;
SIGNAL \Generate_label:5:stage|Cout~0_combout\ : std_logic;
SIGNAL \bitPair[7]~input_o\ : std_logic;
SIGNAL \Generate_label:7:stage|Sum~0_combout\ : std_logic;
SIGNAL \Generate_label:7:stage|Cout~0_combout\ : std_logic;
SIGNAL \ALT_INV_bitPair[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_registerC[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_bitPair[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_registerC[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_bitPair[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_registerC[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_bitPair[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_registerC[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_bitPair[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_registerC[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_bitPair[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_registerC[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_bitPair[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_registerC[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_bitPair[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_registerC[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_Cin~input_o\ : std_logic;
SIGNAL \Generate_label:5:stage|ALT_INV_Cout~0_combout\ : std_logic;
SIGNAL \Generate_label:6:stage|ALT_INV_Sum~0_combout\ : std_logic;
SIGNAL \Generate_label:3:stage|ALT_INV_Cout~0_combout\ : std_logic;
SIGNAL \Generate_label:4:stage|ALT_INV_Sum~0_combout\ : std_logic;
SIGNAL \Generate_label:1:stage|ALT_INV_Cout~0_combout\ : std_logic;

BEGIN

ww_Cin <= Cin;
ww_registerC <= registerC;
ww_bitPair <= bitPair;
sum <= ww_sum;
Cout <= ww_Cout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_bitPair[7]~input_o\ <= NOT \bitPair[7]~input_o\;
\ALT_INV_registerC[7]~input_o\ <= NOT \registerC[7]~input_o\;
\ALT_INV_bitPair[6]~input_o\ <= NOT \bitPair[6]~input_o\;
\ALT_INV_registerC[6]~input_o\ <= NOT \registerC[6]~input_o\;
\ALT_INV_bitPair[5]~input_o\ <= NOT \bitPair[5]~input_o\;
\ALT_INV_registerC[5]~input_o\ <= NOT \registerC[5]~input_o\;
\ALT_INV_bitPair[4]~input_o\ <= NOT \bitPair[4]~input_o\;
\ALT_INV_registerC[4]~input_o\ <= NOT \registerC[4]~input_o\;
\ALT_INV_bitPair[3]~input_o\ <= NOT \bitPair[3]~input_o\;
\ALT_INV_registerC[3]~input_o\ <= NOT \registerC[3]~input_o\;
\ALT_INV_bitPair[2]~input_o\ <= NOT \bitPair[2]~input_o\;
\ALT_INV_registerC[2]~input_o\ <= NOT \registerC[2]~input_o\;
\ALT_INV_bitPair[1]~input_o\ <= NOT \bitPair[1]~input_o\;
\ALT_INV_registerC[1]~input_o\ <= NOT \registerC[1]~input_o\;
\ALT_INV_bitPair[0]~input_o\ <= NOT \bitPair[0]~input_o\;
\ALT_INV_registerC[0]~input_o\ <= NOT \registerC[0]~input_o\;
\ALT_INV_Cin~input_o\ <= NOT \Cin~input_o\;
\Generate_label:5:stage|ALT_INV_Cout~0_combout\ <= NOT \Generate_label:5:stage|Cout~0_combout\;
\Generate_label:6:stage|ALT_INV_Sum~0_combout\ <= NOT \Generate_label:6:stage|Sum~0_combout\;
\Generate_label:3:stage|ALT_INV_Cout~0_combout\ <= NOT \Generate_label:3:stage|Cout~0_combout\;
\Generate_label:4:stage|ALT_INV_Sum~0_combout\ <= NOT \Generate_label:4:stage|Sum~0_combout\;
\Generate_label:1:stage|ALT_INV_Cout~0_combout\ <= NOT \Generate_label:1:stage|Cout~0_combout\;

-- Location: IOOBUF_X89_Y23_N5
\sum[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Generate_label:0:stage|Sum~0_combout\,
	devoe => ww_devoe,
	o => ww_sum(0));

-- Location: IOOBUF_X89_Y23_N22
\sum[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Generate_label:1:stage|Sum~0_combout\,
	devoe => ww_devoe,
	o => ww_sum(1));

-- Location: IOOBUF_X89_Y21_N56
\sum[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Generate_label:2:stage|Sum~0_combout\,
	devoe => ww_devoe,
	o => ww_sum(2));

-- Location: IOOBUF_X89_Y20_N45
\sum[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Generate_label:3:stage|Sum~0_combout\,
	devoe => ww_devoe,
	o => ww_sum(3));

-- Location: IOOBUF_X89_Y21_N22
\sum[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Generate_label:4:stage|Sum~1_combout\,
	devoe => ww_devoe,
	o => ww_sum(4));

-- Location: IOOBUF_X89_Y20_N79
\sum[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Generate_label:5:stage|Sum~0_combout\,
	devoe => ww_devoe,
	o => ww_sum(5));

-- Location: IOOBUF_X89_Y13_N56
\sum[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Generate_label:6:stage|Sum~1_combout\,
	devoe => ww_devoe,
	o => ww_sum(6));

-- Location: IOOBUF_X89_Y15_N56
\sum[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Generate_label:7:stage|Sum~0_combout\,
	devoe => ww_devoe,
	o => ww_sum(7));

-- Location: IOOBUF_X89_Y23_N39
\Cout~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Generate_label:7:stage|Cout~0_combout\,
	devoe => ww_devoe,
	o => ww_Cout);

-- Location: IOIBUF_X89_Y20_N61
\registerC[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_registerC(0),
	o => \registerC[0]~input_o\);

-- Location: IOIBUF_X89_Y16_N21
\Cin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Cin,
	o => \Cin~input_o\);

-- Location: IOIBUF_X89_Y23_N55
\bitPair[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitPair(0),
	o => \bitPair[0]~input_o\);

-- Location: LABCELL_X88_Y20_N30
\Generate_label:0:stage|Sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Generate_label:0:stage|Sum~0_combout\ = ( \bitPair[0]~input_o\ & ( !\registerC[0]~input_o\ $ (\Cin~input_o\) ) ) # ( !\bitPair[0]~input_o\ & ( !\registerC[0]~input_o\ $ (!\Cin~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010010110100101101010100101101001011010010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_registerC[0]~input_o\,
	datac => \ALT_INV_Cin~input_o\,
	dataf => \ALT_INV_bitPair[0]~input_o\,
	combout => \Generate_label:0:stage|Sum~0_combout\);

-- Location: IOIBUF_X89_Y16_N38
\registerC[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_registerC(1),
	o => \registerC[1]~input_o\);

-- Location: IOIBUF_X89_Y20_N95
\bitPair[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitPair(1),
	o => \bitPair[1]~input_o\);

-- Location: LABCELL_X88_Y20_N39
\Generate_label:1:stage|Sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Generate_label:1:stage|Sum~0_combout\ = ( \bitPair[1]~input_o\ & ( \bitPair[0]~input_o\ & ( !\registerC[1]~input_o\ $ (((\registerC[0]~input_o\) # (\Cin~input_o\))) ) ) ) # ( !\bitPair[1]~input_o\ & ( \bitPair[0]~input_o\ & ( !\registerC[1]~input_o\ $ 
-- (((!\Cin~input_o\ & !\registerC[0]~input_o\))) ) ) ) # ( \bitPair[1]~input_o\ & ( !\bitPair[0]~input_o\ & ( !\registerC[1]~input_o\ $ (((\Cin~input_o\ & \registerC[0]~input_o\))) ) ) ) # ( !\bitPair[1]~input_o\ & ( !\bitPair[0]~input_o\ & ( 
-- !\registerC[1]~input_o\ $ (((!\Cin~input_o\) # (!\registerC[0]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010111100001010010101011010111100001010010100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Cin~input_o\,
	datac => \ALT_INV_registerC[1]~input_o\,
	datad => \ALT_INV_registerC[0]~input_o\,
	datae => \ALT_INV_bitPair[1]~input_o\,
	dataf => \ALT_INV_bitPair[0]~input_o\,
	combout => \Generate_label:1:stage|Sum~0_combout\);

-- Location: IOIBUF_X89_Y25_N4
\registerC[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_registerC(2),
	o => \registerC[2]~input_o\);

-- Location: LABCELL_X88_Y20_N42
\Generate_label:1:stage|Cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Generate_label:1:stage|Cout~0_combout\ = ( \bitPair[1]~input_o\ & ( \bitPair[0]~input_o\ & ( ((\Cin~input_o\) # (\registerC[1]~input_o\)) # (\registerC[0]~input_o\) ) ) ) # ( !\bitPair[1]~input_o\ & ( \bitPair[0]~input_o\ & ( (\registerC[1]~input_o\ & 
-- ((\Cin~input_o\) # (\registerC[0]~input_o\))) ) ) ) # ( \bitPair[1]~input_o\ & ( !\bitPair[0]~input_o\ & ( ((\registerC[0]~input_o\ & \Cin~input_o\)) # (\registerC[1]~input_o\) ) ) ) # ( !\bitPair[1]~input_o\ & ( !\bitPair[0]~input_o\ & ( 
-- (\registerC[0]~input_o\ & (\registerC[1]~input_o\ & \Cin~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001001101110011011100010011000100110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_registerC[0]~input_o\,
	datab => \ALT_INV_registerC[1]~input_o\,
	datac => \ALT_INV_Cin~input_o\,
	datae => \ALT_INV_bitPair[1]~input_o\,
	dataf => \ALT_INV_bitPair[0]~input_o\,
	combout => \Generate_label:1:stage|Cout~0_combout\);

-- Location: IOIBUF_X89_Y25_N38
\bitPair[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitPair(2),
	o => \bitPair[2]~input_o\);

-- Location: LABCELL_X88_Y21_N0
\Generate_label:2:stage|Sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Generate_label:2:stage|Sum~0_combout\ = ( \bitPair[2]~input_o\ & ( !\registerC[2]~input_o\ $ (\Generate_label:1:stage|Cout~0_combout\) ) ) # ( !\bitPair[2]~input_o\ & ( !\registerC[2]~input_o\ $ (!\Generate_label:1:stage|Cout~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010010110100101101010100101101001011010010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_registerC[2]~input_o\,
	datac => \Generate_label:1:stage|ALT_INV_Cout~0_combout\,
	dataf => \ALT_INV_bitPair[2]~input_o\,
	combout => \Generate_label:2:stage|Sum~0_combout\);

-- Location: IOIBUF_X89_Y25_N21
\bitPair[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitPair(3),
	o => \bitPair[3]~input_o\);

-- Location: IOIBUF_X89_Y25_N55
\registerC[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_registerC(3),
	o => \registerC[3]~input_o\);

-- Location: LABCELL_X88_Y20_N18
\Generate_label:3:stage|Sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Generate_label:3:stage|Sum~0_combout\ = ( \bitPair[2]~input_o\ & ( \registerC[3]~input_o\ & ( !\bitPair[3]~input_o\ $ (((\registerC[2]~input_o\) # (\Generate_label:1:stage|Cout~0_combout\))) ) ) ) # ( !\bitPair[2]~input_o\ & ( \registerC[3]~input_o\ & ( 
-- !\bitPair[3]~input_o\ $ (((\Generate_label:1:stage|Cout~0_combout\ & \registerC[2]~input_o\))) ) ) ) # ( \bitPair[2]~input_o\ & ( !\registerC[3]~input_o\ & ( !\bitPair[3]~input_o\ $ (((!\Generate_label:1:stage|Cout~0_combout\ & !\registerC[2]~input_o\))) 
-- ) ) ) # ( !\bitPair[2]~input_o\ & ( !\registerC[3]~input_o\ & ( !\bitPair[3]~input_o\ $ (((!\Generate_label:1:stage|Cout~0_combout\) # (!\registerC[2]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011001010110011010100110101010101001101010011001010110010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_bitPair[3]~input_o\,
	datab => \Generate_label:1:stage|ALT_INV_Cout~0_combout\,
	datac => \ALT_INV_registerC[2]~input_o\,
	datae => \ALT_INV_bitPair[2]~input_o\,
	dataf => \ALT_INV_registerC[3]~input_o\,
	combout => \Generate_label:3:stage|Sum~0_combout\);

-- Location: IOIBUF_X89_Y21_N4
\registerC[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_registerC(4),
	o => \registerC[4]~input_o\);

-- Location: IOIBUF_X89_Y21_N38
\bitPair[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitPair(4),
	o => \bitPair[4]~input_o\);

-- Location: LABCELL_X88_Y21_N39
\Generate_label:4:stage|Sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Generate_label:4:stage|Sum~0_combout\ = ( !\registerC[4]~input_o\ & ( \bitPair[4]~input_o\ ) ) # ( \registerC[4]~input_o\ & ( !\bitPair[4]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_registerC[4]~input_o\,
	dataf => \ALT_INV_bitPair[4]~input_o\,
	combout => \Generate_label:4:stage|Sum~0_combout\);

-- Location: LABCELL_X88_Y21_N42
\Generate_label:4:stage|Sum~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Generate_label:4:stage|Sum~1_combout\ = ( \registerC[3]~input_o\ & ( \bitPair[3]~input_o\ & ( !\Generate_label:4:stage|Sum~0_combout\ ) ) ) # ( !\registerC[3]~input_o\ & ( \bitPair[3]~input_o\ & ( !\Generate_label:4:stage|Sum~0_combout\ $ 
-- (((!\registerC[2]~input_o\ & ((!\Generate_label:1:stage|Cout~0_combout\) # (!\bitPair[2]~input_o\))) # (\registerC[2]~input_o\ & (!\Generate_label:1:stage|Cout~0_combout\ & !\bitPair[2]~input_o\)))) ) ) ) # ( \registerC[3]~input_o\ & ( 
-- !\bitPair[3]~input_o\ & ( !\Generate_label:4:stage|Sum~0_combout\ $ (((!\registerC[2]~input_o\ & ((!\Generate_label:1:stage|Cout~0_combout\) # (!\bitPair[2]~input_o\))) # (\registerC[2]~input_o\ & (!\Generate_label:1:stage|Cout~0_combout\ & 
-- !\bitPair[2]~input_o\)))) ) ) ) # ( !\registerC[3]~input_o\ & ( !\bitPair[3]~input_o\ & ( \Generate_label:4:stage|Sum~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001101100110110000110110011011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_registerC[2]~input_o\,
	datab => \Generate_label:4:stage|ALT_INV_Sum~0_combout\,
	datac => \Generate_label:1:stage|ALT_INV_Cout~0_combout\,
	datad => \ALT_INV_bitPair[2]~input_o\,
	datae => \ALT_INV_registerC[3]~input_o\,
	dataf => \ALT_INV_bitPair[3]~input_o\,
	combout => \Generate_label:4:stage|Sum~1_combout\);

-- Location: IOIBUF_X89_Y16_N4
\registerC[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_registerC(5),
	o => \registerC[5]~input_o\);

-- Location: IOIBUF_X89_Y16_N55
\bitPair[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitPair(5),
	o => \bitPair[5]~input_o\);

-- Location: LABCELL_X88_Y20_N57
\Generate_label:3:stage|Cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Generate_label:3:stage|Cout~0_combout\ = ( \bitPair[2]~input_o\ & ( \registerC[3]~input_o\ & ( ((\bitPair[3]~input_o\) # (\Generate_label:1:stage|Cout~0_combout\)) # (\registerC[2]~input_o\) ) ) ) # ( !\bitPair[2]~input_o\ & ( \registerC[3]~input_o\ & ( 
-- ((\registerC[2]~input_o\ & \Generate_label:1:stage|Cout~0_combout\)) # (\bitPair[3]~input_o\) ) ) ) # ( \bitPair[2]~input_o\ & ( !\registerC[3]~input_o\ & ( (\bitPair[3]~input_o\ & ((\Generate_label:1:stage|Cout~0_combout\) # (\registerC[2]~input_o\))) ) 
-- ) ) # ( !\bitPair[2]~input_o\ & ( !\registerC[3]~input_o\ & ( (\registerC[2]~input_o\ & (\Generate_label:1:stage|Cout~0_combout\ & \bitPair[3]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000000000101111100000101111111110101111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_registerC[2]~input_o\,
	datac => \Generate_label:1:stage|ALT_INV_Cout~0_combout\,
	datad => \ALT_INV_bitPair[3]~input_o\,
	datae => \ALT_INV_bitPair[2]~input_o\,
	dataf => \ALT_INV_registerC[3]~input_o\,
	combout => \Generate_label:3:stage|Cout~0_combout\);

-- Location: LABCELL_X88_Y20_N0
\Generate_label:5:stage|Sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Generate_label:5:stage|Sum~0_combout\ = ( \Generate_label:3:stage|Cout~0_combout\ & ( \bitPair[4]~input_o\ & ( !\registerC[5]~input_o\ $ (\bitPair[5]~input_o\) ) ) ) # ( !\Generate_label:3:stage|Cout~0_combout\ & ( \bitPair[4]~input_o\ & ( 
-- !\registerC[4]~input_o\ $ (!\registerC[5]~input_o\ $ (\bitPair[5]~input_o\)) ) ) ) # ( \Generate_label:3:stage|Cout~0_combout\ & ( !\bitPair[4]~input_o\ & ( !\registerC[4]~input_o\ $ (!\registerC[5]~input_o\ $ (\bitPair[5]~input_o\)) ) ) ) # ( 
-- !\Generate_label:3:stage|Cout~0_combout\ & ( !\bitPair[4]~input_o\ & ( !\registerC[5]~input_o\ $ (!\bitPair[5]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000111100011010010110100101101001011010011100001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_registerC[4]~input_o\,
	datab => \ALT_INV_registerC[5]~input_o\,
	datac => \ALT_INV_bitPair[5]~input_o\,
	datae => \Generate_label:3:stage|ALT_INV_Cout~0_combout\,
	dataf => \ALT_INV_bitPair[4]~input_o\,
	combout => \Generate_label:5:stage|Sum~0_combout\);

-- Location: IOIBUF_X89_Y13_N4
\registerC[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_registerC(6),
	o => \registerC[6]~input_o\);

-- Location: IOIBUF_X89_Y15_N38
\bitPair[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitPair(6),
	o => \bitPair[6]~input_o\);

-- Location: LABCELL_X88_Y19_N30
\Generate_label:6:stage|Sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Generate_label:6:stage|Sum~0_combout\ = ( \bitPair[6]~input_o\ & ( !\registerC[6]~input_o\ ) ) # ( !\bitPair[6]~input_o\ & ( \registerC[6]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_registerC[6]~input_o\,
	dataf => \ALT_INV_bitPair[6]~input_o\,
	combout => \Generate_label:6:stage|Sum~0_combout\);

-- Location: LABCELL_X88_Y19_N36
\Generate_label:6:stage|Sum~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Generate_label:6:stage|Sum~1_combout\ = ( \registerC[5]~input_o\ & ( \bitPair[4]~input_o\ & ( !\Generate_label:6:stage|Sum~0_combout\ $ (((!\registerC[4]~input_o\ & (!\bitPair[5]~input_o\ & !\Generate_label:3:stage|Cout~0_combout\)))) ) ) ) # ( 
-- !\registerC[5]~input_o\ & ( \bitPair[4]~input_o\ & ( !\Generate_label:6:stage|Sum~0_combout\ $ (((!\bitPair[5]~input_o\) # ((!\registerC[4]~input_o\ & !\Generate_label:3:stage|Cout~0_combout\)))) ) ) ) # ( \registerC[5]~input_o\ & ( !\bitPair[4]~input_o\ 
-- & ( !\Generate_label:6:stage|Sum~0_combout\ $ (((!\bitPair[5]~input_o\ & ((!\registerC[4]~input_o\) # (!\Generate_label:3:stage|Cout~0_combout\))))) ) ) ) # ( !\registerC[5]~input_o\ & ( !\bitPair[4]~input_o\ & ( !\Generate_label:6:stage|Sum~0_combout\ $ 
-- (((!\registerC[4]~input_o\) # ((!\bitPair[5]~input_o\) # (!\Generate_label:3:stage|Cout~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110110001111000110110000110110001111000110110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_registerC[4]~input_o\,
	datab => \Generate_label:6:stage|ALT_INV_Sum~0_combout\,
	datac => \ALT_INV_bitPair[5]~input_o\,
	datad => \Generate_label:3:stage|ALT_INV_Cout~0_combout\,
	datae => \ALT_INV_registerC[5]~input_o\,
	dataf => \ALT_INV_bitPair[4]~input_o\,
	combout => \Generate_label:6:stage|Sum~1_combout\);

-- Location: IOIBUF_X89_Y15_N4
\registerC[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_registerC(7),
	o => \registerC[7]~input_o\);

-- Location: LABCELL_X88_Y19_N42
\Generate_label:5:stage|Cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Generate_label:5:stage|Cout~0_combout\ = ( \registerC[5]~input_o\ & ( \bitPair[4]~input_o\ & ( ((\bitPair[5]~input_o\) # (\Generate_label:3:stage|Cout~0_combout\)) # (\registerC[4]~input_o\) ) ) ) # ( !\registerC[5]~input_o\ & ( \bitPair[4]~input_o\ & ( 
-- (\bitPair[5]~input_o\ & ((\Generate_label:3:stage|Cout~0_combout\) # (\registerC[4]~input_o\))) ) ) ) # ( \registerC[5]~input_o\ & ( !\bitPair[4]~input_o\ & ( ((\registerC[4]~input_o\ & \Generate_label:3:stage|Cout~0_combout\)) # (\bitPair[5]~input_o\) ) 
-- ) ) # ( !\registerC[5]~input_o\ & ( !\bitPair[4]~input_o\ & ( (\registerC[4]~input_o\ & (\Generate_label:3:stage|Cout~0_combout\ & \bitPair[5]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000111110001111100000111000001110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_registerC[4]~input_o\,
	datab => \Generate_label:3:stage|ALT_INV_Cout~0_combout\,
	datac => \ALT_INV_bitPair[5]~input_o\,
	datae => \ALT_INV_registerC[5]~input_o\,
	dataf => \ALT_INV_bitPair[4]~input_o\,
	combout => \Generate_label:5:stage|Cout~0_combout\);

-- Location: IOIBUF_X89_Y15_N21
\bitPair[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bitPair(7),
	o => \bitPair[7]~input_o\);

-- Location: LABCELL_X88_Y19_N51
\Generate_label:7:stage|Sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Generate_label:7:stage|Sum~0_combout\ = ( \bitPair[6]~input_o\ & ( !\registerC[7]~input_o\ $ (!\bitPair[7]~input_o\ $ (((\registerC[6]~input_o\) # (\Generate_label:5:stage|Cout~0_combout\)))) ) ) # ( !\bitPair[6]~input_o\ & ( !\registerC[7]~input_o\ $ 
-- (!\bitPair[7]~input_o\ $ (((\Generate_label:5:stage|Cout~0_combout\ & \registerC[6]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001101001010110100110100101101001101001010110100110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_registerC[7]~input_o\,
	datab => \Generate_label:5:stage|ALT_INV_Cout~0_combout\,
	datac => \ALT_INV_bitPair[7]~input_o\,
	datad => \ALT_INV_registerC[6]~input_o\,
	dataf => \ALT_INV_bitPair[6]~input_o\,
	combout => \Generate_label:7:stage|Sum~0_combout\);

-- Location: LABCELL_X88_Y19_N48
\Generate_label:7:stage|Cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Generate_label:7:stage|Cout~0_combout\ = ( \bitPair[6]~input_o\ & ( (!\registerC[7]~input_o\ & (\bitPair[7]~input_o\ & ((\registerC[6]~input_o\) # (\Generate_label:5:stage|Cout~0_combout\)))) # (\registerC[7]~input_o\ & (((\bitPair[7]~input_o\) # 
-- (\registerC[6]~input_o\)) # (\Generate_label:5:stage|Cout~0_combout\))) ) ) # ( !\bitPair[6]~input_o\ & ( (!\registerC[7]~input_o\ & (\Generate_label:5:stage|Cout~0_combout\ & (\registerC[6]~input_o\ & \bitPair[7]~input_o\))) # (\registerC[7]~input_o\ & 
-- (((\Generate_label:5:stage|Cout~0_combout\ & \registerC[6]~input_o\)) # (\bitPair[7]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101010111000000010101011100010101011111110001010101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_registerC[7]~input_o\,
	datab => \Generate_label:5:stage|ALT_INV_Cout~0_combout\,
	datac => \ALT_INV_registerC[6]~input_o\,
	datad => \ALT_INV_bitPair[7]~input_o\,
	dataf => \ALT_INV_bitPair[6]~input_o\,
	combout => \Generate_label:7:stage|Cout~0_combout\);

-- Location: LABCELL_X19_Y39_N0
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


