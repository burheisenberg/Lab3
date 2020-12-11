----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:34:08 12/05/2020 
-- Design Name: 
-- Module Name:    ArithmeticUnit - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ArithmeticUnit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           CIN : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           SUM : out  STD_LOGIC;
           COUT : out  STD_LOGIC);
end ArithmeticUnit;

architecture Behavioral of ArithmeticUnit is


component FourInMux
			Port(I0, I1, I2, I3, S1, S0: in STD_LOGIC;
					Mux4Out : out STD_LOGIC);
end component;

component FullAdder
			Port(A, B, CIN: in STD_LOGIC;
					SUM, COUT: out STD_LOGIC);
end component;

 -- intermediate signal for arithmetic unit inputs
signal INPUT : STD_LOGIC_VECTOR(2 downto 1);

begin

INPUT1 : FourInMux Port Map(A, A, A, NOT A, S1, S0, INPUT(1));
INPUT2 : FourInMux Port Map('0', B, NOT B, B, S1, S0, INPUT(2));

OUTPUT : FullAdder Port Map(INPUT(1), INPUT(2), CIN, SUM, COUT);

end Behavioral;

