----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Fanti Andrea
-- 
-- Create Date: 07/07/2018 04:34:53 PM
-- Design Name: 
-- Module Name: timings_calculator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--  calculates the timings (in pixel time) of the screen image whose control signals are in input
--  specifically, it calculates the video resolution and how many non-active pixels
--  are transmitted after hsync goes up, and how many after vsync goes down
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

entity timings_calculator is
    Generic (
        RES_BUS_WIDTH : natural := 11; -- width of the buses res_x and res_y
        VOID_BUS_WIDTH : natural := 10; -- width of the buses void_x and void_y
        -- default values (given at the start of the circuit)
        --  (here 1080p values taken from https://timetoexplore.net/blog/video-timings-vga-720p-1080p)
        DEFAULT_RES_X : natural := 1920;
        DEFAULT_RES_Y : natural := 1080;
        DEFAULT_VOID_X : natural := 280;
        DEFAULT_VOID_Y : natural := 45
    );
    Port (
        pixel_clock : in STD_LOGIC;
        hsync : in STD_LOGIC;
        vsync : in STD_LOGIC;
        de : in STD_LOGIC;  -- data enable: 1 when video is being transmitted
        
        -- detected pixel timings
        -- number of active horizontal video pixel
        res_x : out STD_LOGIC_VECTOR (RES_BUS_WIDTH-1 downto 0) := std_logic_vector(to_unsigned(DEFAULT_RES_X, RES_BUS_WIDTH));
        -- number of active vertical video pixel
        res_y : out STD_LOGIC_VECTOR (RES_BUS_WIDTH-1 downto 0) := std_logic_vector(to_unsigned(DEFAULT_RES_Y, RES_BUS_WIDTH));
        -- number of pixels transmitted after a rising edge on hsync before video transmission 
        void_x : out STD_LOGIC_VECTOR (VOID_BUS_WIDTH-1 downto 0) := std_logic_vector(to_unsigned(DEFAULT_VOID_X, VOID_BUS_WIDTH));
        -- number of rows transmitted after a falling edge on vsync before video transmission 
        void_y : out STD_LOGIC_VECTOR (VOID_BUS_WIDTH-1 downto 0) := std_logic_vector(to_unsigned(DEFAULT_VOID_Y, VOID_BUS_WIDTH))
    );
end timings_calculator;

architecture Behavioral of timings_calculator is
    -- total (active & not) pixels
    signal void_x_tmp : natural := 0;
    signal void_y_tmp : natural := 0;
    -- active video resolution
    signal vid_x : natural := 0;
    signal vid_y : natural := 0;
    signal hsync_old, vsync_old : std_logic := '0';
begin
    process (pixel_clock, hsync, vsync)
    begin
        if rising_edge(pixel_clock) then
            
            
            if hsync ='1' then
                if hsync_old = '0' then -- hsync 0>1
                    
                else
                    void_x_tmp <= void_x_tmp+1;
                end if;
            end if;
        end if;
    end process;

end Behavioral;
