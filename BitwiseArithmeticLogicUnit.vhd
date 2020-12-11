----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:15:21 12/05/2020 
-- Design Name: 
-- Module Name:    BitwiseArithmeticLogicUnit - Behavioral 
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
entity BitwiseArithmeticLogicUnit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           CIN : in  STD_LOGIC;
			  S1	: in  STD_LOGIC;
			  S0	: in  STD_LOGIC;
			  M : in  STD_LOGIC;
           COUT : out  STD_LOGIC;
			  LED_OUTPUT   : out STD_LOGIC;
			  SEVSEG_OUTPUT : out STD_LOGIC);
end BitwiseArithmeticLogicUnit;

architecture Behavioral of BitwiseArithmeticLogicUnit is

component TwoInMux
	Port ( I0, I1, M : in STD_LOGIC;
           LED_OUTPUT : out  STD_LOGIC;
			  SEVSEG_OUTPUT: OUT STD_LOGIC);
end component;

component ArithmeticUnit
	Port(A, B, CIN, S1, S0: in STD_LOGIC;
			SUM, COUT: out STD_LOGIC);
end component; 

component LogicUnit
	Port(A, B, S1, S0: in STD_LOGIC;
			LogicOut : out STD_LOGIC);
end component;

-- intermediate signals  for sum and logic outputs
signal SUM: STD_LOGIC;
signal LOGIC: STD_LOGIC;

begin
ARITHMETIC_OUTPUT	: ArithmeticUnit 	Port Map (A, B, CIN, S1, S0, SUM, COUT);
LOGIC_OUTPUT		: LogicUnit 		Port Map (A, B, S1, S0, LOGIC);
RESULT				: TwoInMux  		Port Map (LOGIC, SUM, M, LED_OUTPUT, SEVSEG_OUTPUT);
end Behavioral;

