----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/13/2018 06:30:01 PM
-- Design Name: 
-- Module Name: memory_addr_calc - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memory_addr_calc is
    generic (
        BLOCK_NUM : natural := 60
    );
    Port ( row_start : in STD_LOGIC; -- 1 -> row is starting
           idx_reset : in STD_LOGIC; -- resets indexes (active low)
           valid : in STD_LOGIC; -- 1 when word is ready
           wena : out STD_LOGIC; -- write enable
           addr : out STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC --Pixel_clock
       );
end memory_addr_calc;

architecture Behavioral of memory_addr_calc is
    signal x : natural range 0 to BLOCK_NUM-1; -- block index
    signal y : integer range -1 to 1079;
begin
    process (clk,idx_reset,row_start,valid) begin
        if rising_edge(clk) then
            if idx_reset = '0' then
                x<= 0; 
                y<=-1;
            elsif row_start='1' then
                y<= y+1;
                x<= 0;
            elsif valid='1' then
                addr <= std_logic_vector(to_unsigned(BLOCK_NUM*y+ x, 16));
            end if;
        end if;
    end process;
    
    wena <= valid;
end Behavioral;






