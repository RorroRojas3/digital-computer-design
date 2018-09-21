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

-- DATE "09/18/2017 23:59:00"

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

ENTITY 	lab1_2 IS
    PORT (
	A : IN std_logic_vector(3 DOWNTO 0);
	B : IN std_logic_vector(3 DOWNTO 0);
	Cin : IN std_logic;
	triggerSwitch : IN std_logic;
	SWLEDS : BUFFER std_logic_vector(9 DOWNTO 0)
	);
END lab1_2;

-- Design Ports Information
-- SWLEDS[0]	=>  Location: PIN_AC22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[1]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[2]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[3]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[4]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[5]	=>  Location: PIN_AE24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[6]	=>  Location: PIN_AD20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[7]	=>  Location: PIN_AD21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[8]	=>  Location: PIN_AH28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SWLEDS[9]	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[0]	=>  Location: PIN_AK29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- triggerSwitch	=>  Location: PIN_AB21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[0]	=>  Location: PIN_AC23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cin	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[1]	=>  Location: PIN_AH27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[1]	=>  Location: PIN_AF26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[2]	=>  Location: PIN_AG26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[2]	=>  Location: PIN_AF25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[3]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[3]	=>  Location: PIN_AK28,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF lab1_2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Cin : std_logic;
SIGNAL ww_triggerSwitch : std_logic;
SIGNAL ww_SWLEDS : std_logic_vector(9 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \triggerSwitch~input_o\ : std_logic;
SIGNAL \B[0]~input_o\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \Cin~input_o\ : std_logic;
SIGNAL \finalResult~0_combout\ : std_logic;
SIGNAL \B[1]~input_o\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \finalResult~1_combout\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \B[2]~input_o\ : std_logic;
SIGNAL \FullAdder1|Cout~0_combout\ : std_logic;
SIGNAL \finalResult~2_combout\ : std_logic;
SIGNAL \B[3]~input_o\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \finalResult~3_combout\ : std_logic;
SIGNAL \finalResult~8_combout\ : std_logic;
SIGNAL \finalResult~4_combout\ : std_logic;
SIGNAL \finalResult~5_combout\ : std_logic;
SIGNAL \finalResult~6_combout\ : std_logic;
SIGNAL \finalResult~7_combout\ : std_logic;
SIGNAL \ALT_INV_A[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_Cin~input_o\ : std_logic;
SIGNAL \ALT_INV_A[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_triggerSwitch~input_o\ : std_logic;
SIGNAL \ALT_INV_B[0]~input_o\ : std_logic;
SIGNAL \FullAdder1|ALT_INV_Cout~0_combout\ : std_logic;

BEGIN

ww_A <= A;
ww_B <= B;
ww_Cin <= Cin;
ww_triggerSwitch <= triggerSwitch;
SWLEDS <= ww_SWLEDS;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_A[3]~input_o\ <= NOT \A[3]~input_o\;
\ALT_INV_B[3]~input_o\ <= NOT \B[3]~input_o\;
\ALT_INV_A[2]~input_o\ <= NOT \A[2]~input_o\;
\ALT_INV_B[2]~input_o\ <= NOT \B[2]~input_o\;
\ALT_INV_A[1]~input_o\ <= NOT \A[1]~input_o\;
\ALT_INV_B[1]~input_o\ <= NOT \B[1]~input_o\;
\ALT_INV_Cin~input_o\ <= NOT \Cin~input_o\;
\ALT_INV_A[0]~input_o\ <= NOT \A[0]~input_o\;
\ALT_INV_triggerSwitch~input_o\ <= NOT \triggerSwitch~input_o\;
\ALT_INV_B[0]~input_o\ <= NOT \B[0]~input_o\;
\FullAdder1|ALT_INV_Cout~0_combout\ <= NOT \FullAdder1|Cout~0_combout\;

-- Location: IOOBUF_X86_Y0_N2
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

-- Location: IOOBUF_X80_Y0_N2
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

-- Location: IOOBUF_X84_Y0_N2
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

-- Location: IOOBUF_X88_Y0_N3
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

-- Location: IOOBUF_X89_Y4_N62
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

-- Location: IOOBUF_X88_Y0_N54
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

-- Location: IOOBUF_X82_Y0_N42
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

-- Location: IOOBUF_X82_Y0_N59
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

-- Location: IOOBUF_X89_Y4_N96
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

-- Location: IOOBUF_X16_Y81_N36
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

-- Location: IOIBUF_X88_Y0_N19
\triggerSwitch~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_triggerSwitch,
	o => \triggerSwitch~input_o\);

-- Location: IOIBUF_X82_Y0_N92
\B[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(0),
	o => \B[0]~input_o\);

-- Location: IOIBUF_X86_Y0_N18
\A[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

-- Location: IOIBUF_X88_Y0_N36
\Cin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Cin,
	o => \Cin~input_o\);

-- Location: LABCELL_X85_Y2_N36
\finalResult~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~0_combout\ = ( \A[0]~input_o\ & ( \Cin~input_o\ & ( \B[0]~input_o\ ) ) ) # ( !\A[0]~input_o\ & ( \Cin~input_o\ & ( !\triggerSwitch~input_o\ $ (!\B[0]~input_o\) ) ) ) # ( \A[0]~input_o\ & ( !\Cin~input_o\ & ( !\triggerSwitch~input_o\ $ 
-- (!\B[0]~input_o\) ) ) ) # ( !\A[0]~input_o\ & ( !\Cin~input_o\ & ( \B[0]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111010110100101101001011010010110100000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_triggerSwitch~input_o\,
	datac => \ALT_INV_B[0]~input_o\,
	datae => \ALT_INV_A[0]~input_o\,
	dataf => \ALT_INV_Cin~input_o\,
	combout => \finalResult~0_combout\);

