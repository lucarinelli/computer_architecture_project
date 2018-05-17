----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2018 11:51:14 PM
-- Design Name: 
-- Module Name: hdmi_controller - Behavioral
-- Project Name: HDMI monitor destroyer
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.5 - little hope that this works
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
library UNISIM;
use UNISIM.VComponents.all;

entity hdmi_controller is
    Port (
        reset : in std_logic;
        clk_sys : in STD_LOGIC; --  25 MHz for 640x480@60Hz

        -- the 3 TDMS channels from the serializers + clock channel (all [pos, neg])
        --ch0, ch1, ch2, chclk : out std_logic_vector(1 downto 0);
        
        -- the 3 TDMS channels, (positives and negatives as they are differentials)
        chp, chn : out std_logic_vector(2 downto 0);
        -- clock channel
        chclk : out std_logic_vector(1 downto 0);
        color_select : in STD_LOGIC_VECTOR (1 downto 0); --  color selection from a palette
        
        leds : out std_logic_vector(3 downto 0);  --  changes state when a frame has been transmitted
        
        --easter egg
        btn : in std_logic_vector (3 downto 0)
    );
end hdmi_controller;

architecture Behavioral of hdmi_controller is
    component tmds_transmitter
        Port(

            pixel_clock, pixel_clock_x10, hsync, vsync : in std_logic;
            control : in std_logic_vector (3 downto 0);
            mode : in std_logic_vector (2 downto 0);
            RGB : in std_logic_vector (23 downto 0);
            channels_out : out std_logic_vector(2 downto 0)
            --c0_p, c1_p, c2_p, c_clock_p, c0_n, c1_n, c2_n, c_clock_n : out std_logic
        );
    end component;
    
    component clk_wiz_hdmi is
        port(
            clk_out1 : out std_logic;
            clk_out2 : out std_logic;
            reset : in std_logic;
            locked : out std_logic;
            clk_in1 : in std_logic
        );
    end component;
    
    signal control : std_logic_vector(3 downto 0);
    signal hsync, vsync : std_logic;
    signal mode : std_logic_vector(2 downto 0);
    signal color : std_logic_vector(23 downto 0) := (others => '0');  --  color in RGB
    signal ch : std_logic_vector(2 downto 0); -- stores the output from the transmitter (to convert it into differential)
    signal clk, clkx10 : std_logic;
    
    
    -- standard VGA resolution
    constant XRES : natural := 640;
    constant YRES : natural := 480;
    constant HBLANK : natural := 160;   --  #columns used for horizontal blanking
    constant VBLANK : natural := 45;    --  #rows used for vertical blanking

    -- to be applied to mode
    constant VIDEO_GUARD_MODE : std_logic_vector := "100";
    constant VIDEO_TX_MODE : std_logic_vector := "010";
    constant DATA_TX_MODE: std_logic_vector := "011";
    constant DATA_GUARD_MODE : std_logic_vector := "101";
    constant CTRL_MODE : std_logic_vector := "111";
    
    -- to be applied to control
    -- these are the possible preambles
    --only used when in control mode
    constant CTRL_PREVIDEO : std_logic_vector := "1000";    --  TODO: check if order is CTL0..CTL3
    constant CTRL_PREDATA : std_logic_vector := "1010";

    --transmission is:
    --preamble (video||data) -> guard (video||data, 2 pixel duration) -> transmission 
    
    --easter egg
    constant max_bv : natural := 10;
    constant rect_dist_side : natural := 5;
    constant h_rect : natural := 50;
    constant w_rect : natural := 10;
    constant rect_speed : natural := 2;
    signal pos1, pos2 : natural range -rect_speed*2 to YRES-h_rect := (YRES-h_rect)/2;
    constant b_side : natural := 10;
    signal bposx: integer range -max_bv to XRES-b_side+max_bv := (XRES-b_side)/2;
    signal bposy: integer range -max_bv to YRES-b_side+max_bv := (YRES-b_side)/2;
    signal g_o: boolean := false;
    signal sco1, sco2 : std_logic_vector := "00";
    signal f_counter : natural range 0 to 3 := 0;
    signal bvx, bvy : integer range -7 to 7 := 2;
    
    
    signal led : std_logic := '0';
begin
    --  transforms 125MHz clock of the board to 25MHz and 250MHz needed in the TDMS link
    clk_wiz_hdmi_0 : clk_wiz_hdmi
            port map(
            clk_out1 => clk,
            clk_out2 => clkx10,
            reset => '0',
            clk_in1 => clk_sys
        );
