----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2018 05:41:17 PM
-- Design Name: 
-- Module Name: rgb2gray - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: converts a singnal to RGB component (24 bits) to grayscale (8 bits)
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rgb2gray is
    Port (
        rgb : in STD_LOGIC_VECTOR (23 downto 0);
        gray : out STD_LOGIC_VECTOR (7 downto 0);
        clk : in std_logic
    );
end rgb2gray;

architecture Behavioral of rgb2gray is
    
begin
    process(clk) begin
        if(rising_edge(clk)) then
            gray<= std_logic_vector(unsigned(rgb(7 downto 0)) + unsigned(rgb(15 downto 8)) + unsigned(rgb(23 downto 16)));
        end if;
    end process;
end Behavioral;
