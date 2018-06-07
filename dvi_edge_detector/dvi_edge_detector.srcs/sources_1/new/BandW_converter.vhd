----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Fanti Andrea
-- 
-- Create Date: 06/06/2018 03:59:56 PM
-- Design Name: 
-- Module Name: BandW_converter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: receives a single pixel in input, converts it in black & white,
-- then stores it in memory
-- color:       color in input
-- pix_clk:     pixel clock (circuit reads on rising edge)
-- store_enable:enables write of image (can be used to freeze the image)
-- sync:        tell the component the next pixel is the first of the image
-- abus:        address bus of the ram
-- dout:        converted pixel (to be written on RAM)
-- d_ready:     goes up when data has to be written on the RAM
--              if always connected to write enable of the RAM doesn't do damage as the
--              address is written on the abus only just before the write
--  NOTE: this code assumes there is always space left on the RAM to write
--        (no bounds check)
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

entity BandW_converter is
    generic(
        -- base address to use when writing to ram
        BASE_ADDR : unsigned(9 downto 0):= "0000000000"
    );
    Port (
        pix_clk : in std_logic;
        color : in std_logic_vector (23 downto 0);
        store_enable: in std_logic;
        sync: in std_logic;
        abus: out std_logic_vector(9 downto 0);
        dout : out std_logic_vector(7 downto 0);
        d_ready : out std_logic := '0'
    );
end BandW_converter;



architecture Behavioral of BandW_converter is
    type byte_array is array (integer range <>) of std_logic_vector(7 downto 0);

    signal addr : unsigned(9 downto 0):= "0000000000";

begin
    process (pix_clk, store_enable) begin
        if (rising_edge(pix_clk) and store_enable='1') then
            d_ready <= '0';
            -- doing the average between color components...
            abus <= std_logic_vector(addr+1);
            dout <= std_logic_vector((unsigned(color(0 to 7)) + unsigned(color(8 to 15)) + unsigned(color(16 to 23)))/3);
            d_ready <= '1';
            addr<= addr+ 1;
        end if;
    end process;
    
    process (sync) begin
        if (sync= '1') then
            addr <= BASE_ADDR;
        end if;
    end process;
end Behavioral;

--vim:tabstop=4 shiftwidth=4
--vim:expandtab
