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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "08/23/2021 17:50:53"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Prac
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Prac_vhd_vec_tst IS
END Prac_vhd_vec_tst;
ARCHITECTURE Prac_arch OF Prac_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL Input_data : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL LED : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Output_data : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL RST : STD_LOGIC;
SIGNAL Rx : STD_LOGIC;
SIGNAL Sample_clk : STD_LOGIC;
SIGNAL STE : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Tx : STD_LOGIC;
SIGNAL Tx_Flag : STD_LOGIC;
COMPONENT Prac
	PORT (
	CLK : IN STD_LOGIC;
	Input_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	LED : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Output_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	RST : IN STD_LOGIC;
	Rx : IN STD_LOGIC;
	Sample_clk : OUT STD_LOGIC;
	STE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	Tx : OUT STD_LOGIC;
	Tx_Flag : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Prac
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	Input_data => Input_data,
	LED => LED,
	Output_data => Output_data,
	RST => RST,
	Rx => Rx,
	Sample_clk => Sample_clk,
	STE => STE,
	Tx => Tx,
	Tx_Flag => Tx_Flag
	);

-- CLK
t_prcs_CLK: PROCESS
BEGIN
LOOP
	CLK <= '0';
	WAIT FOR 10000 ps;
	CLK <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 100000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK;

-- Rx
t_prcs_Rx: PROCESS
BEGIN
LOOP
	Rx <= '0';
	WAIT FOR 5000000 ps;
	Rx <= '1';
	WAIT FOR 5000000 ps;
	IF (NOW >= 100000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Rx;
END Prac_arch;
