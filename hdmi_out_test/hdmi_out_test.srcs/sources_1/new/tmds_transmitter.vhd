----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2018 11:32:12 PM
-- Design Name: 
-- Module Name: tmds_transmitter - Behavioral
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

--type mode_t is (
--        CONTROL_PERIOD,
--        VIDEO_PREAMBLE,
--        VIDEO_LEADING_GUARD_BAND,
--        VIDEO,
--        DATA_ISLAND_PREAMBLE,
--        DATA_ISLAND_LEADING_GUARD_BAND,
--        DATA_ISLAND,
--        DATA_ISLAND_TRAILING_GUARD_BAND
--    );

entity tmds_transmitter is
    Generic(
        dvi_mode : boolean := false
    );
    Port(
        pixel_clock, pixel_clock_x10, hsync, vsync : in STD_LOGIC;
        control : in STD_LOGIC_VECTOR (3 downto 0);
        mode : in std_logic_vector(2 downto 0);
        RGB : in STD_LOGIC_VECTOR (23 downto 0);
        channels_out : out std_logic_vector(2 downto 0) := "111"
    );
end tmds_transmitter;

architecture Behavioral of tmds_transmitter is
    
    
    
    component tmds_encoder
        generic (
            channel_num : natural range 0 to 2 := 0
        );
        Port (
            clk : in STD_LOGIC;
            clkx10 : in STD_LOGIC;
            mode : in std_logic_vector(2 downto 0);
            control : in STD_LOGIC_VECTOR (1 downto 0);
            HSYNC : in std_logic;
            VSYNC : in std_logic;
            d_in : in STD_LOGIC_VECTOR (7 downto 0);
            tmds_o : out std_logic
        );
    end component;
    
--    signal R_out : std_logic_vector (9 downto 0);
--    signal G_out : std_logic_vector (9 downto 0);
--    signal B_out : std_logic_vector (9 downto 0);
--    signal c0, c1, c2 : std_logic;
    
begin
    
--    tmds_encoder_generate: for ch_i in 0 to 2
--        generate
--        tmds_encoder_inst : tmds_encoder
--            generic map (channel_num => ch_i)
--            port map(
--                clk => pixel_clock,
--                clkx10 => pixel_clock_x10,
--                mode => mode,
--                control =>control,
--                HSYNC => hsync,
--                VSYNC => vsync,
--                d_in => RGB(8*ch_i + 7 downto  8 * ch_i),
--                out_n => channels_out_n(ch_i),
--                out_p => channels_out_p(ch_i)
--            );
--        end generate;

    --  CHANNEL 0 (blue)
    tmds_enc0 : tmds_encoder
        generic map (channel_num => 0)
        port map(
            clk => pixel_clock,
            clkx10 => pixel_clock_x10,
            mode => mode,
            control(0) => hsync,
            control(1) => vsync,
            HSYNC => hsync,
            VSYNC => vsync,
            d_in => RGB(7 downto 0),
            tmds_o => channels_out(0)
        );
    --  CHANNEL 1 (green)
    tmds_enc1 : tmds_encoder
        generic map (channel_num => 1)
        port map(
            clk => pixel_clock,
            clkx10 => pixel_clock_x10,
            mode => mode,
            control => control(1 downto 0),
            HSYNC => hsync,
            VSYNC => vsync,
            d_in => RGB(15 downto 8),
            tmds_o => channels_out(1)
        );
    --  CHANNEL 2 (red)
    tmds_enc2 : tmds_encoder
        generic map (channel_num => 2)
        port map(
            clk => pixel_clock,
            clkx10 => pixel_clock_x10,
            mode => mode,
            control => control(3 downto 2),
            HSYNC => hsync,
            VSYNC => vsync,
            d_in => RGB(23 downto 16),
            tmds_o => channels_out(2)
        );
    --process(pixel_clock) begin
        
    --end process;
end Behavioral;