-- DIFFERENTIAL OUTPUTS---------------
    --clock
    OBUFDS_clk : OBUFDS
        port map (
            O => chclk(0),
            OB => chclk(1),
            I => clk  
        );
        
    --  CHANNEL 0 (blue) 
    OBUFDS_0b : OBUFDS
        port map (
            O => chp(0),
            OB => chn(0),
            I => ch(0)
        );
    --  CHANNEL 1 (green)
    OBUFDS_1g : OBUFDS
        port map (
            O => chp(1),
            OB => chn(1),
            I => ch(1)
        );
    --  CHANNEL 2 (red)
    OBUFDS_2r : OBUFDS
        port map (
            O => chp(2),
            OB => chn(2),
            I => ch(2)
        );
--------------------------------------
    tdms_tx : tmds_transmitter
        port map(
            pixel_clock => clk,
            pixel_clock_x10 => clkx10,
            hsync => hsync,
            vsync => vsync,
            control => control,
            mode => mode,
            RGB => color,
            channels_out => ch
        );
--------------------------------------
    process(clk)
        --"indexes" of the video matrix
        --when negative the screen is blanking
        variable x : integer range -HBLANK to XRES:= -HBLANK;
        variable y : integer range -VBLANK to YRES:= -VBLANK;
    begin
    if (rising_edge(clk)) then
        report "trasmitting pixel " &integer'image(y) &"," &integer'image(x);
        
        --controlling vsync & hsync
        if y=10-VBLANK or y=11-VBLANK then
            vsync <= '0';
        else
            vsync <= '1';
        end if;
        if x>16-HBLANK and x<=112-HBLANK then
            hsync <= '0';
        else
            hsync <= '1';
        end if;
        --end vsync & hsync
        
        --controlling mode
        if y>=0 and x>=0 then
            mode <= VIDEO_TX_MODE;      
        else
            mode <= CTRL_MODE;
        end if;
        -- end mode
        
        --easter egg
        if(color_select="11" and y=-1 and x=0) then
            --scores
            leds(3 downto 2) <= sco1;
            leds(1 downto 0) <= sco2;
        
            if btn(3)='1' and pos1>0 then
                pos1 <= pos1-rect_speed;
            end if;
            if btn(2)='1' and pos1<YRES-h_rect then
                pos1 <= pos1+rect_speed;
            end if;
            if btn(1)='1' and pos2>0 then
                pos2 <= pos2-rect_speed;
            end if;
            if btn(0)='1' and pos2<YRES-h_rect then
                pos2 <= pos2+rect_speed;
            end if;
            
            bposx <= bposx + bvx;
            bposy <= bposy + bvy;
            
            if ((bposy<0 and bvy<0) or (bposy>YRES-b_side and bvy>0)) then
                bvy <= -bvy;
            end if;
            if (bposx<=rect_dist_side+w_rect and bvx<0) then
                if( bposy>pos1 and bposy<=pos1+h_rect ) then
                    bvx <= -bvx;
                else
                    -- RESET
                    bposx<=(XRES-b_side)/2;
                    bposy<=(YRES-b_side)/2;
                    bvx<= -bvx;
                    --g_o <= true;
                end if;
            end if;
            if (bposx>=XRES-rect_dist_side-w_rect-b_side and bvx>0) then
                if( bposy>pos2 and bposy<=pos2+h_rect ) then
                    bvx <= -bvx;
                else
                    -- RESET
                    bposx<=(XRES-b_side)/2;
                    bposy<=(YRES-b_side)/2;
                    bvx<= -bvx;
                    --g_o <= true;
                end if;
            end if;
        end if;
        
        --controlling control
        control <= "0000";
        -- end control
        
        -- controlling video tx
        if (y>=0 and x>=0) then
            case color_select is
                when "00" => color <= "111111110000000000000000"; -- RED
                when "01" => color <= "000000001111111100000000"; -- GREEN 
                when "10" => color <= "000000000000000011111111"; -- BLUE
                when others =>
                    --easter egg
                    --if(g_o=false) then 
                        color <= "000000000000000000000000";
                        if(x>rect_dist_side and x<=rect_dist_side+w_rect and y>pos1 and y<=pos1+h_rect) then
                            color <= "111111111111111111111111";
                        end if;
                        if(x>XRES-rect_dist_side-w_rect and x<=XRES-rect_dist_side and y>pos2 and y<=pos2+h_rect) then
                            color <= "111111111111111111111111";
                        end if;
                        if(x>bposx and x<=bposx+b_side and y>bposy and y<=bposy+b_side) then
                            color <= "111111111111111111111111";
                        end if;
                    --end if;
                    
            end case;
        end if;
        
        -- updating coordinates to the next pixel
        x := x+1;
        if (x = XRES) then
            x:= -HBLANK;
            y:= y+1;
            if (y= YRES) then
                y:= -VBLANK;
                report "complete screen image transmitted!";
                -- easter egg
                if f_counter = 3 then f_counter <= 0;
                else f_counter <= f_counter + 1;
                end if;
                -- edn easter egg
                if color_select/="11" then
                    led <= not led;
                    leds(0) <= led;
                end if;
            end if;
        end if;
    end if;
    end process;
end Behavioral;