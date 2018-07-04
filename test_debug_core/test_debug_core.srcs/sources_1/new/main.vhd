----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/23/2018 11:53:52 PM
-- Design Name: 
-- Module Name: main - Behavioral
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

entity main is
    Port ( btn : in std_logic_vector (1 downto 0);
           sysclk : in STD_LOGIC;
           led : out STD_LOGIC);
end main;

architecture Behavioral of main is
    signal b1, b0, l : std_logic := '0';
begin
    
    b0 <= btn(0);
    b1 <= btn(1);
    led <= l;
    
    process(sysclk) begin
    
        if rising_edge(sysclk) then
            if b0='1' and b1='1' then
                l <= b0 and b1;
            else
                l <= '0';
            end if;
        end if;
    
    end process;
    


end Behavioral;
