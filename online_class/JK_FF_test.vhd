--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:28:21 05/09/2020
-- Design Name:   
-- Module Name:   /home/nibba/Xilinx/online_class/JK_FF_test.vhd
-- Project Name:  online_class
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: JK_FF
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY JK_FF_test IS
END JK_FF_test;
 
ARCHITECTURE behavior OF JK_FF_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT JK_FF
    PORT(
         CLK : IN  std_logic;
         J : IN  std_logic;
         K : IN  std_logic;
         Q : OUT  std_logic;
         Qn : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal J : std_logic := '0';
   signal K : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal Qn : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: JK_FF PORT MAP (
          CLK => CLK,
          J => J,
          K => K,
          Q => Q,
          Qn => Qn
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		J<='0'; K<='0'; wait for 100 ns;
		J<='0'; K<='1'; wait for 100 ns;
		J<='1'; K<='0'; wait for 100 ns;
		J<='1'; K<='1'; wait for 100 ns;

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
