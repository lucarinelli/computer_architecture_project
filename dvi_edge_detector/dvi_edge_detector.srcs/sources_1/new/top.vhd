----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2018 11:24:22 AM
-- Design Name: 
-- Module Name: top - Behavioral
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

library mydvi;
use mydvi.merge_v2;

--library myram;
--use myram.block_ram;

--library digilent;
--use digilent.rgb2dvi;
--use digilent.dvi2rgb;
library xil_defaultlib;
use xil_defaultlib.rgb2dvi;
use xil_defaultlib.dvi2rgb;

--library xil_defaultlib;
--use xil_defaultlib.clk_wiz_0;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port (
        led : out STD_LOGIC_VECTOR (3 downto 0);
        -- output dvi/hdmi --
        --clock
        dvi_tx_clk_p : out STD_LOGIC;
        dvi_tx_clk_n : out STD_LOGIC;
        --data
        dvi_tx_d_p : out STD_LOGIC_VECTOR (2 downto 0);
        dvi_tx_d_n : out STD_LOGIC_VECTOR (2 downto 0);
        -- input dvi/hdmi --
        --clock
        dvi_rx_clk_p : in STD_LOGIC;
        dvi_rx_clk_n : in STD_LOGIC;
        --data
        dvi_rx_d_p : in STD_LOGIC_VECTOR (2 downto 0);
        dvi_rx_d_n : in STD_LOGIC_VECTOR (2 downto 0);
        --DDC channel to transmit EDID
        dvi_rx_sda : inout STD_LOGIC;
        dvi_rx_scl : inout STD_LOGIC;
        --
        dvi_rx_hpd : out STD_LOGIC := '1'; -- hot plug detect
        
        sysclk : in STD_LOGIC -- 125 MHz of the board
    );
end top;

architecture Behavioral of top is
    component iobuf
        Port(
            O : out std_logic;
            IO : inout std_logic;
            I : in std_logic;
            T : in std_logic
        );
    end component;
    component edge_matrix_applier
        Generic(
            counter_bit_size: natural := 11;
            DEPTH: natural := 4;
            WIDTH: natural := 1920;
            RES_HEIGHT: natural := 1080;
            THRESHOLD: natural := 4900
        );
        Port(
            grey: in std_logic_vector(7 downto 0);
            pixel_clock: in std_logic;
            video_enable: in std_logic;
            hsync: in std_logic;
            vsync: in std_logic;
            
            bicolor: out std_logic;
            bicolor_ready: out std_logic
        );
    end component;
    --generated components
    component block_ram
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            clkb : IN STD_LOGIC;
            enb : IN STD_LOGIC;
            addrb : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
          );
    end component;
    component clk_wiz -- clock wizard
        port (
            -- Clock out ports
            memoryClock : out std_logic;
            referenceClock : out std_logic;
            -- Status and control signals
            reset : in std_logic;
            locked : out std_logic;
            -- Clock in ports
            systemClock : in std_logic
        );
    end component;
    
    -------------------------------- CONSTANTS --------------------------------
    --resolution
    constant RES_X : natural := 1600;
    constant RES_Y : natural := 900;
    --memory
    constant RDBUS_WIDTH : natural := 64; -- rdbus=read data bus (data bus used when reading from ram)
    constant RABUS_WIDTH : natural := 15; -- rabus=read address bus (address bus used when reading from ram)
    constant WDBUS_WIDTH : natural := 32;
    constant WABUS_WIDTH : natural := 16;
    
    -------------------------------- SIGNALS --------------------------------
    -- clocks
    signal mem_clk, pix_clk, ref_clk : std_logic;
    signal serial_clk : std_logic; -- used internally by rgb2dvi and dvi2rgb
    
    -- memory, block ram
    -- dbus
    signal mem_rdbus : std_logic_vector(RDBUS_WIDTH-1 downto 0);
    signal mem_wdbus : std_logic_vector(WDBUS_WIDTH-1 downto 0);
    -- abus
    signal mem_rabus : std_logic_vector(RABUS_WIDTH-1 downto 0);
    signal mem_wabus : std_logic_vector(WABUS_WIDTH-1 downto 0);
    -- enables
    signal mem_wen, mem_ren : std_logic; -- write enable, read enable
    
    -- dvi/hdmi interface
    signal rgb : std_logic_vector(23 downto 0);
    signal vde : std_logic; -- video data enable (1 -> receiving video, rgb signal valid)
    signal hsync, vsync : std_logic;
    -- DDC to transmit edid
    signal DDC_SDA_I, DDC_SDA_O, DDC_SDA_T : std_logic;
    signal DDC_SCL_I, DDC_SCL_O, DDC_SCL_T : std_logic;
    
    --other
    signal elaborated_rgb : std_logic_vector(23 downto 0);
    signal reset : std_logic := '0';
    signal reset_n : std_logic := '1';
