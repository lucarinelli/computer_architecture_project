----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Fanti Andrea
-- 
-- Create Date: 06/06/2018 03:59:56 PM
-- Design Name: 
-- Module Name: cyclo_storer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description V2: receives a signal in input, stores it in RAM using cycling
--                 indexes
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

entity cyclo_storer is
    generic(
        ADDR_WIDTH : natural := 16;     -- address bus width
        DATA_WIDTH : natural := 8;      -- data bus width
        BASE_ADDR  : std_logic_vector(integer range <>); -- base address to write to RAM
        ROW_NUM    : natural := 8;      -- number of rows
        ROW_LEN    : natural := 1920;   -- length of each row
    );
    port(
        clk : in std_logic; -- clock

        -- to be linked to RAM
        abus : in std_logic_vector(ADDR_WIDTH-1 downto 0);
        dout : in std_logic_vector(DATA_WIDTH-1 downto 0);
        ready : out std_logic:= '0'; -- '1'-> data is ready to be stored on RAM

        wr_en : in std_logic:= '0' -- write enable (on RAM) (keeping this low is like zeroing clk)
    )
end cyclo_storer;

architecture Behavioral of cyclo_storer is
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

-- vim:tabstop=4 shiftwidth=4
-- vim:expandtab
