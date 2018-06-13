----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2018 10:41:26 PM
-- Design Name: Very ignorant deserializer
-- Module Name: deserializer - Behavioral
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

entity deserializer is
    Generic(
        WIDTH : natural := 32
    );
    Port (
        d_in : in std_logic;
        d_out : out std_logic_vector(WIDTH-1 downto 0);
        d_out_valid : out std_logic := '0';
        reset : in std_logic;
        pixel_clock : in std_logic;
        d_in_valid : in std_logic
    );
end deserializer;

architecture Behavioral of deserializer is
    
    signal internal: std_logic_vector (WIDTH-1 downto 0) := (others => '0');
    signal flush_needed : std_logic := '0';
    
begin

    process(pixel_clock,d_in_valid)
        variable count : integer range 0 to WIDTH-1 := 0;
    begin
        if(pixel_clock'event and pixel_clock='1') then
            if d_in_valid='1' then
                internal(count)<=d_in;
                if(count=WIDTH-1) then 
                    d_out_valid <= '1';
                    d_out <= internal;
                else d_out_valid <= '0';
                end if;
                count:= count + 1;
                flush_needed <= '1';
            elsif flush_needed='1' then
                d_out_valid <= '1';
                count := 0;
                flush_needed <= '0';
            else
                d_out_valid <= '0';
            end if;
--            internal(0)<= d_in;
--            internal<= internal(WIDTH-1)& internal(WIDTH-2 downto 0);
--            count:= count+1;
        end if;
    end process;
    
--    process(reset)
--    begin
--    if reset='1' then
--        flush_needed <= '1';
--    end if;
--    end process;

end Behavioral;