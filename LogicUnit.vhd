----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:41:02 12/05/2020 
-- Design Name: 
-- Module Name:    LogicUnit - Behavioral 
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

entity LogicUnit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  S1 : in STD_LOGIC;
			  S0 : in STD_LOGIC;
           LogicOut : out  STD_LOGIC);
end LogicUnit;

architecture Behavioral of LogicUnit is
component FourInMux
	Port(I0, I1, I2, I3, S1, S0: in STD_LOGIC;
			Mux4Out : out STD_LOGIC);
end component;

signal INPUT : STD_LOGIC_VECTOR (0 to 3);
			
begin
INPUT(0) <= A  AND  B;
INPUT(1) <= A  OR   B;
INPUT(2) <= A  XOR  B;
INPUT(3) <= A  XNOR B;
OUTPUT : FourInMux Port Map(INPUT(0), INPUT(1), INPUT(2), INPUT(3), S1, S0, LogicOut);
end Behavioral;

