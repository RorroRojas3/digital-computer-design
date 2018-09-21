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

-- DATE "09/29/2017 00:51:54"

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

ENTITY 	Lab1c IS
    PORT (
	A : IN std_logic_vector(3 DOWNTO 0);
	B : IN std_logic_vector(3 DOWNTO 0);
	Cin : IN std_logic;
	triggerSwitch : IN std_logic;
	HEX5 : OUT std_logic_vector(6 DOWNTO 0);
	HEX4 : OUT std_logic_vector(6 DOWNTO 0);
	HEX3 : OUT std_logic_vector(6 DOWNTO 0);
	HEX2 : OUT std_logic_vector(6 DOWNTO 0);
	HEX1 : OUT std_logic_vector(6 DOWNTO 0);
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	SWLEDS : OUT std_logic_vector(9 DOWNTO 0)
	);
END Lab1c;

-- Design Ports Information
-- HEX5[0]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[1]	=>  Location: PIN_AA28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[2]	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[3]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[4]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[5]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[6]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[0]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[1]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[2]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[4]	=>  Location: PIN_W24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[5]	=>  Location: PIN_V23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[6]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[0]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[1]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[2]	=>  Location: PIN_AD25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[3]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[4]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[5]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[6]	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[0]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[1]	=>  Location: PIN_AE29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[2]	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[3]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[4]	=>  Location: PIN_AD30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[5]	=>  Location: PIN_AC29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[6]	=>  Location: PIN_AC30,	 I/O Standard: 2.5 V,	 Current Strength: Default
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
-- B[3]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[1]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[2]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[3]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[1]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[2]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[0]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cin	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- triggerSwitch	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Lab1c IS
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
SIGNAL ww_HEX5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_SWLEDS : std_logic_vector(9 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \B[3]~input_o\ : std_logic;
SIGNAL \B[2]~input_o\ : std_logic;
SIGNAL \B[1]~input_o\ : std_logic;
SIGNAL \DisplayB|BCDConversion[4]~0_combout\ : std_logic;
SIGNAL \B[0]~input_o\ : std_logic;
SIGNAL \DisplayB|DISPLAY|Mux12~0_combout\ : std_logic;
SIGNAL \DisplayB|DISPLAY|Mux11~0_combout\ : std_logic;
SIGNAL \DisplayB|DISPLAY|Mux10~0_combout\ : std_logic;
SIGNAL \DisplayB|DISPLAY|Mux9~0_combout\ : std_logic;
SIGNAL \DisplayB|DISPLAY|Mux8~0_combout\ : std_logic;
SIGNAL \DisplayB|DISPLAY|Mux7~0_combout\ : std_logic;
SIGNAL \DisplayB|DISPLAY|Mux6~0_combout\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \DisplayA|BCDConversion[4]~0_combout\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \DisplayA|DISPLAY|Mux12~0_combout\ : std_logic;
SIGNAL \DisplayA|DISPLAY|Mux11~0_combout\ : std_logic;
SIGNAL \DisplayA|DISPLAY|Mux10~0_combout\ : std_logic;
SIGNAL \DisplayA|DISPLAY|Mux9~0_combout\ : std_logic;
SIGNAL \DisplayA|DISPLAY|Mux8~0_combout\ : std_logic;
SIGNAL \DisplayA|DISPLAY|Mux7~0_combout\ : std_logic;
SIGNAL \DisplayA|DISPLAY|Mux6~0_combout\ : std_logic;
SIGNAL \Cin~input_o\ : std_logic;
SIGNAL \Addition|FullAdder1|Sum~0_combout\ : std_logic;
SIGNAL \Addition|FullAdder1|Cout~0_combout\ : std_logic;
SIGNAL \Addition|FULLAdder3|Cout~0_combout\ : std_logic;
SIGNAL \Addition|FULLAdder3|Sum~0_combout\ : std_logic;
SIGNAL \Addition|FullAdder2|Sum~0_combout\ : std_logic;
SIGNAL \DisplaySum|DISPLAY|Mux5~0_combout\ : std_logic;
SIGNAL \DisplaySum|Mux3~0_combout\ : std_logic;
SIGNAL \DisplaySum|Mux2~0_combout\ : std_logic;
SIGNAL \DisplaySum|Mux1~0_combout\ : std_logic;
SIGNAL \DisplaySum|DISPLAY|Mux4~0_combout\ : std_logic;
SIGNAL \Addition|FullAdder0|Sum~0_combout\ : std_logic;
SIGNAL \DisplaySum|Mux4~0_combout\ : std_logic;
SIGNAL \DisplaySum|DISPLAY|Mux12~0_combout\ : std_logic;
SIGNAL \DisplaySum|DISPLAY|Mux11~0_combout\ : std_logic;
SIGNAL \DisplaySum|DISPLAY|Mux10~0_combout\ : std_logic;
SIGNAL \DisplaySum|DISPLAY|Mux9~0_combout\ : std_logic;
SIGNAL \DisplaySum|DISPLAY|Mux8~0_combout\ : std_logic;
SIGNAL \DisplaySum|DISPLAY|Mux7~0_combout\ : std_logic;
SIGNAL \DisplaySum|DISPLAY|Mux6~0_combout\ : std_logic;
SIGNAL \triggerSwitch~input_o\ : std_logic;
SIGNAL \finalResult~0_combout\ : std_logic;
SIGNAL \finalResult~1_combout\ : std_logic;
SIGNAL \finalResult~2_combout\ : std_logic;
SIGNAL \finalResult~3_combout\ : std_logic;
SIGNAL \finalResult~4_combout\ : std_logic;
SIGNAL \finalResult~5_combout\ : std_logic;
SIGNAL \finalResult~6_combout\ : std_logic;
SIGNAL \finalResult~7_combout\ : std_logic;
SIGNAL \finalResult~8_combout\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \process_0~1_combout\ : std_logic;
SIGNAL \ALT_INV_triggerSwitch~input_o\ : std_logic;
SIGNAL \ALT_INV_Cin~input_o\ : std_logic;
SIGNAL \ALT_INV_A[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[3]~input_o\ : std_logic;
SIGNAL \DisplayB|DISPLAY|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \DisplayA|DISPLAY|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \ALT_INV_process_0~0_combout\ : std_logic;
SIGNAL \DisplaySum|DISPLAY|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \DisplaySum|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \Addition|FullAdder0|ALT_INV_Sum~0_combout\ : std_logic;
SIGNAL \DisplaySum|DISPLAY|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \DisplaySum|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \DisplaySum|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \DisplaySum|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \Addition|FullAdder1|ALT_INV_Sum~0_combout\ : std_logic;
SIGNAL \Addition|FullAdder2|ALT_INV_Sum~0_combout\ : std_logic;
SIGNAL \Addition|FULLAdder3|ALT_INV_Sum~0_combout\ : std_logic;
SIGNAL \Addition|FULLAdder3|ALT_INV_Cout~0_combout\ : std_logic;
SIGNAL \Addition|FullAdder1|ALT_INV_Cout~0_combout\ : std_logic;

BEGIN

ww_A <= A;
ww_B <= B;
ww_Cin <= Cin;
ww_triggerSwitch <= triggerSwitch;
HEX5 <= ww_HEX5;
HEX4 <= ww_HEX4;
HEX3 <= ww_HEX3;
HEX2 <= ww_HEX2;
HEX1 <= ww_HEX1;
HEX0 <= ww_HEX0;
SWLEDS <= ww_SWLEDS;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_triggerSwitch~input_o\ <= NOT \triggerSwitch~input_o\;
\ALT_INV_Cin~input_o\ <= NOT \Cin~input_o\;
\ALT_INV_A[0]~input_o\ <= NOT \A[0]~input_o\;
\ALT_INV_A[2]~input_o\ <= NOT \A[2]~input_o\;
\ALT_INV_A[1]~input_o\ <= NOT \A[1]~input_o\;
\ALT_INV_A[3]~input_o\ <= NOT \A[3]~input_o\;
\ALT_INV_B[0]~input_o\ <= NOT \B[0]~input_o\;
\ALT_INV_B[2]~input_o\ <= NOT \B[2]~input_o\;
\ALT_INV_B[1]~input_o\ <= NOT \B[1]~input_o\;
\ALT_INV_B[3]~input_o\ <= NOT \B[3]~input_o\;
\DisplayB|DISPLAY|ALT_INV_Mux6~0_combout\ <= NOT \DisplayB|DISPLAY|Mux6~0_combout\;
\DisplayA|DISPLAY|ALT_INV_Mux6~0_combout\ <= NOT \DisplayA|DISPLAY|Mux6~0_combout\;
\ALT_INV_process_0~0_combout\ <= NOT \process_0~0_combout\;
\DisplaySum|DISPLAY|ALT_INV_Mux6~0_combout\ <= NOT \DisplaySum|DISPLAY|Mux6~0_combout\;
\DisplaySum|ALT_INV_Mux4~0_combout\ <= NOT \DisplaySum|Mux4~0_combout\;
\Addition|FullAdder0|ALT_INV_Sum~0_combout\ <= NOT \Addition|FullAdder0|Sum~0_combout\;
\DisplaySum|DISPLAY|ALT_INV_Mux4~0_combout\ <= NOT \DisplaySum|DISPLAY|Mux4~0_combout\;
\DisplaySum|ALT_INV_Mux3~0_combout\ <= NOT \DisplaySum|Mux3~0_combout\;
\DisplaySum|ALT_INV_Mux2~0_combout\ <= NOT \DisplaySum|Mux2~0_combout\;
\DisplaySum|ALT_INV_Mux1~0_combout\ <= NOT \DisplaySum|Mux1~0_combout\;
\Addition|FullAdder1|ALT_INV_Sum~0_combout\ <= NOT \Addition|FullAdder1|Sum~0_combout\;
\Addition|FullAdder2|ALT_INV_Sum~0_combout\ <= NOT \Addition|FullAdder2|Sum~0_combout\;
\Addition|FULLAdder3|ALT_INV_Sum~0_combout\ <= NOT \Addition|FULLAdder3|Sum~0_combout\;
\Addition|FULLAdder3|ALT_INV_Cout~0_combout\ <= NOT \Addition|FULLAdder3|Cout~0_combout\;
\Addition|FullAdder1|ALT_INV_Cout~0_combout\ <= NOT \Addition|FullAdder1|Cout~0_combout\;

-- Location: IOOBUF_X89_Y20_N62
\HEX5[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayB|BCDConversion[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX5(0));

-- Location: IOOBUF_X89_Y21_N56
\HEX5[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayB|BCDConversion[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX5(1));

-- Location: IOOBUF_X89_Y25_N22
\HEX5[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayB|BCDConversion[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX5(2));

-- Location: IOOBUF_X89_Y23_N22
\HEX5[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayB|BCDConversion[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX5(3));

-- Location: IOOBUF_X89_Y9_N56
\HEX5[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayB|BCDConversion[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX5(4));

-- Location: IOOBUF_X89_Y23_N5
\HEX5[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayB|BCDConversion[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX5(5));

-- Location: IOOBUF_X89_Y9_N39
\HEX5[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_HEX5(6));

-- Location: IOOBUF_X89_Y11_N45
\HEX4[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayB|DISPLAY|Mux12~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX4(0));

-- Location: IOOBUF_X89_Y13_N5
\HEX4[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayB|DISPLAY|Mux11~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX4(1));

-- Location: IOOBUF_X89_Y13_N22
\HEX4[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayB|DISPLAY|Mux10~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX4(2));

-- Location: IOOBUF_X89_Y8_N22
\HEX4[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayB|DISPLAY|Mux9~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX4(3));

-- Location: IOOBUF_X89_Y15_N22
\HEX4[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayB|DISPLAY|Mux8~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX4(4));

-- Location: IOOBUF_X89_Y15_N5
\HEX4[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayB|DISPLAY|Mux7~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX4(5));

-- Location: IOOBUF_X89_Y20_N45
\HEX4[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayB|DISPLAY|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX4(6));

-- Location: IOOBUF_X89_Y16_N5
\HEX3[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayA|BCDConversion[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(0));

-- Location: IOOBUF_X89_Y16_N22
\HEX3[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayA|BCDConversion[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(1));

-- Location: IOOBUF_X89_Y4_N45
\HEX3[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayA|BCDConversion[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(2));

-- Location: IOOBUF_X89_Y4_N62
\HEX3[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayA|BCDConversion[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(3));

-- Location: IOOBUF_X89_Y21_N39
\HEX3[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayA|BCDConversion[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(4));

-- Location: IOOBUF_X89_Y11_N62
\HEX3[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayA|BCDConversion[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(5));

-- Location: IOOBUF_X89_Y9_N5
\HEX3[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_HEX3(6));

-- Location: IOOBUF_X89_Y9_N22
\HEX2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayA|DISPLAY|Mux12~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(0));

-- Location: IOOBUF_X89_Y23_N39
\HEX2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayA|DISPLAY|Mux11~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(1));

-- Location: IOOBUF_X89_Y23_N56
\HEX2[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayA|DISPLAY|Mux10~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(2));

-- Location: IOOBUF_X89_Y20_N79
\HEX2[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayA|DISPLAY|Mux9~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(3));

-- Location: IOOBUF_X89_Y25_N39
\HEX2[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayA|DISPLAY|Mux8~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(4));

-- Location: IOOBUF_X89_Y20_N96
\HEX2[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayA|DISPLAY|Mux7~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(5));

-- Location: IOOBUF_X89_Y25_N56
\HEX2[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplayA|DISPLAY|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(6));

-- Location: IOOBUF_X89_Y6_N39
\HEX1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DisplaySum|DISPLAY|Mux5~0_combout\,
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
	i => \DisplaySum|DISPLAY|ALT_INV_Mux4~0_combout\,
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
	i => \DisplaySum|DISPLAY|ALT_INV_Mux4~0_combout\,
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
	i => \DisplaySum|DISPLAY|Mux5~0_combout\,
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
	i => \DisplaySum|DISPLAY|Mux5~0_combout\,
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
	i => \DisplaySum|DISPLAY|Mux5~0_combout\,
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
	i => \DisplaySum|DISPLAY|Mux12~0_combout\,
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
	i => \DisplaySum|DISPLAY|Mux11~0_combout\,
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
	i => \DisplaySum|DISPLAY|Mux10~0_combout\,
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
	i => \DisplaySum|DISPLAY|Mux9~0_combout\,
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
	i => \DisplaySum|DISPLAY|Mux8~0_combout\,
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
	i => \DisplaySum|DISPLAY|Mux7~0_combout\,
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
	i => \DisplaySum|DISPLAY|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(6));

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
	i => \finalResult~4_combout\,
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
	i => \finalResult~5_combout\,
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
	i => \finalResult~6_combout\,
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
	i => \finalResult~7_combout\,
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
	i => \finalResult~8_combout\,
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
	i => \process_0~1_combout\,
	devoe => ww_devoe,
	o => ww_SWLEDS(9));

-- Location: IOIBUF_X4_Y0_N52
\B[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(3),
	o => \B[3]~input_o\);

-- Location: IOIBUF_X8_Y0_N35
\B[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(2),
	o => \B[2]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\B[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(1),
	o => \B[1]~input_o\);

-- Location: MLABCELL_X87_Y8_N30
\DisplayB|BCDConversion[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayB|BCDConversion[4]~0_combout\ = ( \B[1]~input_o\ & ( \B[3]~input_o\ ) ) # ( !\B[1]~input_o\ & ( (\B[3]~input_o\ & \B[2]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[3]~input_o\,
	datab => \ALT_INV_B[2]~input_o\,
	dataf => \ALT_INV_B[1]~input_o\,
	combout => \DisplayB|BCDConversion[4]~0_combout\);

-- Location: IOIBUF_X12_Y0_N18
\B[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(0),
	o => \B[0]~input_o\);

-- Location: MLABCELL_X87_Y8_N42
\DisplayB|DISPLAY|Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayB|DISPLAY|Mux12~0_combout\ = ( \B[1]~input_o\ & ( \B[3]~input_o\ ) ) # ( !\B[1]~input_o\ & ( !\B[2]~input_o\ $ (((!\B[0]~input_o\) # (\B[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001110011001001100111001100101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[3]~input_o\,
	datab => \ALT_INV_B[2]~input_o\,
	datad => \ALT_INV_B[0]~input_o\,
	dataf => \ALT_INV_B[1]~input_o\,
	combout => \DisplayB|DISPLAY|Mux12~0_combout\);

-- Location: MLABCELL_X87_Y8_N33
\DisplayB|DISPLAY|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayB|DISPLAY|Mux11~0_combout\ = ( \B[1]~input_o\ & ( ((\B[2]~input_o\ & !\B[0]~input_o\)) # (\B[3]~input_o\) ) ) # ( !\B[1]~input_o\ & ( (\B[2]~input_o\ & ((\B[0]~input_o\) # (\B[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001100010011000100110001001101110101011101010111010101110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[3]~input_o\,
	datab => \ALT_INV_B[2]~input_o\,
	datac => \ALT_INV_B[0]~input_o\,
	dataf => \ALT_INV_B[1]~input_o\,
	combout => \DisplayB|DISPLAY|Mux11~0_combout\);

-- Location: MLABCELL_X87_Y8_N36
\DisplayB|DISPLAY|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayB|DISPLAY|Mux10~0_combout\ = ( \B[1]~input_o\ & ( ((!\B[2]~input_o\ & !\B[0]~input_o\)) # (\B[3]~input_o\) ) ) # ( !\B[1]~input_o\ & ( (\B[3]~input_o\ & \B[2]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000111011101010101011101110101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[3]~input_o\,
	datab => \ALT_INV_B[2]~input_o\,
	datad => \ALT_INV_B[0]~input_o\,
	dataf => \ALT_INV_B[1]~input_o\,
	combout => \DisplayB|DISPLAY|Mux10~0_combout\);

-- Location: MLABCELL_X87_Y8_N45
\DisplayB|DISPLAY|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayB|DISPLAY|Mux9~0_combout\ = ( \B[1]~input_o\ & ( ((\B[2]~input_o\ & \B[0]~input_o\)) # (\B[3]~input_o\) ) ) # ( !\B[1]~input_o\ & ( (!\B[2]~input_o\ & ((\B[0]~input_o\))) # (\B[2]~input_o\ & ((!\B[0]~input_o\) # (\B[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110100111101001111010011110101010111010101110101011101010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[3]~input_o\,
	datab => \ALT_INV_B[2]~input_o\,
	datac => \ALT_INV_B[0]~input_o\,
	dataf => \ALT_INV_B[1]~input_o\,
	combout => \DisplayB|DISPLAY|Mux9~0_combout\);

-- Location: MLABCELL_X87_Y8_N39
\DisplayB|DISPLAY|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayB|DISPLAY|Mux8~0_combout\ = ( \B[1]~input_o\ & ( (\B[0]~input_o\) # (\B[3]~input_o\) ) ) # ( !\B[1]~input_o\ & ( (\B[0]~input_o\) # (\B[2]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000011111111111101010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[3]~input_o\,
	datac => \ALT_INV_B[2]~input_o\,
	datad => \ALT_INV_B[0]~input_o\,
	dataf => \ALT_INV_B[1]~input_o\,
	combout => \DisplayB|DISPLAY|Mux8~0_combout\);

-- Location: MLABCELL_X87_Y8_N57
\DisplayB|DISPLAY|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayB|DISPLAY|Mux7~0_combout\ = ( \B[1]~input_o\ & ( ((!\B[2]~input_o\) # (\B[0]~input_o\)) # (\B[3]~input_o\) ) ) # ( !\B[1]~input_o\ & ( (!\B[3]~input_o\ & (!\B[2]~input_o\ & \B[0]~input_o\)) # (\B[3]~input_o\ & (\B[2]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001100100011001000110010001100111011111110111111101111111011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[3]~input_o\,
	datab => \ALT_INV_B[2]~input_o\,
	datac => \ALT_INV_B[0]~input_o\,
	dataf => \ALT_INV_B[1]~input_o\,
	combout => \DisplayB|DISPLAY|Mux7~0_combout\);

-- Location: MLABCELL_X87_Y8_N54
\DisplayB|DISPLAY|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayB|DISPLAY|Mux6~0_combout\ = ( \B[1]~input_o\ & ( (!\B[3]~input_o\ & ((!\B[2]~input_o\) # (!\B[0]~input_o\))) ) ) # ( !\B[1]~input_o\ & ( !\B[3]~input_o\ $ (!\B[2]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011010101010100010001010101010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[3]~input_o\,
	datab => \ALT_INV_B[2]~input_o\,
	datad => \ALT_INV_B[0]~input_o\,
	dataf => \ALT_INV_B[1]~input_o\,
	combout => \DisplayB|DISPLAY|Mux6~0_combout\);

-- Location: IOIBUF_X4_Y0_N35
\A[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

-- Location: IOIBUF_X4_Y0_N1
\A[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

-- Location: IOIBUF_X16_Y0_N18
\A[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

-- Location: MLABCELL_X87_Y7_N33
\DisplayA|BCDConversion[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayA|BCDConversion[4]~0_combout\ = ( \A[3]~input_o\ & ( \A[1]~input_o\ ) ) # ( \A[3]~input_o\ & ( !\A[1]~input_o\ & ( \A[2]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_A[2]~input_o\,
	datae => \ALT_INV_A[3]~input_o\,
	dataf => \ALT_INV_A[1]~input_o\,
	combout => \DisplayA|BCDConversion[4]~0_combout\);

-- Location: IOIBUF_X2_Y0_N41
\A[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

-- Location: MLABCELL_X87_Y7_N48
\DisplayA|DISPLAY|Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayA|DISPLAY|Mux12~0_combout\ = ( \A[3]~input_o\ & ( \A[1]~input_o\ ) ) # ( \A[3]~input_o\ & ( !\A[1]~input_o\ & ( \A[2]~input_o\ ) ) ) # ( !\A[3]~input_o\ & ( !\A[1]~input_o\ & ( !\A[0]~input_o\ $ (!\A[2]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111001100000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_A[0]~input_o\,
	datad => \ALT_INV_A[2]~input_o\,
	datae => \ALT_INV_A[3]~input_o\,
	dataf => \ALT_INV_A[1]~input_o\,
	combout => \DisplayA|DISPLAY|Mux12~0_combout\);

-- Location: MLABCELL_X87_Y7_N9
\DisplayA|DISPLAY|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayA|DISPLAY|Mux11~0_combout\ = ( \A[3]~input_o\ & ( \A[1]~input_o\ ) ) # ( !\A[3]~input_o\ & ( \A[1]~input_o\ & ( (\A[2]~input_o\ & !\A[0]~input_o\) ) ) ) # ( \A[3]~input_o\ & ( !\A[1]~input_o\ & ( \A[2]~input_o\ ) ) ) # ( !\A[3]~input_o\ & ( 
-- !\A[1]~input_o\ & ( (\A[2]~input_o\ & \A[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011001100110011001100110000001100001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_A[2]~input_o\,
	datac => \ALT_INV_A[0]~input_o\,
	datae => \ALT_INV_A[3]~input_o\,
	dataf => \ALT_INV_A[1]~input_o\,
	combout => \DisplayA|DISPLAY|Mux11~0_combout\);

-- Location: MLABCELL_X87_Y7_N12
\DisplayA|DISPLAY|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayA|DISPLAY|Mux10~0_combout\ = ( \A[3]~input_o\ & ( \A[1]~input_o\ ) ) # ( !\A[3]~input_o\ & ( \A[1]~input_o\ & ( (!\A[0]~input_o\ & !\A[2]~input_o\) ) ) ) # ( \A[3]~input_o\ & ( !\A[1]~input_o\ & ( \A[2]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111111001100000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_A[0]~input_o\,
	datad => \ALT_INV_A[2]~input_o\,
	datae => \ALT_INV_A[3]~input_o\,
	dataf => \ALT_INV_A[1]~input_o\,
	combout => \DisplayA|DISPLAY|Mux10~0_combout\);

-- Location: MLABCELL_X87_Y7_N18
\DisplayA|DISPLAY|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayA|DISPLAY|Mux9~0_combout\ = ( \A[1]~input_o\ & ( ((\A[0]~input_o\ & \A[2]~input_o\)) # (\A[3]~input_o\) ) ) # ( !\A[1]~input_o\ & ( (!\A[0]~input_o\ & ((\A[2]~input_o\))) # (\A[0]~input_o\ & ((!\A[2]~input_o\) # (\A[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111011101001100111101110101010101011101110101010101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[3]~input_o\,
	datab => \ALT_INV_A[0]~input_o\,
	datad => \ALT_INV_A[2]~input_o\,
	dataf => \ALT_INV_A[1]~input_o\,
	combout => \DisplayA|DISPLAY|Mux9~0_combout\);

-- Location: MLABCELL_X87_Y7_N21
\DisplayA|DISPLAY|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayA|DISPLAY|Mux8~0_combout\ = ( \A[1]~input_o\ & ( (\A[0]~input_o\) # (\A[3]~input_o\) ) ) # ( !\A[1]~input_o\ & ( (\A[2]~input_o\) # (\A[0]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111001111110011111101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[3]~input_o\,
	datab => \ALT_INV_A[0]~input_o\,
	datac => \ALT_INV_A[2]~input_o\,
	dataf => \ALT_INV_A[1]~input_o\,
	combout => \DisplayA|DISPLAY|Mux8~0_combout\);

-- Location: MLABCELL_X87_Y7_N45
\DisplayA|DISPLAY|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayA|DISPLAY|Mux7~0_combout\ = ( \A[1]~input_o\ & ( ((!\A[2]~input_o\) # (\A[0]~input_o\)) # (\A[3]~input_o\) ) ) # ( !\A[1]~input_o\ & ( (!\A[3]~input_o\ & (\A[0]~input_o\ & !\A[2]~input_o\)) # (\A[3]~input_o\ & ((\A[2]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101001010101000010100101010111111111010111111111111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[3]~input_o\,
	datac => \ALT_INV_A[0]~input_o\,
	datad => \ALT_INV_A[2]~input_o\,
	dataf => \ALT_INV_A[1]~input_o\,
	combout => \DisplayA|DISPLAY|Mux7~0_combout\);

-- Location: MLABCELL_X87_Y7_N42
\DisplayA|DISPLAY|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayA|DISPLAY|Mux6~0_combout\ = ( \A[1]~input_o\ & ( (!\A[3]~input_o\ & ((!\A[0]~input_o\) # (!\A[2]~input_o\))) ) ) # ( !\A[1]~input_o\ & ( !\A[3]~input_o\ $ (!\A[2]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010110101010010101011010101010101010100010001010101010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[3]~input_o\,
	datab => \ALT_INV_A[0]~input_o\,
	datad => \ALT_INV_A[2]~input_o\,
	dataf => \ALT_INV_A[1]~input_o\,
	combout => \DisplayA|DISPLAY|Mux6~0_combout\);

-- Location: IOIBUF_X4_Y0_N18
\Cin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Cin,
	o => \Cin~input_o\);

-- Location: MLABCELL_X87_Y8_N3
\Addition|FullAdder1|Sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Addition|FullAdder1|Sum~0_combout\ = ( \A[1]~input_o\ & ( !\B[1]~input_o\ $ (((!\A[0]~input_o\ & (\B[0]~input_o\ & \Cin~input_o\)) # (\A[0]~input_o\ & ((\Cin~input_o\) # (\B[0]~input_o\))))) ) ) # ( !\A[1]~input_o\ & ( !\B[1]~input_o\ $ 
-- (((!\A[0]~input_o\ & ((!\B[0]~input_o\) # (!\Cin~input_o\))) # (\A[0]~input_o\ & (!\B[0]~input_o\ & !\Cin~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011111101000000101111110100011101000000101111110100000010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[0]~input_o\,
	datab => \ALT_INV_B[0]~input_o\,
	datac => \ALT_INV_Cin~input_o\,
	datad => \ALT_INV_B[1]~input_o\,
	dataf => \ALT_INV_A[1]~input_o\,
	combout => \Addition|FullAdder1|Sum~0_combout\);

-- Location: MLABCELL_X87_Y8_N48
\Addition|FullAdder1|Cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Addition|FullAdder1|Cout~0_combout\ = ( \A[1]~input_o\ & ( ((!\A[0]~input_o\ & (\Cin~input_o\ & \B[0]~input_o\)) # (\A[0]~input_o\ & ((\B[0]~input_o\) # (\Cin~input_o\)))) # (\B[1]~input_o\) ) ) # ( !\A[1]~input_o\ & ( (\B[1]~input_o\ & ((!\A[0]~input_o\ 
-- & (\Cin~input_o\ & \B[0]~input_o\)) # (\A[0]~input_o\ & ((\B[0]~input_o\) # (\Cin~input_o\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000111000000010000011100011111011111110001111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[0]~input_o\,
	datab => \ALT_INV_Cin~input_o\,
	datac => \ALT_INV_B[1]~input_o\,
	datad => \ALT_INV_B[0]~input_o\,
	dataf => \ALT_INV_A[1]~input_o\,
	combout => \Addition|FullAdder1|Cout~0_combout\);

-- Location: MLABCELL_X87_Y8_N24
\Addition|FULLAdder3|Cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Addition|FULLAdder3|Cout~0_combout\ = ( \Addition|FullAdder1|Cout~0_combout\ & ( (!\B[3]~input_o\ & (\A[3]~input_o\ & ((\A[2]~input_o\) # (\B[2]~input_o\)))) # (\B[3]~input_o\ & (((\A[3]~input_o\) # (\A[2]~input_o\)) # (\B[2]~input_o\))) ) ) # ( 
-- !\Addition|FullAdder1|Cout~0_combout\ & ( (!\B[3]~input_o\ & (\B[2]~input_o\ & (\A[2]~input_o\ & \A[3]~input_o\))) # (\B[3]~input_o\ & (((\B[2]~input_o\ & \A[2]~input_o\)) # (\A[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101010111000000010101011100010101011111110001010101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[3]~input_o\,
	datab => \ALT_INV_B[2]~input_o\,
	datac => \ALT_INV_A[2]~input_o\,
	datad => \ALT_INV_A[3]~input_o\,
	dataf => \Addition|FullAdder1|ALT_INV_Cout~0_combout\,
	combout => \Addition|FULLAdder3|Cout~0_combout\);

-- Location: MLABCELL_X87_Y8_N27
\Addition|FULLAdder3|Sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Addition|FULLAdder3|Sum~0_combout\ = ( \Addition|FullAdder1|Cout~0_combout\ & ( !\B[3]~input_o\ $ (!\A[3]~input_o\ $ (((\A[2]~input_o\) # (\B[2]~input_o\)))) ) ) # ( !\Addition|FullAdder1|Cout~0_combout\ & ( !\B[3]~input_o\ $ (!\A[3]~input_o\ $ 
-- (((\B[2]~input_o\ & \A[2]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001101001010110100110100101101001101001010110100110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[3]~input_o\,
	datab => \ALT_INV_B[2]~input_o\,
	datac => \ALT_INV_A[3]~input_o\,
	datad => \ALT_INV_A[2]~input_o\,
	dataf => \Addition|FullAdder1|ALT_INV_Cout~0_combout\,
	combout => \Addition|FULLAdder3|Sum~0_combout\);

-- Location: LABCELL_X81_Y8_N3
\Addition|FullAdder2|Sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Addition|FullAdder2|Sum~0_combout\ = ( \A[2]~input_o\ & ( \Addition|FullAdder1|Cout~0_combout\ & ( \B[2]~input_o\ ) ) ) # ( !\A[2]~input_o\ & ( \Addition|FullAdder1|Cout~0_combout\ & ( !\B[2]~input_o\ ) ) ) # ( \A[2]~input_o\ & ( 
-- !\Addition|FullAdder1|Cout~0_combout\ & ( !\B[2]~input_o\ ) ) ) # ( !\A[2]~input_o\ & ( !\Addition|FullAdder1|Cout~0_combout\ & ( \B[2]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111100001111000011110000111100000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_B[2]~input_o\,
	datae => \ALT_INV_A[2]~input_o\,
	dataf => \Addition|FullAdder1|ALT_INV_Cout~0_combout\,
	combout => \Addition|FullAdder2|Sum~0_combout\);

-- Location: LABCELL_X88_Y8_N33
\DisplaySum|DISPLAY|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|DISPLAY|Mux5~0_combout\ = ( \Addition|FullAdder2|Sum~0_combout\ & ( (\Addition|FULLAdder3|Sum~0_combout\) # (\Addition|FULLAdder3|Cout~0_combout\) ) ) # ( !\Addition|FullAdder2|Sum~0_combout\ & ( ((\Addition|FullAdder1|Sum~0_combout\ & 
-- \Addition|FULLAdder3|Sum~0_combout\)) # (\Addition|FULLAdder3|Cout~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011111000011111111111100001111010111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Addition|FullAdder1|ALT_INV_Sum~0_combout\,
	datac => \Addition|FULLAdder3|ALT_INV_Cout~0_combout\,
	datad => \Addition|FULLAdder3|ALT_INV_Sum~0_combout\,
	datae => \Addition|FullAdder2|ALT_INV_Sum~0_combout\,
	combout => \DisplaySum|DISPLAY|Mux5~0_combout\);

-- Location: LABCELL_X88_Y8_N48
\DisplaySum|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|Mux3~0_combout\ = ( \Addition|FullAdder2|Sum~0_combout\ & ( (!\Addition|FULLAdder3|Cout~0_combout\ & (!\Addition|FULLAdder3|Sum~0_combout\ $ (\Addition|FullAdder1|Sum~0_combout\))) ) ) # ( !\Addition|FullAdder2|Sum~0_combout\ & ( 
-- !\Addition|FULLAdder3|Cout~0_combout\ $ (((!\Addition|FULLAdder3|Sum~0_combout\ & \Addition|FullAdder1|Sum~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100011011000110100001001000010011000110110001101000010010000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Addition|FULLAdder3|ALT_INV_Sum~0_combout\,
	datab => \Addition|FULLAdder3|ALT_INV_Cout~0_combout\,
	datac => \Addition|FullAdder1|ALT_INV_Sum~0_combout\,
	datae => \Addition|FullAdder2|ALT_INV_Sum~0_combout\,
	combout => \DisplaySum|Mux3~0_combout\);

-- Location: LABCELL_X88_Y8_N45
\DisplaySum|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|Mux2~0_combout\ = ( \Addition|FullAdder2|Sum~0_combout\ & ( (!\Addition|FULLAdder3|Cout~0_combout\ & ((!\Addition|FULLAdder3|Sum~0_combout\) # (\Addition|FullAdder1|Sum~0_combout\))) ) ) # ( !\Addition|FullAdder2|Sum~0_combout\ & ( 
-- (!\Addition|FullAdder1|Sum~0_combout\ & (\Addition|FULLAdder3|Cout~0_combout\ & !\Addition|FULLAdder3|Sum~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000111100000101000000001010000000001111000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Addition|FullAdder1|ALT_INV_Sum~0_combout\,
	datac => \Addition|FULLAdder3|ALT_INV_Cout~0_combout\,
	datad => \Addition|FULLAdder3|ALT_INV_Sum~0_combout\,
	datae => \Addition|FullAdder2|ALT_INV_Sum~0_combout\,
	combout => \DisplaySum|Mux2~0_combout\);

-- Location: LABCELL_X88_Y8_N6
\DisplaySum|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|Mux1~0_combout\ = ( \Addition|FullAdder2|Sum~0_combout\ & ( \Addition|FULLAdder3|Cout~0_combout\ ) ) # ( !\Addition|FullAdder2|Sum~0_combout\ & ( (!\Addition|FullAdder1|Sum~0_combout\ & (\Addition|FULLAdder3|Sum~0_combout\)) # 
-- (\Addition|FullAdder1|Sum~0_combout\ & ((\Addition|FULLAdder3|Cout~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101001101010011001100110011001101010011010100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Addition|FULLAdder3|ALT_INV_Sum~0_combout\,
	datab => \Addition|FULLAdder3|ALT_INV_Cout~0_combout\,
	datac => \Addition|FullAdder1|ALT_INV_Sum~0_combout\,
	datae => \Addition|FullAdder2|ALT_INV_Sum~0_combout\,
	combout => \DisplaySum|Mux1~0_combout\);

-- Location: LABCELL_X88_Y8_N54
\DisplaySum|DISPLAY|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|DISPLAY|Mux4~0_combout\ = ( \DisplaySum|Mux1~0_combout\ & ( (\DisplaySum|Mux3~0_combout\ & !\DisplaySum|Mux2~0_combout\) ) ) # ( !\DisplaySum|Mux1~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111101000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DisplaySum|ALT_INV_Mux3~0_combout\,
	datab => \DisplaySum|ALT_INV_Mux2~0_combout\,
	dataf => \DisplaySum|ALT_INV_Mux1~0_combout\,
	combout => \DisplaySum|DISPLAY|Mux4~0_combout\);

-- Location: MLABCELL_X87_Y8_N51
\Addition|FullAdder0|Sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Addition|FullAdder0|Sum~0_combout\ = !\A[0]~input_o\ $ (!\Cin~input_o\ $ (\B[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[0]~input_o\,
	datab => \ALT_INV_Cin~input_o\,
	datac => \ALT_INV_B[0]~input_o\,
	combout => \Addition|FullAdder0|Sum~0_combout\);

-- Location: LABCELL_X88_Y8_N3
\DisplaySum|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|Mux4~0_combout\ = ( \Addition|FullAdder2|Sum~0_combout\ & ( (\Addition|FullAdder0|Sum~0_combout\ & !\Addition|FULLAdder3|Cout~0_combout\) ) ) # ( !\Addition|FullAdder2|Sum~0_combout\ & ( (\Addition|FullAdder0|Sum~0_combout\ & 
-- ((!\Addition|FULLAdder3|Cout~0_combout\) # (!\Addition|FULLAdder3|Sum~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010000010100000101000001010101010100000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Addition|FullAdder0|ALT_INV_Sum~0_combout\,
	datac => \Addition|FULLAdder3|ALT_INV_Cout~0_combout\,
	datad => \Addition|FULLAdder3|ALT_INV_Sum~0_combout\,
	datae => \Addition|FullAdder2|ALT_INV_Sum~0_combout\,
	combout => \DisplaySum|Mux4~0_combout\);

-- Location: LABCELL_X88_Y8_N57
\DisplaySum|DISPLAY|Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|DISPLAY|Mux12~0_combout\ = ( \DisplaySum|Mux1~0_combout\ & ( (!\DisplaySum|Mux3~0_combout\) # (\DisplaySum|Mux2~0_combout\) ) ) # ( !\DisplaySum|Mux1~0_combout\ & ( (\DisplaySum|Mux3~0_combout\ & (!\DisplaySum|Mux2~0_combout\ $ 
-- (!\DisplaySum|Mux4~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000101000100000100010100010010111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DisplaySum|ALT_INV_Mux3~0_combout\,
	datab => \DisplaySum|ALT_INV_Mux2~0_combout\,
	datad => \DisplaySum|ALT_INV_Mux4~0_combout\,
	dataf => \DisplaySum|ALT_INV_Mux1~0_combout\,
	combout => \DisplaySum|DISPLAY|Mux12~0_combout\);

-- Location: LABCELL_X88_Y8_N36
\DisplaySum|DISPLAY|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|DISPLAY|Mux11~0_combout\ = ( \DisplaySum|Mux1~0_combout\ & ( (!\DisplaySum|Mux3~0_combout\) # (\DisplaySum|Mux2~0_combout\) ) ) # ( !\DisplaySum|Mux1~0_combout\ & ( (\DisplaySum|Mux2~0_combout\ & (!\DisplaySum|Mux3~0_combout\ $ 
-- (\DisplaySum|Mux4~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000100100001001000010010000110111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DisplaySum|ALT_INV_Mux3~0_combout\,
	datab => \DisplaySum|ALT_INV_Mux2~0_combout\,
	datac => \DisplaySum|ALT_INV_Mux4~0_combout\,
	dataf => \DisplaySum|ALT_INV_Mux1~0_combout\,
	combout => \DisplaySum|DISPLAY|Mux11~0_combout\);

-- Location: LABCELL_X88_Y8_N39
\DisplaySum|DISPLAY|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|DISPLAY|Mux10~0_combout\ = ( \DisplaySum|Mux1~0_combout\ & ( (!\DisplaySum|Mux3~0_combout\) # (\DisplaySum|Mux2~0_combout\) ) ) # ( !\DisplaySum|Mux1~0_combout\ & ( (!\DisplaySum|Mux3~0_combout\ & (!\DisplaySum|Mux2~0_combout\ & 
-- !\DisplaySum|Mux4~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100000000000100010000000000010111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DisplaySum|ALT_INV_Mux3~0_combout\,
	datab => \DisplaySum|ALT_INV_Mux2~0_combout\,
	datad => \DisplaySum|ALT_INV_Mux4~0_combout\,
	dataf => \DisplaySum|ALT_INV_Mux1~0_combout\,
	combout => \DisplaySum|DISPLAY|Mux10~0_combout\);

-- Location: LABCELL_X88_Y8_N12
\DisplaySum|DISPLAY|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|DISPLAY|Mux9~0_combout\ = ( \DisplaySum|Mux1~0_combout\ & ( (!\DisplaySum|Mux3~0_combout\) # ((\DisplaySum|Mux4~0_combout\) # (\DisplaySum|Mux2~0_combout\)) ) ) # ( !\DisplaySum|Mux1~0_combout\ & ( (!\DisplaySum|Mux3~0_combout\ & 
-- (\DisplaySum|Mux2~0_combout\ & \DisplaySum|Mux4~0_combout\)) # (\DisplaySum|Mux3~0_combout\ & (!\DisplaySum|Mux2~0_combout\ $ (!\DisplaySum|Mux4~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011000010110000101100001011010111111101111111011111110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DisplaySum|ALT_INV_Mux3~0_combout\,
	datab => \DisplaySum|ALT_INV_Mux2~0_combout\,
	datac => \DisplaySum|ALT_INV_Mux4~0_combout\,
	dataf => \DisplaySum|ALT_INV_Mux1~0_combout\,
	combout => \DisplaySum|DISPLAY|Mux9~0_combout\);

-- Location: LABCELL_X88_Y8_N15
\DisplaySum|DISPLAY|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|DISPLAY|Mux8~0_combout\ = ( \DisplaySum|Mux1~0_combout\ & ( (!\DisplaySum|Mux3~0_combout\) # ((\DisplaySum|Mux4~0_combout\) # (\DisplaySum|Mux2~0_combout\)) ) ) # ( !\DisplaySum|Mux1~0_combout\ & ( ((\DisplaySum|Mux3~0_combout\ & 
-- \DisplaySum|Mux2~0_combout\)) # (\DisplaySum|Mux4~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111111111000100011111111110111011111111111011101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DisplaySum|ALT_INV_Mux3~0_combout\,
	datab => \DisplaySum|ALT_INV_Mux2~0_combout\,
	datad => \DisplaySum|ALT_INV_Mux4~0_combout\,
	dataf => \DisplaySum|ALT_INV_Mux1~0_combout\,
	combout => \DisplaySum|DISPLAY|Mux8~0_combout\);

-- Location: LABCELL_X88_Y8_N18
\DisplaySum|DISPLAY|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|DISPLAY|Mux7~0_combout\ = ( \DisplaySum|Mux1~0_combout\ & ( (!\DisplaySum|Mux3~0_combout\) # (\DisplaySum|Mux2~0_combout\) ) ) # ( !\DisplaySum|Mux1~0_combout\ & ( (!\DisplaySum|Mux3~0_combout\ & ((!\DisplaySum|Mux2~0_combout\) # 
-- (\DisplaySum|Mux4~0_combout\))) # (\DisplaySum|Mux3~0_combout\ & (!\DisplaySum|Mux2~0_combout\ & \DisplaySum|Mux4~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000111010001110100011101000111010111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DisplaySum|ALT_INV_Mux3~0_combout\,
	datab => \DisplaySum|ALT_INV_Mux2~0_combout\,
	datac => \DisplaySum|ALT_INV_Mux4~0_combout\,
	dataf => \DisplaySum|ALT_INV_Mux1~0_combout\,
	combout => \DisplaySum|DISPLAY|Mux7~0_combout\);

-- Location: LABCELL_X88_Y8_N21
\DisplaySum|DISPLAY|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|DISPLAY|Mux6~0_combout\ = ( \DisplaySum|Mux1~0_combout\ & ( (\DisplaySum|Mux3~0_combout\ & !\DisplaySum|Mux2~0_combout\) ) ) # ( !\DisplaySum|Mux1~0_combout\ & ( (!\DisplaySum|Mux3~0_combout\ & ((!\DisplaySum|Mux2~0_combout\) # 
-- (!\DisplaySum|Mux4~0_combout\))) # (\DisplaySum|Mux3~0_combout\ & (\DisplaySum|Mux2~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101110011001101110111001100101000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DisplaySum|ALT_INV_Mux3~0_combout\,
	datab => \DisplaySum|ALT_INV_Mux2~0_combout\,
	datad => \DisplaySum|ALT_INV_Mux4~0_combout\,
	dataf => \DisplaySum|ALT_INV_Mux1~0_combout\,
	combout => \DisplaySum|DISPLAY|Mux6~0_combout\);

-- Location: IOIBUF_X2_Y0_N58
\triggerSwitch~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_triggerSwitch,
	o => \triggerSwitch~input_o\);

-- Location: MLABCELL_X87_Y8_N0
\finalResult~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~0_combout\ = ( \Addition|FullAdder0|Sum~0_combout\ & ( (\triggerSwitch~input_o\) # (\B[0]~input_o\) ) ) # ( !\Addition|FullAdder0|Sum~0_combout\ & ( (\B[0]~input_o\ & !\triggerSwitch~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_B[0]~input_o\,
	datac => \ALT_INV_triggerSwitch~input_o\,
	dataf => \Addition|FullAdder0|ALT_INV_Sum~0_combout\,
	combout => \finalResult~0_combout\);

-- Location: MLABCELL_X84_Y8_N30
\finalResult~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~1_combout\ = ( \Addition|FullAdder1|Sum~0_combout\ & ( (\B[1]~input_o\) # (\triggerSwitch~input_o\) ) ) # ( !\Addition|FullAdder1|Sum~0_combout\ & ( (!\triggerSwitch~input_o\ & \B[1]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_triggerSwitch~input_o\,
	datac => \ALT_INV_B[1]~input_o\,
	dataf => \Addition|FullAdder1|ALT_INV_Sum~0_combout\,
	combout => \finalResult~1_combout\);

-- Location: MLABCELL_X87_Y7_N57
\finalResult~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~2_combout\ = ( \B[2]~input_o\ & ( (!\triggerSwitch~input_o\) # (!\A[2]~input_o\ $ (\Addition|FullAdder1|Cout~0_combout\)) ) ) # ( !\B[2]~input_o\ & ( (\triggerSwitch~input_o\ & (!\A[2]~input_o\ $ (!\Addition|FullAdder1|Cout~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010101010000000001010101000011111010101011111111101010101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_triggerSwitch~input_o\,
	datac => \ALT_INV_A[2]~input_o\,
	datad => \Addition|FullAdder1|ALT_INV_Cout~0_combout\,
	dataf => \ALT_INV_B[2]~input_o\,
	combout => \finalResult~2_combout\);

-- Location: MLABCELL_X87_Y8_N6
\finalResult~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~3_combout\ = ( \triggerSwitch~input_o\ & ( \Addition|FullAdder1|Cout~0_combout\ & ( !\B[3]~input_o\ $ (!\A[3]~input_o\ $ (((\B[2]~input_o\) # (\A[2]~input_o\)))) ) ) ) # ( !\triggerSwitch~input_o\ & ( \Addition|FullAdder1|Cout~0_combout\ & ( 
-- \B[3]~input_o\ ) ) ) # ( \triggerSwitch~input_o\ & ( !\Addition|FullAdder1|Cout~0_combout\ & ( !\B[3]~input_o\ $ (!\A[3]~input_o\ $ (((\A[2]~input_o\ & \B[2]~input_o\)))) ) ) ) # ( !\triggerSwitch~input_o\ & ( !\Addition|FullAdder1|Cout~0_combout\ & ( 
-- \B[3]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101011001100110100101010101010101010110100110011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[3]~input_o\,
	datab => \ALT_INV_A[3]~input_o\,
	datac => \ALT_INV_A[2]~input_o\,
	datad => \ALT_INV_B[2]~input_o\,
	datae => \ALT_INV_triggerSwitch~input_o\,
	dataf => \Addition|FullAdder1|ALT_INV_Cout~0_combout\,
	combout => \finalResult~3_combout\);

-- Location: MLABCELL_X87_Y7_N0
\finalResult~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~4_combout\ = ( \Addition|FULLAdder3|Cout~0_combout\ & ( (\A[0]~input_o\) # (\triggerSwitch~input_o\) ) ) # ( !\Addition|FULLAdder3|Cout~0_combout\ & ( (!\triggerSwitch~input_o\ & \A[0]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001001110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_triggerSwitch~input_o\,
	datab => \ALT_INV_A[0]~input_o\,
	dataf => \Addition|FULLAdder3|ALT_INV_Cout~0_combout\,
	combout => \finalResult~4_combout\);

-- Location: MLABCELL_X87_Y7_N54
\finalResult~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~5_combout\ = ( \A[1]~input_o\ & ( !\triggerSwitch~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_triggerSwitch~input_o\,
	dataf => \ALT_INV_A[1]~input_o\,
	combout => \finalResult~5_combout\);

-- Location: MLABCELL_X87_Y7_N3
\finalResult~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~6_combout\ = (!\triggerSwitch~input_o\ & \A[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101000001010000010100000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_triggerSwitch~input_o\,
	datac => \ALT_INV_A[2]~input_o\,
	combout => \finalResult~6_combout\);

-- Location: MLABCELL_X87_Y7_N36
\finalResult~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~7_combout\ = (!\triggerSwitch~input_o\ & \A[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101000001010000010100000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_triggerSwitch~input_o\,
	datac => \ALT_INV_A[3]~input_o\,
	combout => \finalResult~7_combout\);

-- Location: MLABCELL_X87_Y7_N39
\finalResult~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \finalResult~8_combout\ = ( \Cin~input_o\ & ( !\triggerSwitch~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_triggerSwitch~input_o\,
	dataf => \ALT_INV_Cin~input_o\,
	combout => \finalResult~8_combout\);

-- Location: MLABCELL_X87_Y8_N12
\process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = ( \A[2]~input_o\ & ( \A[1]~input_o\ & ( (!\A[3]~input_o\ & ((!\B[3]~input_o\) # ((!\B[1]~input_o\ & !\B[2]~input_o\)))) ) ) ) # ( !\A[2]~input_o\ & ( \A[1]~input_o\ & ( (!\A[3]~input_o\ & ((!\B[3]~input_o\) # ((!\B[1]~input_o\ & 
-- !\B[2]~input_o\)))) ) ) ) # ( \A[2]~input_o\ & ( !\A[1]~input_o\ & ( (!\A[3]~input_o\ & ((!\B[3]~input_o\) # ((!\B[1]~input_o\ & !\B[2]~input_o\)))) ) ) ) # ( !\A[2]~input_o\ & ( !\A[1]~input_o\ & ( (!\B[3]~input_o\) # ((!\B[1]~input_o\ & 
-- !\B[2]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101011110000110010001100000011001000110000001100100011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[1]~input_o\,
	datab => \ALT_INV_A[3]~input_o\,
	datac => \ALT_INV_B[3]~input_o\,
	datad => \ALT_INV_B[2]~input_o\,
	datae => \ALT_INV_A[2]~input_o\,
	dataf => \ALT_INV_A[1]~input_o\,
	combout => \process_0~0_combout\);

-- Location: MLABCELL_X87_Y8_N18
\process_0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \process_0~1_combout\ = ( \A[2]~input_o\ & ( \process_0~0_combout\ & ( (!\A[3]~input_o\ & (\Addition|FullAdder1|Cout~0_combout\ & (\B[3]~input_o\ & \B[2]~input_o\))) # (\A[3]~input_o\ & (((\Addition|FullAdder1|Cout~0_combout\ & \B[2]~input_o\)) # 
-- (\B[3]~input_o\))) ) ) ) # ( !\A[2]~input_o\ & ( \process_0~0_combout\ & ( (\A[3]~input_o\ & (\B[3]~input_o\ & ((\B[2]~input_o\) # (\Addition|FullAdder1|Cout~0_combout\)))) ) ) ) # ( \A[2]~input_o\ & ( !\process_0~0_combout\ ) ) # ( !\A[2]~input_o\ & ( 
-- !\process_0~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000001000000110000001100010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Addition|FullAdder1|ALT_INV_Cout~0_combout\,
	datab => \ALT_INV_A[3]~input_o\,
	datac => \ALT_INV_B[3]~input_o\,
	datad => \ALT_INV_B[2]~input_o\,
	datae => \ALT_INV_A[2]~input_o\,
	dataf => \ALT_INV_process_0~0_combout\,
	combout => \process_0~1_combout\);

-- Location: LABCELL_X33_Y41_N0
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


