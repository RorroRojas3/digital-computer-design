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

-- DATE "09/29/2017 09:35:25"

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

ENTITY 	lab2_1 IS
    PORT (
	decInputs : IN std_logic_vector(2 DOWNTO 0);
	decEnable : IN std_logic;
	decOutput : OUT std_logic_vector(7 DOWNTO 0)
	);
END lab2_1;

-- Design Ports Information
-- decOutput[0]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decOutput[1]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decOutput[2]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decOutput[3]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decOutput[4]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decOutput[5]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decOutput[6]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decOutput[7]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decInputs[0]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decEnable	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decInputs[1]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- decInputs[2]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF lab2_1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_decInputs : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_decEnable : std_logic;
SIGNAL ww_decOutput : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \decInputs[0]~input_o\ : std_logic;
SIGNAL \decInputs[1]~input_o\ : std_logic;
SIGNAL \decEnable~input_o\ : std_logic;
SIGNAL \decInputs[2]~input_o\ : std_logic;
SIGNAL \decOutput~0_combout\ : std_logic;
SIGNAL \decOutput~1_combout\ : std_logic;
SIGNAL \decOutput~2_combout\ : std_logic;
SIGNAL \decOutput~3_combout\ : std_logic;
SIGNAL \decOutput~4_combout\ : std_logic;
SIGNAL \decOutput~5_combout\ : std_logic;
SIGNAL \decOutput~6_combout\ : std_logic;
SIGNAL \decOutput~7_combout\ : std_logic;
SIGNAL \ALT_INV_decInputs[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_decInputs[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_decEnable~input_o\ : std_logic;
SIGNAL \ALT_INV_decInputs[0]~input_o\ : std_logic;

BEGIN

ww_decInputs <= decInputs;
ww_decEnable <= decEnable;
decOutput <= ww_decOutput;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_decInputs[2]~input_o\ <= NOT \decInputs[2]~input_o\;
\ALT_INV_decInputs[1]~input_o\ <= NOT \decInputs[1]~input_o\;
\ALT_INV_decEnable~input_o\ <= NOT \decEnable~input_o\;
\ALT_INV_decInputs[0]~input_o\ <= NOT \decInputs[0]~input_o\;

-- Location: IOOBUF_X40_Y81_N53
\decOutput[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decOutput~0_combout\,
	devoe => ww_devoe,
	o => ww_decOutput(0));

-- Location: IOOBUF_X40_Y81_N19
\decOutput[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decOutput~1_combout\,
	devoe => ww_devoe,
	o => ww_decOutput(1));

-- Location: IOOBUF_X40_Y81_N2
\decOutput[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decOutput~2_combout\,
	devoe => ww_devoe,
	o => ww_decOutput(2));

-- Location: IOOBUF_X38_Y81_N19
\decOutput[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decOutput~3_combout\,
	devoe => ww_devoe,
	o => ww_decOutput(3));

-- Location: IOOBUF_X38_Y81_N53
\decOutput[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decOutput~4_combout\,
	devoe => ww_devoe,
	o => ww_decOutput(4));

-- Location: IOOBUF_X89_Y25_N5
\decOutput[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decOutput~5_combout\,
	devoe => ww_devoe,
	o => ww_decOutput(5));

-- Location: IOOBUF_X40_Y81_N36
\decOutput[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decOutput~6_combout\,
	devoe => ww_devoe,
	o => ww_decOutput(6));

-- Location: IOOBUF_X38_Y81_N36
\decOutput[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \decOutput~7_combout\,
	devoe => ww_devoe,
	o => ww_decOutput(7));

-- Location: IOIBUF_X36_Y81_N52
\decInputs[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decInputs(0),
	o => \decInputs[0]~input_o\);

-- Location: IOIBUF_X36_Y81_N35
\decInputs[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decInputs(1),
	o => \decInputs[1]~input_o\);

-- Location: IOIBUF_X34_Y81_N92
\decEnable~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decEnable,
	o => \decEnable~input_o\);

-- Location: IOIBUF_X38_Y81_N1
\decInputs[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_decInputs(2),
	o => \decInputs[2]~input_o\);

-- Location: MLABCELL_X39_Y80_N30
\decOutput~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \decOutput~0_combout\ = ( \decEnable~input_o\ & ( \decInputs[2]~input_o\ ) ) # ( !\decEnable~input_o\ & ( \decInputs[2]~input_o\ ) ) # ( \decEnable~input_o\ & ( !\decInputs[2]~input_o\ & ( (\decInputs[1]~input_o\) # (\decInputs[0]~input_o\) ) ) ) # ( 
-- !\decEnable~input_o\ & ( !\decInputs[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111001111110011111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_decInputs[0]~input_o\,
	datac => \ALT_INV_decInputs[1]~input_o\,
	datae => \ALT_INV_decEnable~input_o\,
	dataf => \ALT_INV_decInputs[2]~input_o\,
	combout => \decOutput~0_combout\);

-- Location: MLABCELL_X39_Y80_N9
\decOutput~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \decOutput~1_combout\ = ( \decEnable~input_o\ & ( \decInputs[2]~input_o\ ) ) # ( !\decEnable~input_o\ & ( \decInputs[2]~input_o\ ) ) # ( \decEnable~input_o\ & ( !\decInputs[2]~input_o\ & ( (!\decInputs[0]~input_o\) # (\decInputs[1]~input_o\) ) ) ) # ( 
-- !\decEnable~input_o\ & ( !\decInputs[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111101011111010111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_decInputs[1]~input_o\,
	datac => \ALT_INV_decInputs[0]~input_o\,
	datae => \ALT_INV_decEnable~input_o\,
	dataf => \ALT_INV_decInputs[2]~input_o\,
	combout => \decOutput~1_combout\);

-- Location: MLABCELL_X39_Y80_N42
\decOutput~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \decOutput~2_combout\ = ( \decEnable~input_o\ & ( \decInputs[2]~input_o\ ) ) # ( !\decEnable~input_o\ & ( \decInputs[2]~input_o\ ) ) # ( \decEnable~input_o\ & ( !\decInputs[2]~input_o\ & ( (!\decInputs[1]~input_o\) # (\decInputs[0]~input_o\) ) ) ) # ( 
-- !\decEnable~input_o\ & ( !\decInputs[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111100111111001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_decInputs[0]~input_o\,
	datac => \ALT_INV_decInputs[1]~input_o\,
	datae => \ALT_INV_decEnable~input_o\,
	dataf => \ALT_INV_decInputs[2]~input_o\,
	combout => \decOutput~2_combout\);

-- Location: MLABCELL_X39_Y80_N21
\decOutput~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \decOutput~3_combout\ = ( \decEnable~input_o\ & ( \decInputs[2]~input_o\ ) ) # ( !\decEnable~input_o\ & ( \decInputs[2]~input_o\ ) ) # ( \decEnable~input_o\ & ( !\decInputs[2]~input_o\ & ( (!\decInputs[1]~input_o\) # (!\decInputs[0]~input_o\) ) ) ) # ( 
-- !\decEnable~input_o\ & ( !\decInputs[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111110101111101011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_decInputs[1]~input_o\,
	datac => \ALT_INV_decInputs[0]~input_o\,
	datae => \ALT_INV_decEnable~input_o\,
	dataf => \ALT_INV_decInputs[2]~input_o\,
	combout => \decOutput~3_combout\);

-- Location: MLABCELL_X39_Y80_N54
\decOutput~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \decOutput~4_combout\ = ( \decEnable~input_o\ & ( \decInputs[2]~input_o\ & ( (\decInputs[1]~input_o\) # (\decInputs[0]~input_o\) ) ) ) # ( !\decEnable~input_o\ & ( \decInputs[2]~input_o\ ) ) # ( \decEnable~input_o\ & ( !\decInputs[2]~input_o\ ) ) # ( 
-- !\decEnable~input_o\ & ( !\decInputs[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_decInputs[0]~input_o\,
	datac => \ALT_INV_decInputs[1]~input_o\,
	datae => \ALT_INV_decEnable~input_o\,
	dataf => \ALT_INV_decInputs[2]~input_o\,
	combout => \decOutput~4_combout\);

-- Location: MLABCELL_X39_Y80_N3
\decOutput~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \decOutput~5_combout\ = ( \decEnable~input_o\ & ( \decInputs[2]~input_o\ & ( (!\decInputs[0]~input_o\) # (\decInputs[1]~input_o\) ) ) ) # ( !\decEnable~input_o\ & ( \decInputs[2]~input_o\ ) ) # ( \decEnable~input_o\ & ( !\decInputs[2]~input_o\ ) ) # ( 
-- !\decEnable~input_o\ & ( !\decInputs[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_decInputs[1]~input_o\,
	datac => \ALT_INV_decInputs[0]~input_o\,
	datae => \ALT_INV_decEnable~input_o\,
	dataf => \ALT_INV_decInputs[2]~input_o\,
	combout => \decOutput~5_combout\);

-- Location: MLABCELL_X39_Y80_N36
\decOutput~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \decOutput~6_combout\ = ( \decEnable~input_o\ & ( \decInputs[2]~input_o\ & ( (!\decInputs[1]~input_o\) # (\decInputs[0]~input_o\) ) ) ) # ( !\decEnable~input_o\ & ( \decInputs[2]~input_o\ ) ) # ( \decEnable~input_o\ & ( !\decInputs[2]~input_o\ ) ) # ( 
-- !\decEnable~input_o\ & ( !\decInputs[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_decInputs[0]~input_o\,
	datac => \ALT_INV_decInputs[1]~input_o\,
	datae => \ALT_INV_decEnable~input_o\,
	dataf => \ALT_INV_decInputs[2]~input_o\,
	combout => \decOutput~6_combout\);

-- Location: MLABCELL_X39_Y80_N15
\decOutput~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \decOutput~7_combout\ = ( \decEnable~input_o\ & ( \decInputs[2]~input_o\ & ( (!\decInputs[1]~input_o\) # (!\decInputs[0]~input_o\) ) ) ) # ( !\decEnable~input_o\ & ( \decInputs[2]~input_o\ ) ) # ( \decEnable~input_o\ & ( !\decInputs[2]~input_o\ ) ) # ( 
-- !\decEnable~input_o\ & ( !\decInputs[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_decInputs[1]~input_o\,
	datac => \ALT_INV_decInputs[0]~input_o\,
	datae => \ALT_INV_decEnable~input_o\,
	dataf => \ALT_INV_decInputs[2]~input_o\,
	combout => \decOutput~7_combout\);

-- Location: LABCELL_X35_Y37_N0
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


