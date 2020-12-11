----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:18:16 12/05/2020 
-- Design Name: 
-- Module Name:    FourInMux - Behavioral 
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

entity FourInMux is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           I2 : in  STD_LOGIC;
           I3 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           Mux4Out : out  STD_LOGIC);
end FourInMux;

architecture Behavioral of FourInMux is
begin
Mux4Out <= (NOT S1 AND NOT S0 AND I0) OR (NOT S1 AND S0 AND I1) OR (S1 AND NOT S0 AND I2) OR (S1 AND S0 AND I3);
end Behavioral;

