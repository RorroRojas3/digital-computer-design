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

-- DATE "09/18/2017 13:32:50"

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

ENTITY 	PartThree IS
    PORT (
	SW : IN std_logic_vector(9 DOWNTO 0);
	HEX5 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX4 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX3 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX2 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX1 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX0 : BUFFER std_logic_vector(6 DOWNTO 0);
	SWLEDS : BUFFER std_logic_vector(9 DOWNTO 0)
	);
END PartThree;

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
-- SW[7]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF PartThree IS
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
SIGNAL ww_HEX5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_SWLEDS : std_logic_vector(9 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \DisplayB|BCDConversion[4]~0_combout\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \DisplayB|DISPLAY|Mux12~0_combout\ : std_logic;
SIGNAL \DisplayB|DISPLAY|Mux11~0_combout\ : std_logic;
SIGNAL \DisplayB|DISPLAY|Mux10~0_combout\ : std_logic;
SIGNAL \DisplayB|DISPLAY|Mux9~0_combout\ : std_logic;
SIGNAL \DisplayB|DISPLAY|Mux8~0_combout\ : std_logic;
SIGNAL \DisplayB|DISPLAY|Mux7~0_combout\ : std_logic;
SIGNAL \DisplayB|DISPLAY|Mux6~0_combout\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \DisplayA|BCDConversion[4]~0_combout\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \DisplayA|DISPLAY|Mux12~0_combout\ : std_logic;
SIGNAL \DisplayA|DISPLAY|Mux11~0_combout\ : std_logic;
SIGNAL \DisplayA|DISPLAY|Mux10~0_combout\ : std_logic;
SIGNAL \DisplayA|DISPLAY|Mux9~0_combout\ : std_logic;
SIGNAL \DisplayA|DISPLAY|Mux8~0_combout\ : std_logic;
SIGNAL \DisplayA|DISPLAY|Mux7~0_combout\ : std_logic;
SIGNAL \DisplayA|DISPLAY|Mux6~0_combout\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \Addition|FullAdder1|Cout~0_combout\ : std_logic;
SIGNAL \Addition|FULLAdder3|Cout~0_combout\ : std_logic;
SIGNAL \Addition|FullAdder1|Sum~0_combout\ : std_logic;
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
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \SWLEDS~0_combout\ : std_logic;
SIGNAL \SWLEDS~1_combout\ : std_logic;
SIGNAL \SWLEDS~2_combout\ : std_logic;
SIGNAL \SWLEDS~3_combout\ : std_logic;
SIGNAL \SWLEDS~4_combout\ : std_logic;
SIGNAL \SWLEDS~5_combout\ : std_logic;
SIGNAL \SWLEDS~6_combout\ : std_logic;
SIGNAL \SWLEDS~7_combout\ : std_logic;
SIGNAL \SWLEDS~8_combout\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \process_0~1_combout\ : std_logic;
SIGNAL \ALT_INV_SW[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[7]~input_o\ : std_logic;
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
SIGNAL \DisplayA|ALT_INV_BCDConversion[4]~0_combout\ : std_logic;

BEGIN

ww_SW <= SW;
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
\ALT_INV_SW[9]~input_o\ <= NOT \SW[9]~input_o\;
\ALT_INV_SW[8]~input_o\ <= NOT \SW[8]~input_o\;
\ALT_INV_SW[0]~input_o\ <= NOT \SW[0]~input_o\;
\ALT_INV_SW[2]~input_o\ <= NOT \SW[2]~input_o\;
\ALT_INV_SW[1]~input_o\ <= NOT \SW[1]~input_o\;
\ALT_INV_SW[3]~input_o\ <= NOT \SW[3]~input_o\;
\ALT_INV_SW[4]~input_o\ <= NOT \SW[4]~input_o\;
\ALT_INV_SW[6]~input_o\ <= NOT \SW[6]~input_o\;
\ALT_INV_SW[5]~input_o\ <= NOT \SW[5]~input_o\;
\ALT_INV_SW[7]~input_o\ <= NOT \SW[7]~input_o\;
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
\DisplayA|ALT_INV_BCDConversion[4]~0_combout\ <= NOT \DisplayA|BCDConversion[4]~0_combout\;

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
	i => \SWLEDS~0_combout\,
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
	i => \SWLEDS~1_combout\,
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
	i => \SWLEDS~2_combout\,
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
	i => \SWLEDS~3_combout\,
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
	i => \SWLEDS~4_combout\,
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
	i => \SWLEDS~5_combout\,
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
	i => \SWLEDS~6_combout\,
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
	i => \SWLEDS~7_combout\,
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
	i => \SWLEDS~8_combout\,
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

-- Location: LABCELL_X83_Y8_N30
\DisplayB|BCDConversion[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayB|BCDConversion[4]~0_combout\ = ( \SW[5]~input_o\ & ( \SW[7]~input_o\ ) ) # ( !\SW[5]~input_o\ & ( (\SW[7]~input_o\ & \SW[6]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[7]~input_o\,
	datab => \ALT_INV_SW[6]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \DisplayB|BCDConversion[4]~0_combout\);

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

-- Location: LABCELL_X83_Y8_N48
\DisplayB|DISPLAY|Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayB|DISPLAY|Mux12~0_combout\ = ( \SW[5]~input_o\ & ( \SW[7]~input_o\ ) ) # ( !\SW[5]~input_o\ & ( !\SW[6]~input_o\ $ (((!\SW[4]~input_o\) # (\SW[7]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001110011001001100111001100101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[7]~input_o\,
	datab => \ALT_INV_SW[6]~input_o\,
	datad => \ALT_INV_SW[4]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \DisplayB|DISPLAY|Mux12~0_combout\);

-- Location: LABCELL_X83_Y8_N33
\DisplayB|DISPLAY|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayB|DISPLAY|Mux11~0_combout\ = ( \SW[5]~input_o\ & ( ((\SW[6]~input_o\ & !\SW[4]~input_o\)) # (\SW[7]~input_o\) ) ) # ( !\SW[5]~input_o\ & ( (\SW[6]~input_o\ & ((\SW[4]~input_o\) # (\SW[7]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001100010011000100110001001101110101011101010111010101110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[7]~input_o\,
	datab => \ALT_INV_SW[6]~input_o\,
	datac => \ALT_INV_SW[4]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \DisplayB|DISPLAY|Mux11~0_combout\);

-- Location: LABCELL_X83_Y8_N36
\DisplayB|DISPLAY|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayB|DISPLAY|Mux10~0_combout\ = ( \SW[5]~input_o\ & ( ((!\SW[6]~input_o\ & !\SW[4]~input_o\)) # (\SW[7]~input_o\) ) ) # ( !\SW[5]~input_o\ & ( (\SW[7]~input_o\ & \SW[6]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000111011101010101011101110101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[7]~input_o\,
	datab => \ALT_INV_SW[6]~input_o\,
	datad => \ALT_INV_SW[4]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \DisplayB|DISPLAY|Mux10~0_combout\);

-- Location: LABCELL_X83_Y8_N12
\DisplayB|DISPLAY|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayB|DISPLAY|Mux9~0_combout\ = ( \SW[5]~input_o\ & ( ((\SW[6]~input_o\ & \SW[4]~input_o\)) # (\SW[7]~input_o\) ) ) # ( !\SW[5]~input_o\ & ( (!\SW[6]~input_o\ & ((\SW[4]~input_o\))) # (\SW[6]~input_o\ & ((!\SW[4]~input_o\) # (\SW[7]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111011101001100111101110101010101011101110101010101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[7]~input_o\,
	datab => \ALT_INV_SW[6]~input_o\,
	datad => \ALT_INV_SW[4]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \DisplayB|DISPLAY|Mux9~0_combout\);

-- Location: LABCELL_X83_Y8_N39
\DisplayB|DISPLAY|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayB|DISPLAY|Mux8~0_combout\ = ( \SW[5]~input_o\ & ( (\SW[4]~input_o\) # (\SW[7]~input_o\) ) ) # ( !\SW[5]~input_o\ & ( (\SW[4]~input_o\) # (\SW[6]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000011111111111101010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[7]~input_o\,
	datac => \ALT_INV_SW[6]~input_o\,
	datad => \ALT_INV_SW[4]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \DisplayB|DISPLAY|Mux8~0_combout\);

-- Location: LABCELL_X83_Y8_N57
\DisplayB|DISPLAY|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayB|DISPLAY|Mux7~0_combout\ = ( \SW[5]~input_o\ & ( ((!\SW[6]~input_o\) # (\SW[4]~input_o\)) # (\SW[7]~input_o\) ) ) # ( !\SW[5]~input_o\ & ( (!\SW[7]~input_o\ & (!\SW[6]~input_o\ & \SW[4]~input_o\)) # (\SW[7]~input_o\ & (\SW[6]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001100100011001000110010001100111011111110111111101111111011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[7]~input_o\,
	datab => \ALT_INV_SW[6]~input_o\,
	datac => \ALT_INV_SW[4]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \DisplayB|DISPLAY|Mux7~0_combout\);

-- Location: LABCELL_X83_Y8_N54
\DisplayB|DISPLAY|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayB|DISPLAY|Mux6~0_combout\ = ( \SW[5]~input_o\ & ( (!\SW[7]~input_o\ & ((!\SW[6]~input_o\) # (!\SW[4]~input_o\))) ) ) # ( !\SW[5]~input_o\ & ( !\SW[7]~input_o\ $ (!\SW[6]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011010101010100010001010101010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[7]~input_o\,
	datab => \ALT_INV_SW[6]~input_o\,
	datad => \ALT_INV_SW[4]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \DisplayB|DISPLAY|Mux6~0_combout\);

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

-- Location: LABCELL_X85_Y8_N30
\DisplayA|BCDConversion[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayA|BCDConversion[4]~0_combout\ = ( \SW[2]~input_o\ & ( \SW[3]~input_o\ ) ) # ( !\SW[2]~input_o\ & ( (\SW[1]~input_o\ & \SW[3]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000011110000111100000101000001010000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[1]~input_o\,
	datac => \ALT_INV_SW[3]~input_o\,
	datae => \ALT_INV_SW[2]~input_o\,
	combout => \DisplayA|BCDConversion[4]~0_combout\);

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

-- Location: LABCELL_X85_Y8_N39
\DisplayA|DISPLAY|Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayA|DISPLAY|Mux12~0_combout\ = ( \SW[0]~input_o\ & ( !\SW[3]~input_o\ $ (((\SW[2]~input_o\) # (\SW[1]~input_o\))) ) ) # ( !\SW[0]~input_o\ & ( (!\SW[1]~input_o\ & ((\SW[2]~input_o\))) # (\SW[1]~input_o\ & (\SW[3]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010110101111000001011010111110100101000011111010010100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[1]~input_o\,
	datac => \ALT_INV_SW[3]~input_o\,
	datad => \ALT_INV_SW[2]~input_o\,
	dataf => \ALT_INV_SW[0]~input_o\,
	combout => \DisplayA|DISPLAY|Mux12~0_combout\);

-- Location: LABCELL_X85_Y8_N9
\DisplayA|DISPLAY|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayA|DISPLAY|Mux11~0_combout\ = ( \SW[1]~input_o\ & ( ((\SW[2]~input_o\ & !\SW[0]~input_o\)) # (\SW[3]~input_o\) ) ) # ( !\SW[1]~input_o\ & ( (\SW[2]~input_o\ & ((\SW[0]~input_o\) # (\SW[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100001111010111110101010100000101000011110101111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[3]~input_o\,
	datac => \ALT_INV_SW[2]~input_o\,
	datad => \ALT_INV_SW[0]~input_o\,
	datae => \ALT_INV_SW[1]~input_o\,
	combout => \DisplayA|DISPLAY|Mux11~0_combout\);

-- Location: LABCELL_X85_Y8_N42
\DisplayA|DISPLAY|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayA|DISPLAY|Mux10~0_combout\ = ( \SW[1]~input_o\ & ( ((!\SW[0]~input_o\ & !\SW[2]~input_o\)) # (\SW[3]~input_o\) ) ) # ( !\SW[1]~input_o\ & ( (\SW[2]~input_o\ & \SW[3]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011100011111000111100000011000000111000111110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[0]~input_o\,
	datab => \ALT_INV_SW[2]~input_o\,
	datac => \ALT_INV_SW[3]~input_o\,
	datae => \ALT_INV_SW[1]~input_o\,
	combout => \DisplayA|DISPLAY|Mux10~0_combout\);

-- Location: LABCELL_X85_Y8_N48
\DisplayA|DISPLAY|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayA|DISPLAY|Mux9~0_combout\ = ( \SW[1]~input_o\ & ( ((\SW[0]~input_o\ & \SW[2]~input_o\)) # (\SW[3]~input_o\) ) ) # ( !\SW[1]~input_o\ & ( (!\SW[0]~input_o\ & (\SW[2]~input_o\)) # (\SW[0]~input_o\ & ((!\SW[2]~input_o\) # (\SW[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011101100111000111110001111101100111011001110001111100011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[0]~input_o\,
	datab => \ALT_INV_SW[2]~input_o\,
	datac => \ALT_INV_SW[3]~input_o\,
	datae => \ALT_INV_SW[1]~input_o\,
	combout => \DisplayA|DISPLAY|Mux9~0_combout\);

-- Location: LABCELL_X85_Y8_N27
\DisplayA|DISPLAY|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayA|DISPLAY|Mux8~0_combout\ = ( \SW[1]~input_o\ & ( (\SW[0]~input_o\) # (\SW[3]~input_o\) ) ) # ( !\SW[1]~input_o\ & ( (\SW[0]~input_o\) # (\SW[2]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111010101011111111100001111111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[3]~input_o\,
	datac => \ALT_INV_SW[2]~input_o\,
	datad => \ALT_INV_SW[0]~input_o\,
	datae => \ALT_INV_SW[1]~input_o\,
	combout => \DisplayA|DISPLAY|Mux8~0_combout\);

-- Location: LABCELL_X85_Y8_N57
\DisplayA|DISPLAY|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayA|DISPLAY|Mux7~0_combout\ = ( \SW[1]~input_o\ & ( ((!\SW[2]~input_o\) # (\SW[0]~input_o\)) # (\SW[3]~input_o\) ) ) # ( !\SW[1]~input_o\ & ( (!\SW[3]~input_o\ & (!\SW[2]~input_o\ & \SW[0]~input_o\)) # (\SW[3]~input_o\ & (\SW[2]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010110100101111101011111111100000101101001011111010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[3]~input_o\,
	datac => \ALT_INV_SW[2]~input_o\,
	datad => \ALT_INV_SW[0]~input_o\,
	datae => \ALT_INV_SW[1]~input_o\,
	combout => \DisplayA|DISPLAY|Mux7~0_combout\);

-- Location: LABCELL_X85_Y8_N18
\DisplayA|DISPLAY|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplayA|DISPLAY|Mux6~0_combout\ = ( \SW[1]~input_o\ & ( (!\SW[3]~input_o\ & ((!\SW[0]~input_o\) # (!\SW[2]~input_o\))) ) ) # ( !\SW[1]~input_o\ & ( !\SW[2]~input_o\ $ (!\SW[3]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000111100111000001110000000111100001111001110000011100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[0]~input_o\,
	datab => \ALT_INV_SW[2]~input_o\,
	datac => \ALT_INV_SW[3]~input_o\,
	datae => \ALT_INV_SW[1]~input_o\,
	combout => \DisplayA|DISPLAY|Mux6~0_combout\);

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

-- Location: LABCELL_X83_Y8_N21
\Addition|FullAdder1|Cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Addition|FullAdder1|Cout~0_combout\ = ( \SW[5]~input_o\ & ( ((!\SW[0]~input_o\ & (\SW[4]~input_o\ & \SW[8]~input_o\)) # (\SW[0]~input_o\ & ((\SW[8]~input_o\) # (\SW[4]~input_o\)))) # (\SW[1]~input_o\) ) ) # ( !\SW[5]~input_o\ & ( (\SW[1]~input_o\ & 
-- ((!\SW[0]~input_o\ & (\SW[4]~input_o\ & \SW[8]~input_o\)) # (\SW[0]~input_o\ & ((\SW[8]~input_o\) # (\SW[4]~input_o\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000000000001011100010111111111110001011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[0]~input_o\,
	datab => \ALT_INV_SW[4]~input_o\,
	datac => \ALT_INV_SW[8]~input_o\,
	datad => \ALT_INV_SW[1]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \Addition|FullAdder1|Cout~0_combout\);

-- Location: LABCELL_X83_Y8_N24
\Addition|FULLAdder3|Cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Addition|FULLAdder3|Cout~0_combout\ = ( \Addition|FullAdder1|Cout~0_combout\ & ( (!\SW[7]~input_o\ & (\SW[3]~input_o\ & ((\SW[6]~input_o\) # (\SW[2]~input_o\)))) # (\SW[7]~input_o\ & (((\SW[3]~input_o\) # (\SW[6]~input_o\)) # (\SW[2]~input_o\))) ) ) # ( 
-- !\Addition|FullAdder1|Cout~0_combout\ & ( (!\SW[7]~input_o\ & (\SW[2]~input_o\ & (\SW[6]~input_o\ & \SW[3]~input_o\))) # (\SW[7]~input_o\ & (((\SW[2]~input_o\ & \SW[6]~input_o\)) # (\SW[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100011111000000010001111100000111011111110000011101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[2]~input_o\,
	datab => \ALT_INV_SW[6]~input_o\,
	datac => \ALT_INV_SW[7]~input_o\,
	datad => \ALT_INV_SW[3]~input_o\,
	dataf => \Addition|FullAdder1|ALT_INV_Cout~0_combout\,
	combout => \Addition|FULLAdder3|Cout~0_combout\);

-- Location: LABCELL_X83_Y8_N18
\Addition|FullAdder1|Sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Addition|FullAdder1|Sum~0_combout\ = ( \SW[5]~input_o\ & ( !\SW[1]~input_o\ $ (((!\SW[0]~input_o\ & (\SW[4]~input_o\ & \SW[8]~input_o\)) # (\SW[0]~input_o\ & ((\SW[8]~input_o\) # (\SW[4]~input_o\))))) ) ) # ( !\SW[5]~input_o\ & ( !\SW[1]~input_o\ $ 
-- (((!\SW[0]~input_o\ & ((!\SW[4]~input_o\) # (!\SW[8]~input_o\))) # (\SW[0]~input_o\ & (!\SW[4]~input_o\ & !\SW[8]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111001111000000111100111100011100001100001111110000110000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[0]~input_o\,
	datab => \ALT_INV_SW[4]~input_o\,
	datac => \ALT_INV_SW[1]~input_o\,
	datad => \ALT_INV_SW[8]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \Addition|FullAdder1|Sum~0_combout\);

-- Location: LABCELL_X83_Y8_N15
\Addition|FULLAdder3|Sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Addition|FULLAdder3|Sum~0_combout\ = ( \Addition|FullAdder1|Cout~0_combout\ & ( !\SW[7]~input_o\ $ (!\SW[3]~input_o\ $ (((\SW[2]~input_o\) # (\SW[6]~input_o\)))) ) ) # ( !\Addition|FullAdder1|Cout~0_combout\ & ( !\SW[7]~input_o\ $ (!\SW[3]~input_o\ $ 
-- (((\SW[6]~input_o\ & \SW[2]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001101001010110100110100101101001101001010110100110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[7]~input_o\,
	datab => \ALT_INV_SW[6]~input_o\,
	datac => \ALT_INV_SW[3]~input_o\,
	datad => \ALT_INV_SW[2]~input_o\,
	dataf => \Addition|FullAdder1|ALT_INV_Cout~0_combout\,
	combout => \Addition|FULLAdder3|Sum~0_combout\);

-- Location: LABCELL_X83_Y8_N27
\Addition|FullAdder2|Sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Addition|FullAdder2|Sum~0_combout\ = ( \Addition|FullAdder1|Cout~0_combout\ & ( !\SW[2]~input_o\ $ (\SW[6]~input_o\) ) ) # ( !\Addition|FullAdder1|Cout~0_combout\ & ( !\SW[2]~input_o\ $ (!\SW[6]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010010110100101101010100101101001011010010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[2]~input_o\,
	datac => \ALT_INV_SW[6]~input_o\,
	dataf => \Addition|FullAdder1|ALT_INV_Cout~0_combout\,
	combout => \Addition|FullAdder2|Sum~0_combout\);

-- Location: LABCELL_X88_Y8_N30
\DisplaySum|DISPLAY|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|DISPLAY|Mux5~0_combout\ = ( \Addition|FULLAdder3|Sum~0_combout\ & ( \Addition|FullAdder2|Sum~0_combout\ ) ) # ( !\Addition|FULLAdder3|Sum~0_combout\ & ( \Addition|FullAdder2|Sum~0_combout\ & ( \Addition|FULLAdder3|Cout~0_combout\ ) ) ) # ( 
-- \Addition|FULLAdder3|Sum~0_combout\ & ( !\Addition|FullAdder2|Sum~0_combout\ & ( (\Addition|FullAdder1|Sum~0_combout\) # (\Addition|FULLAdder3|Cout~0_combout\) ) ) ) # ( !\Addition|FULLAdder3|Sum~0_combout\ & ( !\Addition|FullAdder2|Sum~0_combout\ & ( 
-- \Addition|FULLAdder3|Cout~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001111110011111100110011001100111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Addition|FULLAdder3|ALT_INV_Cout~0_combout\,
	datac => \Addition|FullAdder1|ALT_INV_Sum~0_combout\,
	datae => \Addition|FULLAdder3|ALT_INV_Sum~0_combout\,
	dataf => \Addition|FullAdder2|ALT_INV_Sum~0_combout\,
	combout => \DisplaySum|DISPLAY|Mux5~0_combout\);

-- Location: LABCELL_X88_Y8_N51
\DisplaySum|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|Mux3~0_combout\ = ( \Addition|FULLAdder3|Sum~0_combout\ & ( \Addition|FullAdder2|Sum~0_combout\ & ( (\Addition|FullAdder1|Sum~0_combout\ & !\Addition|FULLAdder3|Cout~0_combout\) ) ) ) # ( !\Addition|FULLAdder3|Sum~0_combout\ & ( 
-- \Addition|FullAdder2|Sum~0_combout\ & ( (!\Addition|FullAdder1|Sum~0_combout\ & !\Addition|FULLAdder3|Cout~0_combout\) ) ) ) # ( \Addition|FULLAdder3|Sum~0_combout\ & ( !\Addition|FullAdder2|Sum~0_combout\ & ( !\Addition|FULLAdder3|Cout~0_combout\ ) ) ) # 
-- ( !\Addition|FULLAdder3|Sum~0_combout\ & ( !\Addition|FullAdder2|Sum~0_combout\ & ( !\Addition|FullAdder1|Sum~0_combout\ $ (\Addition|FULLAdder3|Cout~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010010110100101111100001111000010100000101000000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Addition|FullAdder1|ALT_INV_Sum~0_combout\,
	datac => \Addition|FULLAdder3|ALT_INV_Cout~0_combout\,
	datae => \Addition|FULLAdder3|ALT_INV_Sum~0_combout\,
	dataf => \Addition|FullAdder2|ALT_INV_Sum~0_combout\,
	combout => \DisplaySum|Mux3~0_combout\);

-- Location: LABCELL_X88_Y8_N12
\DisplaySum|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|Mux2~0_combout\ = ( \Addition|FULLAdder3|Sum~0_combout\ & ( \Addition|FullAdder2|Sum~0_combout\ & ( (!\Addition|FULLAdder3|Cout~0_combout\ & \Addition|FullAdder1|Sum~0_combout\) ) ) ) # ( !\Addition|FULLAdder3|Sum~0_combout\ & ( 
-- \Addition|FullAdder2|Sum~0_combout\ & ( !\Addition|FULLAdder3|Cout~0_combout\ ) ) ) # ( !\Addition|FULLAdder3|Sum~0_combout\ & ( !\Addition|FullAdder2|Sum~0_combout\ & ( (\Addition|FULLAdder3|Cout~0_combout\ & !\Addition|FullAdder1|Sum~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000000000000000000011001100110011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Addition|FULLAdder3|ALT_INV_Cout~0_combout\,
	datac => \Addition|FullAdder1|ALT_INV_Sum~0_combout\,
	datae => \Addition|FULLAdder3|ALT_INV_Sum~0_combout\,
	dataf => \Addition|FullAdder2|ALT_INV_Sum~0_combout\,
	combout => \DisplaySum|Mux2~0_combout\);

-- Location: LABCELL_X88_Y8_N9
\DisplaySum|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|Mux1~0_combout\ = ( \Addition|FULLAdder3|Sum~0_combout\ & ( \Addition|FullAdder2|Sum~0_combout\ & ( \Addition|FULLAdder3|Cout~0_combout\ ) ) ) # ( !\Addition|FULLAdder3|Sum~0_combout\ & ( \Addition|FullAdder2|Sum~0_combout\ & ( 
-- \Addition|FULLAdder3|Cout~0_combout\ ) ) ) # ( \Addition|FULLAdder3|Sum~0_combout\ & ( !\Addition|FullAdder2|Sum~0_combout\ & ( (!\Addition|FullAdder1|Sum~0_combout\) # (\Addition|FULLAdder3|Cout~0_combout\) ) ) ) # ( !\Addition|FULLAdder3|Sum~0_combout\ 
-- & ( !\Addition|FullAdder2|Sum~0_combout\ & ( (\Addition|FullAdder1|Sum~0_combout\ & \Addition|FULLAdder3|Cout~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101101011111010111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Addition|FullAdder1|ALT_INV_Sum~0_combout\,
	datac => \Addition|FULLAdder3|ALT_INV_Cout~0_combout\,
	datae => \Addition|FULLAdder3|ALT_INV_Sum~0_combout\,
	dataf => \Addition|FullAdder2|ALT_INV_Sum~0_combout\,
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

-- Location: LABCELL_X83_Y8_N0
\Addition|FullAdder0|Sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Addition|FullAdder0|Sum~0_combout\ = ( \SW[0]~input_o\ & ( !\SW[4]~input_o\ $ (\SW[8]~input_o\) ) ) # ( !\SW[0]~input_o\ & ( !\SW[4]~input_o\ $ (!\SW[8]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000111100001111000011110011000011110000111100001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_SW[4]~input_o\,
	datac => \ALT_INV_SW[8]~input_o\,
	dataf => \ALT_INV_SW[0]~input_o\,
	combout => \Addition|FullAdder0|Sum~0_combout\);

-- Location: LABCELL_X88_Y8_N0
\DisplaySum|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|Mux4~0_combout\ = ( \Addition|FULLAdder3|Sum~0_combout\ & ( \Addition|FullAdder2|Sum~0_combout\ & ( (\Addition|FullAdder0|Sum~0_combout\ & !\Addition|FULLAdder3|Cout~0_combout\) ) ) ) # ( !\Addition|FULLAdder3|Sum~0_combout\ & ( 
-- \Addition|FullAdder2|Sum~0_combout\ & ( (\Addition|FullAdder0|Sum~0_combout\ & !\Addition|FULLAdder3|Cout~0_combout\) ) ) ) # ( \Addition|FULLAdder3|Sum~0_combout\ & ( !\Addition|FullAdder2|Sum~0_combout\ & ( (\Addition|FullAdder0|Sum~0_combout\ & 
-- !\Addition|FULLAdder3|Cout~0_combout\) ) ) ) # ( !\Addition|FULLAdder3|Sum~0_combout\ & ( !\Addition|FullAdder2|Sum~0_combout\ & ( \Addition|FullAdder0|Sum~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110000000000110011000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Addition|FullAdder0|ALT_INV_Sum~0_combout\,
	datad => \Addition|FULLAdder3|ALT_INV_Cout~0_combout\,
	datae => \Addition|FULLAdder3|ALT_INV_Sum~0_combout\,
	dataf => \Addition|FullAdder2|ALT_INV_Sum~0_combout\,
	combout => \DisplaySum|Mux4~0_combout\);

-- Location: LABCELL_X88_Y8_N39
\DisplaySum|DISPLAY|Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|DISPLAY|Mux12~0_combout\ = ( \DisplaySum|Mux4~0_combout\ & ( \DisplaySum|Mux1~0_combout\ & ( (!\DisplaySum|Mux3~0_combout\) # (\DisplaySum|Mux2~0_combout\) ) ) ) # ( !\DisplaySum|Mux4~0_combout\ & ( \DisplaySum|Mux1~0_combout\ & ( 
-- (!\DisplaySum|Mux3~0_combout\) # (\DisplaySum|Mux2~0_combout\) ) ) ) # ( \DisplaySum|Mux4~0_combout\ & ( !\DisplaySum|Mux1~0_combout\ & ( (\DisplaySum|Mux3~0_combout\ & !\DisplaySum|Mux2~0_combout\) ) ) ) # ( !\DisplaySum|Mux4~0_combout\ & ( 
-- !\DisplaySum|Mux1~0_combout\ & ( (\DisplaySum|Mux3~0_combout\ & \DisplaySum|Mux2~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101010100000101000010101111101011111010111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DisplaySum|ALT_INV_Mux3~0_combout\,
	datac => \DisplaySum|ALT_INV_Mux2~0_combout\,
	datae => \DisplaySum|ALT_INV_Mux4~0_combout\,
	dataf => \DisplaySum|ALT_INV_Mux1~0_combout\,
	combout => \DisplaySum|DISPLAY|Mux12~0_combout\);

-- Location: LABCELL_X88_Y8_N42
\DisplaySum|DISPLAY|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|DISPLAY|Mux11~0_combout\ = ( \DisplaySum|Mux4~0_combout\ & ( \DisplaySum|Mux1~0_combout\ & ( (!\DisplaySum|Mux3~0_combout\) # (\DisplaySum|Mux2~0_combout\) ) ) ) # ( !\DisplaySum|Mux4~0_combout\ & ( \DisplaySum|Mux1~0_combout\ & ( 
-- (!\DisplaySum|Mux3~0_combout\) # (\DisplaySum|Mux2~0_combout\) ) ) ) # ( \DisplaySum|Mux4~0_combout\ & ( !\DisplaySum|Mux1~0_combout\ & ( (\DisplaySum|Mux2~0_combout\ & \DisplaySum|Mux3~0_combout\) ) ) ) # ( !\DisplaySum|Mux4~0_combout\ & ( 
-- !\DisplaySum|Mux1~0_combout\ & ( (\DisplaySum|Mux2~0_combout\ & !\DisplaySum|Mux3~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000000000110000001111110011111100111111001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \DisplaySum|ALT_INV_Mux2~0_combout\,
	datac => \DisplaySum|ALT_INV_Mux3~0_combout\,
	datae => \DisplaySum|ALT_INV_Mux4~0_combout\,
	dataf => \DisplaySum|ALT_INV_Mux1~0_combout\,
	combout => \DisplaySum|DISPLAY|Mux11~0_combout\);

-- Location: LABCELL_X88_Y8_N18
\DisplaySum|DISPLAY|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|DISPLAY|Mux10~0_combout\ = ( \DisplaySum|Mux1~0_combout\ & ( (!\DisplaySum|Mux3~0_combout\) # (\DisplaySum|Mux2~0_combout\) ) ) # ( !\DisplaySum|Mux1~0_combout\ & ( (!\DisplaySum|Mux3~0_combout\ & (!\DisplaySum|Mux2~0_combout\ & 
-- !\DisplaySum|Mux4~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000010111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DisplaySum|ALT_INV_Mux3~0_combout\,
	datab => \DisplaySum|ALT_INV_Mux2~0_combout\,
	datac => \DisplaySum|ALT_INV_Mux4~0_combout\,
	dataf => \DisplaySum|ALT_INV_Mux1~0_combout\,
	combout => \DisplaySum|DISPLAY|Mux10~0_combout\);

-- Location: LABCELL_X88_Y8_N24
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

-- Location: LABCELL_X88_Y8_N21
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

-- Location: LABCELL_X88_Y8_N57
\DisplaySum|DISPLAY|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DisplaySum|DISPLAY|Mux7~0_combout\ = ( \DisplaySum|Mux1~0_combout\ & ( (!\DisplaySum|Mux3~0_combout\) # (\DisplaySum|Mux2~0_combout\) ) ) # ( !\DisplaySum|Mux1~0_combout\ & ( (!\DisplaySum|Mux3~0_combout\ & ((!\DisplaySum|Mux2~0_combout\) # 
-- (\DisplaySum|Mux4~0_combout\))) # (\DisplaySum|Mux3~0_combout\ & (!\DisplaySum|Mux2~0_combout\ & \DisplaySum|Mux4~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100011101110100010001110111010111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DisplaySum|ALT_INV_Mux3~0_combout\,
	datab => \DisplaySum|ALT_INV_Mux2~0_combout\,
	datad => \DisplaySum|ALT_INV_Mux4~0_combout\,
	dataf => \DisplaySum|ALT_INV_Mux1~0_combout\,
	combout => \DisplaySum|DISPLAY|Mux7~0_combout\);

-- Location: LABCELL_X88_Y8_N27
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
\SW[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: LABCELL_X85_Y8_N3
\SWLEDS~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \SWLEDS~0_combout\ = ( \SW[9]~input_o\ & ( \Addition|FullAdder0|Sum~0_combout\ ) ) # ( !\SW[9]~input_o\ & ( \SW[0]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101000000001111111101010101010101010000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[0]~input_o\,
	datad => \Addition|FullAdder0|ALT_INV_Sum~0_combout\,
	datae => \ALT_INV_SW[9]~input_o\,
	combout => \SWLEDS~0_combout\);

-- Location: LABCELL_X83_Y8_N9
\SWLEDS~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \SWLEDS~1_combout\ = ( \Addition|FullAdder1|Sum~0_combout\ & ( (\SW[1]~input_o\) # (\SW[9]~input_o\) ) ) # ( !\Addition|FullAdder1|Sum~0_combout\ & ( (!\SW[9]~input_o\ & \SW[1]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101001010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[9]~input_o\,
	datad => \ALT_INV_SW[1]~input_o\,
	dataf => \Addition|FullAdder1|ALT_INV_Sum~0_combout\,
	combout => \SWLEDS~1_combout\);

-- Location: LABCELL_X83_Y8_N3
\SWLEDS~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \SWLEDS~2_combout\ = ( \Addition|FullAdder1|Cout~0_combout\ & ( !\SW[2]~input_o\ $ (((!\SW[9]~input_o\) # (\SW[6]~input_o\))) ) ) # ( !\Addition|FullAdder1|Cout~0_combout\ & ( !\SW[2]~input_o\ $ (((!\SW[9]~input_o\) # (!\SW[6]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111111010000001011111101001010000101011110101000010101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[9]~input_o\,
	datac => \ALT_INV_SW[6]~input_o\,
	datad => \ALT_INV_SW[2]~input_o\,
	dataf => \Addition|FullAdder1|ALT_INV_Cout~0_combout\,
	combout => \SWLEDS~2_combout\);

-- Location: LABCELL_X83_Y8_N42
\SWLEDS~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \SWLEDS~3_combout\ = ( \SW[6]~input_o\ & ( \Addition|FullAdder1|Cout~0_combout\ & ( !\SW[3]~input_o\ $ (((!\SW[9]~input_o\) # (\SW[7]~input_o\))) ) ) ) # ( !\SW[6]~input_o\ & ( \Addition|FullAdder1|Cout~0_combout\ & ( !\SW[3]~input_o\ $ 
-- (((!\SW[9]~input_o\) # (!\SW[7]~input_o\ $ (\SW[2]~input_o\)))) ) ) ) # ( \SW[6]~input_o\ & ( !\Addition|FullAdder1|Cout~0_combout\ & ( !\SW[3]~input_o\ $ (((!\SW[9]~input_o\) # (!\SW[7]~input_o\ $ (\SW[2]~input_o\)))) ) ) ) # ( !\SW[6]~input_o\ & ( 
-- !\Addition|FullAdder1|Cout~0_combout\ & ( !\SW[3]~input_o\ $ (((!\SW[7]~input_o\) # (!\SW[9]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011000110110001101100011100100110110001110010011100100111001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[7]~input_o\,
	datab => \ALT_INV_SW[3]~input_o\,
	datac => \ALT_INV_SW[9]~input_o\,
	datad => \ALT_INV_SW[2]~input_o\,
	datae => \ALT_INV_SW[6]~input_o\,
	dataf => \Addition|FullAdder1|ALT_INV_Cout~0_combout\,
	combout => \SWLEDS~3_combout\);

-- Location: LABCELL_X83_Y8_N6
\SWLEDS~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \SWLEDS~4_combout\ = ( \Addition|FULLAdder3|Cout~0_combout\ & ( (\SW[4]~input_o\) # (\SW[9]~input_o\) ) ) # ( !\Addition|FULLAdder3|Cout~0_combout\ & ( (!\SW[9]~input_o\ & \SW[4]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101001010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[9]~input_o\,
	datad => \ALT_INV_SW[4]~input_o\,
	dataf => \Addition|FULLAdder3|ALT_INV_Cout~0_combout\,
	combout => \SWLEDS~4_combout\);

-- Location: MLABCELL_X84_Y4_N0
\SWLEDS~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \SWLEDS~5_combout\ = ( \SW[5]~input_o\ & ( !\SW[9]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_SW[9]~input_o\,
	datae => \ALT_INV_SW[5]~input_o\,
	combout => \SWLEDS~5_combout\);

-- Location: MLABCELL_X84_Y4_N9
\SWLEDS~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \SWLEDS~6_combout\ = ( \SW[6]~input_o\ & ( !\SW[9]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_SW[6]~input_o\,
	dataf => \ALT_INV_SW[9]~input_o\,
	combout => \SWLEDS~6_combout\);

-- Location: MLABCELL_X84_Y4_N15
\SWLEDS~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \SWLEDS~7_combout\ = ( \SW[7]~input_o\ & ( !\SW[9]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[9]~input_o\,
	dataf => \ALT_INV_SW[7]~input_o\,
	combout => \SWLEDS~7_combout\);

-- Location: LABCELL_X85_Y8_N36
\SWLEDS~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \SWLEDS~8_combout\ = (!\SW[9]~input_o\ & \SW[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000001100000011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_SW[9]~input_o\,
	datac => \ALT_INV_SW[8]~input_o\,
	combout => \SWLEDS~8_combout\);

-- Location: LABCELL_X83_Y8_N51
\process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = ( \SW[5]~input_o\ & ( \SW[7]~input_o\ ) ) # ( !\SW[5]~input_o\ & ( (\SW[7]~input_o\ & ((\SW[4]~input_o\) # (\SW[6]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010100010101000101010001010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[7]~input_o\,
	datab => \ALT_INV_SW[6]~input_o\,
	datac => \ALT_INV_SW[4]~input_o\,
	dataf => \ALT_INV_SW[5]~input_o\,
	combout => \process_0~0_combout\);

-- Location: LABCELL_X85_Y8_N12
\process_0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \process_0~1_combout\ = ( \Addition|FULLAdder3|Cout~0_combout\ & ( \DisplayA|BCDConversion[4]~0_combout\ ) ) # ( !\Addition|FULLAdder3|Cout~0_combout\ & ( \DisplayA|BCDConversion[4]~0_combout\ ) ) # ( \Addition|FULLAdder3|Cout~0_combout\ & ( 
-- !\DisplayA|BCDConversion[4]~0_combout\ & ( ((\Addition|FullAdder2|Sum~0_combout\) # (\process_0~0_combout\)) # (\Addition|FULLAdder3|Sum~0_combout\) ) ) ) # ( !\Addition|FULLAdder3|Cout~0_combout\ & ( !\DisplayA|BCDConversion[4]~0_combout\ & ( 
-- \process_0~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111001111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Addition|FULLAdder3|ALT_INV_Sum~0_combout\,
	datac => \ALT_INV_process_0~0_combout\,
	datad => \Addition|FullAdder2|ALT_INV_Sum~0_combout\,
	datae => \Addition|FULLAdder3|ALT_INV_Cout~0_combout\,
	dataf => \DisplayA|ALT_INV_BCDConversion[4]~0_combout\,
	combout => \process_0~1_combout\);

-- Location: LABCELL_X79_Y11_N3
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


