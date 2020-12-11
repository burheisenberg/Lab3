----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:46:27 12/05/2020 
-- Design Name: 
-- Module Name:    TwoInMux - Behavioral 
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

entity TwoInMux is
    Port ( I0, I1, M : in STD_LOGIC;
			  LED_OUTPUT: OUT STD_LOGIC;
			  SEVSEG_OUTPUT: OUT STD_LOGIC);
end TwoInMux;

architecture Behavioral of TwoInMux is

begin
	LED_OUTPUT <= (I0 AND NOT M); -- OR (I1 AND M);
	SEVSEG_OUTPUT <= (I1 AND M);
end Behavioral;

