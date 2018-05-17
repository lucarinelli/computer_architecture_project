----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2018 02:49:04 PM
-- Design Name: 
-- Module Name: tb_main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_main is
--  always empty for a testbench
--  Port ( );
end tb_main;



architecture Behavioral of tb_main is
    -- it seems that the "is" below is not mandatory 
    component main is
    port(
        D, EN : in std_logic;
        Q, NQ : out std_logic;
        CLK : in std_logic
    );    
    end component;
    
    -- inputs
    signal D : std_logic := '0';
    signal EN : std_logic := '0';
    signal CLK : std_logic := '0';
    -- outputs
    signal Q, NQ : std_logic;
    --constants
    constant CLK_PERIOD : time := 1000ns;
     
     
    --uut: main 
begin


end Behavioral;
