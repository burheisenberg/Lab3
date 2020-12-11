--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:20:18 12/07/2020
-- Design Name:   
-- Module Name:   C:/Users/Burhan/Documents/Xilinx Projects/Lab3ALU/fourbitTEST.vhd
-- Project Name:  Lab3ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FourBitArithmeticLogicUnit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY fourbitTEST IS
END fourbitTEST;
 
ARCHITECTURE behavior OF fourbitTEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourBitArithmeticLogicUnit
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         CIN : IN  std_logic;
         S1 : IN  std_logic;
         S0 : IN  std_logic;
         M : IN  std_logic;
         V : OUT  std_logic;
			SEVSEG_CONTROL: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			SEVSEG_DATA : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			NEG_LED	:	OUT STD_LOGIC;
			LED_OUTPUT	:	OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
			  );
    END COMPONENT;
    


   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal CIN : std_logic := '0';
   signal S1 : std_logic := '0';
   signal S0 : std_logic := '0';
   signal M : std_logic := '0';

 	--Outputs
   signal V : std_logic;	-- OVER- FLOW & UNDER-FLOW OUTPUT PORT
	signal NEG_LED: STD_LOGIC;
	signal LED_OUTPUT : std_logic_VECTOR (3 DOWNTO 0) := (OTHERS => '0');	--THE RESULT PORT
	signal SEVSEG_CONTROL: STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal SEVSEG_DATA : STD_LOGIC_VECTOR(6 DOWNTO 0);
   -- No clocks detected in port list. Replace <clock> below with 

		CONSTANT clock_period : time := 100 ps;
		
		----------- TEST VECTOR
   SIGNAL VECTOR: STD_LOGIC_VECTOR(11 DOWNTO 0) := (others => '0');
	signal i : INTEGER :=0;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBitArithmeticLogicUnit PORT MAP (
          A => A,
          B => B,
          CIN => CIN,
          S1 => S1,
          S0 => S0,
          M => M,
          V => V,
			 LED_OUTPUT => LED_OUTPUT,
			 NEG_LED => NEG_LED,
			 SEVSEG_CONTROL => SEVSEG_CONTROL,
			 SEVSEG_DATA => SEVSEG_DATA
        );
	

   -- Stimulus process
	stim_proc: process
	BEGIN
	
	VECTOR <= "000000000000";
	
		A <= "1001"; B <= "0110"; CIN <= '1' ; S1 <= '1' ; S0 <= '1' ; M <= '1' ;
        wait for clock_period ;
      A <= "1001"; B <= "0110"; CIN <= '0' ; S1 <= '1' ; S0 <= '1' ; M <= '1' ;
        wait for clock_period ;
      A <= "1001"; B <= "0110"; CIN <= '1' ; S1 <= '0' ; S0 <= '1' ; M <= '1' ;
        wait for clock_period ; 
      A <= "1001"; B <= "0110"; CIN <= '1' ; S1 <= '1' ; S0 <= '0' ; M <= '1' ;
        wait for clock_period ; 
      A <= "1001"; B <= "0110"; CIN <= '0' ; S1 <= '0' ; S0 <= '1' ; M <= '1' ;
        wait for clock_period ; 
      A <= "1001"; B <= "0110"; CIN <= '1' ; S1 <= '0' ; S0 <= '0' ; M <= '1' ;
        wait for clock_period ;
		A <= "1001"; B <= "0110"; CIN <= '0' ; S1 <= '1' ; S0 <= '0' ; M <= '1' ;
        wait for clock_period ;
      A <= "1001"; B <= "0110"; CIN <= '0' ; S1 <= '0' ; S0 <= '0' ; M <= '1' ;
        wait for clock_period ; 
      A <= "1001"; B <= "0110"; CIN <= '1' ; S1 <= '1' ; S0 <= '1' ; M <= '0' ;
        wait for clock_period ; 
      A <= "1001"; B <= "0110"; CIN <= '1' ; S1 <= '1' ; S0 <= '0' ; M <= '0' ;
        wait for clock_period ; 
      A <= "1001"; B <= "0110"; CIN <= '0' ; S1 <= '1' ; S0 <= '1' ; M <= '0' ;
        wait for clock_period ; 
      A <= "1001"; B <= "0110"; CIN <= '1' ; S1 <= '0' ; S0 <= '0' ; M <= '0' ;
        wait for clock_period ; 
      A <= "1001"; B <= "0110"; CIN <= '0' ; S1 <= '1' ; S0 <= '0' ; M <= '0' ;
        wait for clock_period ; 
      A <= "1001"; B <= "0110"; CIN <= '0' ; S1 <= '0' ; S0 <= '1' ; M <= '0' ;
        wait for clock_period ; 
      A <= "1001"; B <= "0110"; CIN <= '0' ; S1 <= '0' ; S0 <= '0' ; M <= '0' ;
        wait for clock_period ;

	stimloop : for i in 0 to 4095 loop

   wait for clock_period;
	
	M <= VECTOR(11);
	S1 <= VECTOR(10);
	S0 <= VECTOR(9);
	CIN <= VECTOR(8);
	A(3) <= VECTOR(7);
	A(2) <= VECTOR(6);
	A(1) <= VECTOR(5);
	A(0) <= VECTOR(4);
	B(3) <= VECTOR(3);
	B(2) <= VECTOR(2);
	B(1) <= VECTOR(1);
	B(0) <= VECTOR(0);

	
   VECTOR <= std_logic_vector(to_unsigned(i, VECTOR'length)); 

   wait for clock_period;

   end loop stimloop;
	
   end process;

END;
