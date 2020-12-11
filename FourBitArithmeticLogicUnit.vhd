----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:31:51 12/05/2020 
-- Design Name: 
-- Module Name:    FourBitArithmeticLogicUnit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FourBitArithmeticLogicUnit is
    Port ( A 		: in  STD_LOGIC_VECTOR (3 DOWNTO 0)	 := (others => '0');
           B 		: in  STD_LOGIC_VECTOR (3 DOWNTO 0)	 := (others => '0');
           CIN 	: in  STD_LOGIC;
           S1 		: in  STD_LOGIC;
           S0 		: in  STD_LOGIC;
           M 		: in  STD_LOGIC;
           V 		: out STD_LOGIC;
			  SEVSEG_CONTROL: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)	:= (OTHERS => '1');	-- which display
			  SEVSEG_DATA : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);		-- what character
			  NEG_LED	:	OUT STD_LOGIC; 	-- turns on if the number is negative
			  LED_OUTPUT	:	OUT STD_LOGIC_VECTOR (3 DOWNTO 0));		-- which pin
end FourBitArithmeticLogicUnit;
	architecture Behavioral of FourBitArithmeticLogicUnit is
component BitwiseArithmeticLogicUnit
		Port(A, B, CIN, S1, S0, M	:	in  STD_LOGIC; 
				COUT, LED_OUTPUT, SEVSEG_OUTPUT		:	out STD_LOGIC);
end component;
component SEVSEG_DECODER IS
    PORT ( INPUT : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
           SEVSEG_BUS : OUT  STD_LOGIC_VECTOR (6 DOWNTO 0));
end component;
	-- carry bit signals
signal C: STD_LOGIC_VECTOR (4 DOWNTO 0)	 := (others => '0');
-- intermediate signal to take the output from bitwise ALU (and from 2-1 mux) and to give it as an input to the SEVSEGDEC
signal temp_SEVSEG: STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '0');

begin
	C(0) <= CIN;
	BIT0	: BitwiseArithmeticLogicUnit Port Map (A(0), B(0), C(0), S1, S0, M, C(1), LED_OUTPUT(0), temp_SEVSEG(0));
	BIT1	: BitwiseArithmeticLogicUnit Port Map (A(1), B(1), C(1), S1, S0, M, C(2), LED_OUTPUT(1), temp_SEVSEG(1));
	BIT2	: BitwiseArithmeticLogicUnit Port Map (A(2), B(2), C(2), S1, S0, M, C(3), LED_OUTPUT(2), temp_SEVSEG(2));
	BIT3	: BitwiseArithmeticLogicUnit Port Map (A(3), B(3), C(3), S1, S0, M, C(4), LED_OUTPUT(3), temp_SEVSEG(3));
	
	-- SEVSEG CONFIGURATIONS
	-- ACTIVATE THE SEVSEG [0]
	SEVSEG_CONTROL <= (NOT M, '1', '1', '1', '1', '1', '1', '1');
	
	-- NEGATIVE SIGN
	NEG_LED <= temp_SEVSEG(3);
	
	DISP	: SEVSEG_DECODER Port Map (temp_SEVSEG, SEVSEG_DATA);
		
	-- over-underflow detection
	V <= (C(3) XOR C(4)) AND M;
end Behavioral;