-- Location: IOIBUF_X84_Y0_N52
\B[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(1),
	o => \B[1]~input_o\);

-- Location: IOIBUF_X86_Y0_N52
\A[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

-- Location: LABCELL_X85_Y2_N42
\finalResult~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~1_combout\ = ( \A[0]~input_o\ & ( \Cin~input_o\ & ( !\B[1]~input_o\ $ (((!\triggerSwitch~input_o\) # (\A[1]~input_o\))) ) ) ) # ( !\A[0]~input_o\ & ( \Cin~input_o\ & ( !\B[1]~input_o\ $ (((!\triggerSwitch~input_o\) # (!\A[1]~input_o\ $ 
-- (\B[0]~input_o\)))) ) ) ) # ( \A[0]~input_o\ & ( !\Cin~input_o\ & ( !\B[1]~input_o\ $ (((!\triggerSwitch~input_o\) # (!\A[1]~input_o\ $ (\B[0]~input_o\)))) ) ) ) # ( !\A[0]~input_o\ & ( !\Cin~input_o\ & ( !\B[1]~input_o\ $ (((!\A[1]~input_o\) # 
-- (!\triggerSwitch~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101100110010101010110100101010101011010010101010110011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[1]~input_o\,
	datab => \ALT_INV_A[1]~input_o\,
	datac => \ALT_INV_B[0]~input_o\,
	datad => \ALT_INV_triggerSwitch~input_o\,
	datae => \ALT_INV_A[0]~input_o\,
	dataf => \ALT_INV_Cin~input_o\,
	combout => \finalResult~1_combout\);

-- Location: IOIBUF_X86_Y0_N35
\A[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

-- Location: IOIBUF_X84_Y0_N35
\B[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(2),
	o => \B[2]~input_o\);

-- Location: LABCELL_X85_Y2_N21
\FullAdder1|Cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FullAdder1|Cout~0_combout\ = ( \A[0]~input_o\ & ( \Cin~input_o\ & ( (\B[1]~input_o\) # (\A[1]~input_o\) ) ) ) # ( !\A[0]~input_o\ & ( \Cin~input_o\ & ( (!\B[0]~input_o\ & (\A[1]~input_o\ & \B[1]~input_o\)) # (\B[0]~input_o\ & ((\B[1]~input_o\) # 
-- (\A[1]~input_o\))) ) ) ) # ( \A[0]~input_o\ & ( !\Cin~input_o\ & ( (!\B[0]~input_o\ & (\A[1]~input_o\ & \B[1]~input_o\)) # (\B[0]~input_o\ & ((\B[1]~input_o\) # (\A[1]~input_o\))) ) ) ) # ( !\A[0]~input_o\ & ( !\Cin~input_o\ & ( (\A[1]~input_o\ & 
-- \B[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000001010101111100000101010111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[0]~input_o\,
	datac => \ALT_INV_A[1]~input_o\,
	datad => \ALT_INV_B[1]~input_o\,
	datae => \ALT_INV_A[0]~input_o\,
	dataf => \ALT_INV_Cin~input_o\,
	combout => \FullAdder1|Cout~0_combout\);

