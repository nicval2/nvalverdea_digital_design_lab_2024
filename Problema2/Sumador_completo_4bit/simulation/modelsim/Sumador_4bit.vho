-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "02/20/2024 07:30:13"

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

ENTITY 	Sumador_4bit IS
    PORT (
	iAv : IN std_logic_vector(3 DOWNTO 0);
	iBv : IN std_logic_vector(3 DOWNTO 0);
	iCin : IN std_logic;
	oCarry : BUFFER std_logic;
	ovSuma_4bit : BUFFER std_logic_vector(3 DOWNTO 0)
	);
END Sumador_4bit;

-- Design Ports Information
-- iCin	=>  Location: PIN_AC29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oCarry	=>  Location: PIN_AH5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ovSuma_4bit[0]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ovSuma_4bit[1]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ovSuma_4bit[2]	=>  Location: PIN_V17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ovSuma_4bit[3]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iAv[3]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iBv[3]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iAv[2]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iBv[2]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iAv[1]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iBv[1]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iAv[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iBv[0]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Sumador_4bit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_iAv : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_iBv : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_iCin : std_logic;
SIGNAL ww_oCarry : std_logic;
SIGNAL ww_ovSuma_4bit : std_logic_vector(3 DOWNTO 0);
SIGNAL \iCin~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \iBv[3]~input_o\ : std_logic;
SIGNAL \iBv[2]~input_o\ : std_logic;
SIGNAL \iAv[2]~input_o\ : std_logic;
SIGNAL \iAv[3]~input_o\ : std_logic;
SIGNAL \iAv[1]~input_o\ : std_logic;
SIGNAL \iBv[0]~input_o\ : std_logic;
SIGNAL \iAv[0]~input_o\ : std_logic;
SIGNAL \iBv[1]~input_o\ : std_logic;
SIGNAL \Inst_Sumador_completo_1bit_2|oCarry~0_combout\ : std_logic;
SIGNAL \Inst_Sumador_completo_1bit_4|oCarry~0_combout\ : std_logic;
SIGNAL \Inst_Sumador_completo_1bit_1|oSuma_1bit~0_combout\ : std_logic;
SIGNAL \Inst_Sumador_completo_1bit_2|oSuma_1bit~combout\ : std_logic;
SIGNAL \Inst_Sumador_completo_1bit_3|oSuma_1bit~combout\ : std_logic;
SIGNAL \Inst_Sumador_completo_1bit_4|oSuma_1bit~combout\ : std_logic;
SIGNAL \ALT_INV_iBv[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_iAv[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_iBv[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_iAv[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_iBv[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_iAv[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_iBv[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_iAv[3]~input_o\ : std_logic;
SIGNAL \Inst_Sumador_completo_1bit_2|ALT_INV_oCarry~0_combout\ : std_logic;

BEGIN

ww_iAv <= iAv;
ww_iBv <= iBv;
ww_iCin <= iCin;
oCarry <= ww_oCarry;
ovSuma_4bit <= ww_ovSuma_4bit;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_iBv[0]~input_o\ <= NOT \iBv[0]~input_o\;
\ALT_INV_iAv[0]~input_o\ <= NOT \iAv[0]~input_o\;
\ALT_INV_iBv[1]~input_o\ <= NOT \iBv[1]~input_o\;
\ALT_INV_iAv[1]~input_o\ <= NOT \iAv[1]~input_o\;
\ALT_INV_iBv[2]~input_o\ <= NOT \iBv[2]~input_o\;
\ALT_INV_iAv[2]~input_o\ <= NOT \iAv[2]~input_o\;
\ALT_INV_iBv[3]~input_o\ <= NOT \iBv[3]~input_o\;
\ALT_INV_iAv[3]~input_o\ <= NOT \iAv[3]~input_o\;
\Inst_Sumador_completo_1bit_2|ALT_INV_oCarry~0_combout\ <= NOT \Inst_Sumador_completo_1bit_2|oCarry~0_combout\;

-- Location: IOOBUF_X14_Y0_N53
\oCarry~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Inst_Sumador_completo_1bit_4|oCarry~0_combout\,
	devoe => ww_devoe,
	o => ww_oCarry);

-- Location: IOOBUF_X52_Y0_N2
\ovSuma_4bit[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Inst_Sumador_completo_1bit_1|oSuma_1bit~0_combout\,
	devoe => ww_devoe,
	o => ww_ovSuma_4bit(0));

-- Location: IOOBUF_X52_Y0_N19
\ovSuma_4bit[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Inst_Sumador_completo_1bit_2|oSuma_1bit~combout\,
	devoe => ww_devoe,
	o => ww_ovSuma_4bit(1));

-- Location: IOOBUF_X60_Y0_N2
\ovSuma_4bit[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Inst_Sumador_completo_1bit_3|oSuma_1bit~combout\,
	devoe => ww_devoe,
	o => ww_ovSuma_4bit(2));

-- Location: IOOBUF_X80_Y0_N2
\ovSuma_4bit[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Inst_Sumador_completo_1bit_4|oSuma_1bit~combout\,
	devoe => ww_devoe,
	o => ww_ovSuma_4bit(3));

-- Location: IOIBUF_X4_Y0_N1
\iBv[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iBv(3),
	o => \iBv[3]~input_o\);

-- Location: IOIBUF_X4_Y0_N35
\iBv[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iBv(2),
	o => \iBv[2]~input_o\);

-- Location: IOIBUF_X8_Y0_N35
\iAv[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iAv(2),
	o => \iAv[2]~input_o\);

-- Location: IOIBUF_X4_Y0_N52
\iAv[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iAv(3),
	o => \iAv[3]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\iAv[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iAv(1),
	o => \iAv[1]~input_o\);

-- Location: IOIBUF_X2_Y0_N41
\iBv[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iBv(0),
	o => \iBv[0]~input_o\);

-- Location: IOIBUF_X12_Y0_N18
\iAv[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iAv(0),
	o => \iAv[0]~input_o\);

-- Location: IOIBUF_X16_Y0_N18
\iBv[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iBv(1),
	o => \iBv[1]~input_o\);

-- Location: LABCELL_X13_Y2_N30
\Inst_Sumador_completo_1bit_2|oCarry~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Inst_Sumador_completo_1bit_2|oCarry~0_combout\ = ( \iBv[1]~input_o\ & ( ((\iBv[0]~input_o\ & \iAv[0]~input_o\)) # (\iAv[1]~input_o\) ) ) # ( !\iBv[1]~input_o\ & ( (\iAv[1]~input_o\ & (\iBv[0]~input_o\ & \iAv[0]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000101010111010101110101011101010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iAv[1]~input_o\,
	datab => \ALT_INV_iBv[0]~input_o\,
	datac => \ALT_INV_iAv[0]~input_o\,
	dataf => \ALT_INV_iBv[1]~input_o\,
	combout => \Inst_Sumador_completo_1bit_2|oCarry~0_combout\);

-- Location: LABCELL_X13_Y2_N36
\Inst_Sumador_completo_1bit_4|oCarry~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Inst_Sumador_completo_1bit_4|oCarry~0_combout\ = ( \Inst_Sumador_completo_1bit_2|oCarry~0_combout\ & ( (!\iBv[3]~input_o\ & (\iAv[3]~input_o\ & ((\iAv[2]~input_o\) # (\iBv[2]~input_o\)))) # (\iBv[3]~input_o\ & (((\iAv[3]~input_o\) # (\iAv[2]~input_o\)) # 
-- (\iBv[2]~input_o\))) ) ) # ( !\Inst_Sumador_completo_1bit_2|oCarry~0_combout\ & ( (!\iBv[3]~input_o\ & (\iBv[2]~input_o\ & (\iAv[2]~input_o\ & \iAv[3]~input_o\))) # (\iBv[3]~input_o\ & (((\iBv[2]~input_o\ & \iAv[2]~input_o\)) # (\iAv[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101010111000000010101011100010101011111110001010101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iBv[3]~input_o\,
	datab => \ALT_INV_iBv[2]~input_o\,
	datac => \ALT_INV_iAv[2]~input_o\,
	datad => \ALT_INV_iAv[3]~input_o\,
	dataf => \Inst_Sumador_completo_1bit_2|ALT_INV_oCarry~0_combout\,
	combout => \Inst_Sumador_completo_1bit_4|oCarry~0_combout\);

-- Location: LABCELL_X13_Y2_N12
\Inst_Sumador_completo_1bit_1|oSuma_1bit~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Inst_Sumador_completo_1bit_1|oSuma_1bit~0_combout\ = ( \iAv[0]~input_o\ & ( !\iBv[0]~input_o\ ) ) # ( !\iAv[0]~input_o\ & ( \iBv[0]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_iBv[0]~input_o\,
	dataf => \ALT_INV_iAv[0]~input_o\,
	combout => \Inst_Sumador_completo_1bit_1|oSuma_1bit~0_combout\);

-- Location: LABCELL_X13_Y2_N51
\Inst_Sumador_completo_1bit_2|oSuma_1bit\ : cyclonev_lcell_comb
-- Equation(s):
-- \Inst_Sumador_completo_1bit_2|oSuma_1bit~combout\ = ( \iBv[1]~input_o\ & ( !\iAv[1]~input_o\ $ (((\iAv[0]~input_o\ & \iBv[0]~input_o\))) ) ) # ( !\iBv[1]~input_o\ & ( !\iAv[1]~input_o\ $ (((!\iAv[0]~input_o\) # (!\iBv[0]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111111010000001011111101011111010000001011111101000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iAv[0]~input_o\,
	datac => \ALT_INV_iBv[0]~input_o\,
	datad => \ALT_INV_iAv[1]~input_o\,
	dataf => \ALT_INV_iBv[1]~input_o\,
	combout => \Inst_Sumador_completo_1bit_2|oSuma_1bit~combout\);

-- Location: LABCELL_X13_Y2_N54
\Inst_Sumador_completo_1bit_3|oSuma_1bit\ : cyclonev_lcell_comb
-- Equation(s):
-- \Inst_Sumador_completo_1bit_3|oSuma_1bit~combout\ = ( \iAv[2]~input_o\ & ( \iBv[1]~input_o\ & ( !\iBv[2]~input_o\ $ ((((\iBv[0]~input_o\ & \iAv[0]~input_o\)) # (\iAv[1]~input_o\))) ) ) ) # ( !\iAv[2]~input_o\ & ( \iBv[1]~input_o\ & ( !\iBv[2]~input_o\ $ 
-- (((!\iAv[1]~input_o\ & ((!\iBv[0]~input_o\) # (!\iAv[0]~input_o\))))) ) ) ) # ( \iAv[2]~input_o\ & ( !\iBv[1]~input_o\ & ( !\iBv[2]~input_o\ $ (((\iAv[1]~input_o\ & (\iBv[0]~input_o\ & \iAv[0]~input_o\)))) ) ) ) # ( !\iAv[2]~input_o\ & ( !\iBv[1]~input_o\ 
-- & ( !\iBv[2]~input_o\ $ (((!\iAv[1]~input_o\) # ((!\iBv[0]~input_o\) # (!\iAv[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111111110111111100000000101010111101010001010100001010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iAv[1]~input_o\,
	datab => \ALT_INV_iBv[0]~input_o\,
	datac => \ALT_INV_iAv[0]~input_o\,
	datad => \ALT_INV_iBv[2]~input_o\,
	datae => \ALT_INV_iAv[2]~input_o\,
	dataf => \ALT_INV_iBv[1]~input_o\,
	combout => \Inst_Sumador_completo_1bit_3|oSuma_1bit~combout\);

-- Location: LABCELL_X13_Y2_N39
\Inst_Sumador_completo_1bit_4|oSuma_1bit\ : cyclonev_lcell_comb
-- Equation(s):
-- \Inst_Sumador_completo_1bit_4|oSuma_1bit~combout\ = ( \Inst_Sumador_completo_1bit_2|oCarry~0_combout\ & ( !\iBv[3]~input_o\ $ (!\iAv[3]~input_o\ $ (((\iAv[2]~input_o\) # (\iBv[2]~input_o\)))) ) ) # ( !\Inst_Sumador_completo_1bit_2|oCarry~0_combout\ & ( 
-- !\iBv[3]~input_o\ $ (!\iAv[3]~input_o\ $ (((\iBv[2]~input_o\ & \iAv[2]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001101001010110100110100101101001101001010110100110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iBv[3]~input_o\,
	datab => \ALT_INV_iBv[2]~input_o\,
	datac => \ALT_INV_iAv[3]~input_o\,
	datad => \ALT_INV_iAv[2]~input_o\,
	dataf => \Inst_Sumador_completo_1bit_2|ALT_INV_oCarry~0_combout\,
	combout => \Inst_Sumador_completo_1bit_4|oSuma_1bit~combout\);

-- Location: IOIBUF_X89_Y20_N95
\iCin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iCin,
	o => \iCin~input_o\);

-- Location: LABCELL_X12_Y65_N0
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


