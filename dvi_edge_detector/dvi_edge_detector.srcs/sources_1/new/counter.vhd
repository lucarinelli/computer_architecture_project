----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2018 05:51:03 PM
-- Design Name: 
-- Module Name: counter - Behavioral
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
use IEEE.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity counter is
    Generic (
        bit_size : natural := 11
    );
    Port (
        inc : in STD_LOGIC;
        rst : in STD_LOGIC;
        value : out STD_LOGIC_VECTOR (bit_size-1 downto 0) := (others=>'0')
    );
end counter;

architecture Behavioral of counter is
    signal count : natural range 0 to 2**(bit_size);
begin
    value <= std_logic_vector(to_unsigned(count,bit_size));
    
    process(rst,inc)
    begin
        if rst='1' then
            count <= 0;
            value <= (others=>'0');
        elsif rising_edge(inc) then
            count <= count + 1;
            value <= std_logic_vector(to_unsigned(count, bit_size));
        end if;
    end process;

end Behavioral;