-- Location: LABCELL_X85_Y2_N54
\finalResult~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~2_combout\ = ( \FullAdder1|Cout~0_combout\ & ( \triggerSwitch~input_o\ & ( !\A[2]~input_o\ $ (\B[2]~input_o\) ) ) ) # ( !\FullAdder1|Cout~0_combout\ & ( \triggerSwitch~input_o\ & ( !\A[2]~input_o\ $ (!\B[2]~input_o\) ) ) ) # ( 
-- \FullAdder1|Cout~0_combout\ & ( !\triggerSwitch~input_o\ & ( \B[2]~input_o\ ) ) ) # ( !\FullAdder1|Cout~0_combout\ & ( !\triggerSwitch~input_o\ & ( \B[2]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100111100001111001100001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_A[2]~input_o\,
	datac => \ALT_INV_B[2]~input_o\,
	datae => \FullAdder1|ALT_INV_Cout~0_combout\,
	dataf => \ALT_INV_triggerSwitch~input_o\,
	combout => \finalResult~2_combout\);

-- Location: IOIBUF_X84_Y0_N18
\B[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(3),
	o => \B[3]~input_o\);

-- Location: IOIBUF_X82_Y0_N75
\A[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

-- Location: LABCELL_X85_Y2_N30
\finalResult~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~3_combout\ = ( \FullAdder1|Cout~0_combout\ & ( \triggerSwitch~input_o\ & ( !\B[3]~input_o\ $ (!\A[3]~input_o\ $ (((\A[2]~input_o\) # (\B[2]~input_o\)))) ) ) ) # ( !\FullAdder1|Cout~0_combout\ & ( \triggerSwitch~input_o\ & ( !\B[3]~input_o\ $ 
-- (!\A[3]~input_o\ $ (((\B[2]~input_o\ & \A[2]~input_o\)))) ) ) ) # ( \FullAdder1|Cout~0_combout\ & ( !\triggerSwitch~input_o\ & ( \B[3]~input_o\ ) ) ) # ( !\FullAdder1|Cout~0_combout\ & ( !\triggerSwitch~input_o\ & ( \B[3]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100111100011010010110100111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[2]~input_o\,
	datab => \ALT_INV_B[3]~input_o\,
	datac => \ALT_INV_A[3]~input_o\,
	datad => \ALT_INV_A[2]~input_o\,
	datae => \FullAdder1|ALT_INV_Cout~0_combout\,
	dataf => \ALT_INV_triggerSwitch~input_o\,
	combout => \finalResult~3_combout\);

-- Location: LABCELL_X85_Y2_N0
\finalResult~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~8_combout\ = ( !\triggerSwitch~input_o\ & ( (((\A[0]~input_o\))) ) ) # ( \triggerSwitch~input_o\ & ( (!\A[3]~input_o\ & (\B[3]~input_o\ & ((!\FullAdder1|Cout~0_combout\ & (\A[2]~input_o\ & \B[2]~input_o\)) # (\FullAdder1|Cout~0_combout\ & 
-- ((\B[2]~input_o\) # (\A[2]~input_o\)))))) # (\A[3]~input_o\ & (((!\FullAdder1|Cout~0_combout\ & (\A[2]~input_o\ & \B[2]~input_o\)) # (\FullAdder1|Cout~0_combout\ & ((\B[2]~input_o\) # (\A[2]~input_o\)))) # (\B[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111100001111000100010001011100001111000011110001011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[3]~input_o\,
	datab => \ALT_INV_B[3]~input_o\,
	datac => \FullAdder1|ALT_INV_Cout~0_combout\,
	datad => \ALT_INV_A[2]~input_o\,
	datae => \ALT_INV_triggerSwitch~input_o\,
	dataf => \ALT_INV_B[2]~input_o\,
	datag => \ALT_INV_A[0]~input_o\,
	combout => \finalResult~8_combout\);

-- Location: LABCELL_X85_Y2_N6
\finalResult~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~4_combout\ = ( !\triggerSwitch~input_o\ & ( \A[1]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_A[1]~input_o\,
	dataf => \ALT_INV_triggerSwitch~input_o\,
	combout => \finalResult~4_combout\);

-- Location: LABCELL_X85_Y2_N15
\finalResult~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~5_combout\ = ( !\triggerSwitch~input_o\ & ( \A[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_A[2]~input_o\,
	dataf => \ALT_INV_triggerSwitch~input_o\,
	combout => \finalResult~5_combout\);

-- Location: LABCELL_X85_Y2_N48
\finalResult~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~6_combout\ = ( !\triggerSwitch~input_o\ & ( \A[3]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_A[3]~input_o\,
	dataf => \ALT_INV_triggerSwitch~input_o\,
	combout => \finalResult~6_combout\);

-- Location: LABCELL_X85_Y2_N27
\finalResult~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~7_combout\ = ( \Cin~input_o\ & ( !\triggerSwitch~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_triggerSwitch~input_o\,
	dataf => \ALT_INV_Cin~input_o\,
	combout => \finalResult~7_combout\);

-- Location: LABCELL_X16_Y23_N0
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