begin
    
    clock_wizard : clk_wiz 
        port map(
            -- Clock out ports
            memoryClock => mem_clk, -- 50 MHz
            referenceClock => ref_clk, -- 200 MHz
            -- Status and control signals
            reset => reset,
            locked => open,
            -- Clock in ports
            systemClock => sysclk -- 125 MHz
        );
    
    hdmiin : entity xil_defaultlib.dvi2rgb
        generic map(
            kEmulateDDC => true, --will emulate a DDC EEPROM with basic EDID, if set to yes 
            kRstActiveHigh => true, --true, if active-high; false, if active-low
            kAddBUFG => true, --true, if PixelClk should be re-buffered with BUFG 
            kClkRange => 2,  -- MULT_F = kClkRange*5 (choose >=120MHz=1, >=60MHz=2, >=40MHz=3)
            kEdidFileName =>  "/home/andrea/polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/imports/sources_1/imports/Desktop/dvi2rgb_v1_7/src/900p_edid.data",  -- Select EDID file to use
            kIDLY_TapValuePs => 78, --delay in ps per tap
            kIDLY_TapWidth => 5 --number of bits for IDELAYE2 tap counter   
        )
        port map(
            -- TMDS link
            TMDS_Clk_p => dvi_rx_clk_p,
            TMDS_Clk_n => dvi_rx_clk_n,
            TMDS_Data_p => dvi_rx_d_p,
            TMDS_Data_n => dvi_rx_d_n,
            RefClk => ref_clk, --200 MHz reference clock for IDELAYCTRL, reset, lock monitoring etc.
            aRst => reset, --asynchronous reset; must be reset when RefClk is not within spec
            aRst_n => reset_n,
            -- Video
            vid_pData => rgb,
            vid_pVDE => vde,
            vid_pHSync => hsync,
            vid_pVSync => vsync,
            PixelClk => pix_clk,
            SerialClk => serial_clk,
            aPixelClkLckd => open,
            -- Optional DDC port
            DDC_SDA_I => DDC_SDA_I,
            DDC_SDA_O => DDC_SDA_O,
            DDC_SDA_T => DDC_SDA_T,
            DDC_SCL_I => DDC_SCL_I,
            DDC_SCL_O => DDC_SCL_O,
            DDC_SCL_T => DDC_SCL_T,
            
            pRst => reset, -- synchronous reset; will restart locking procedure
            pRst_n => reset_n
        );
    
    hdmiout : entity xil_defaultlib.rgb2dvi
        generic map(
            kGenerateSerialClk => false, -- we already have it from dvi2rgb (TODO check if this work)
            kClkPrimitive => "MMCM", -- "MMCM" or "PLL" to instantiate, if kGenerateSerialClk true
            kClkRange => 1,  -- MULT_F = kClkRange*5 (choose >=120MHz=1, >=60MHz=2, >=40MHz=3)      
            kRstActiveHigh => true --true, if active-high; false, if active-low
        )
        port map(
            -- TMDS link
            TMDS_Clk_p => dvi_tx_clk_p,
            TMDS_Clk_n => dvi_tx_clk_p,
            TMDS_Data_p => dvi_tx_d_p,
            TMDS_Data_n => dvi_tx_d_n,
            -- Auxiliary signals 
            aRst => reset,
            aRst_n => reset_n,
            -- Video in
            vid_pData => elaborated_rgb,
            vid_pVDE => vde,
            vid_pHSync => hsync,
            vid_pVSync => vsync,
            PixelClk => pix_clk,
            SerialClk => serial_clk
        );
    
    bicolor_framebuffer : block_ram
        port map (
            -- write port
            clka => mem_clk,
            wea(0) => mem_wen,
            addra => mem_wabus,
            dina => mem_wdbus,
            -- read port
            clkb => mem_clk,
            enb => mem_ren,
            addrb => mem_rabus,
            doutb => mem_rdbus
        );
    
    merger : entity mydvi.merge_v2
        Generic map (
            WIDTH => RES_X,
            HEIGHT => RES_Y,
            DBUS_SIZE => RDBUS_WIDTH,
            MEM_ADDR_SIZE => RABUS_WIDTH
        )
        Port map (
            vsync => vsync,
            hsync => hsync,
            de => vde,
            mem_d_in => mem_rdbus,
            pixel_clock => pix_clk,
            
            mem_clk => mem_clk,
            mem_raddr => mem_rabus,
            mem_ren => mem_ren,
            
            rgb_in => rgb,
            rgb_out => elaborated_rgb
        );
    
    sda_io: IOBUF
        Port map(
            I => DDC_SDA_O,
            IO => dvi_rx_sda,
            O => DDC_SDA_I,
            T => DDC_SDA_T
        );
        
    scl_io: IOBUF
        Port map(
            I => DDC_SCL_O,
            IO => dvi_rx_scl,
            O => DDC_SCL_I,
            T => DDC_SCL_T
        );
    
    -- temporary code --
    --elaborated_rgb <= rgb;
    --
    
    -- TODO :
    --  . metti lo stesso clock alle due porte della RAM
    --  + prova a collegare la ram al merger e vedere se nella sintesi rimane collegato
    --  + collega il resto
    --  + risolvi i bug
    --  + finisci il progetto
    --  + festeggia
    
end Behavioral;
