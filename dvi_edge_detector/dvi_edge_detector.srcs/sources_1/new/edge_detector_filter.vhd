----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2018 05:45:17 PM
-- Design Name: 
-- Module Name: edge_detector_filter - Behavioral
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

entity edge_detector_filter is
    Port (
        
        led : out std_logic_vector(1 downto 0);
        
        -- DVI 1.0 TMDS video interface
        hdmi_tx_clk_p : out std_logic;
        hdmi_tx_clk_n : out std_logic;
        hdmi_tx_d_p : out std_logic_vector(2 downto 0);
        hdmi_tx_d_n : out std_logic_vector(2 downto 0);
        
        -- and this?
        --SerialClk : in std_logic; -- 5x PixelClk
        
        -- DVI 1.0 TMDS video interface
        hdmi_rx_clk_p : in std_logic;
        hdmi_rx_clk_n : in std_logic;
        hdmi_rx_d_p : in std_logic_vector(2 downto 0);
        hdmi_rx_d_n : in std_logic_vector(2 downto 0);
        
        hdmi_rx_hpd : out std_logic := '1';
        
        -- Auxiliary signals 
        --RefClk : in std_logic; --200 MHz reference clock for IDELAYCTRL, reset, lock monitoring etc.
        sysclk : in std_logic;
        --aRst : in std_logic := '0'; --asynchronous reset; must be reset when RefClk is not within spec
        aRst_n : in std_logic; --asynchronous reset; must be reset when RefClk is not within spec
        
        -- Optional DDC port rx
        hdmi_rx_sda : inout std_logic;
        hdmi_rx_scl : inout std_logic;
        
        --pRst : in std_logic := '0'; -- synchronous reset; will restart locking procedure
        pRst_n : in std_logic--; -- synchronous reset; will restart locking procedure
        
        
        --aPixelClkLckd : out std_logic -- advanced use only; PixelClk and SerialClk stable
    );
end edge_detector_filter;

architecture Behavioral of edge_detector_filter is

    component clk_wiz_0
        Port(
            RefClk200 : out std_logic;
            --Status and control signals
            reset : in std_logic;
            locked : out std_logic;
            sysclk : in std_logic
        );
    end component;

    component rgb2dvi
        Generic(
            kGenerateSerialClk : boolean := true;
            kClkPrimitive : string := "MMCM"; -- "MMCM" or "PLL" to instantiate, if kGenerateSerialClk true
            kClkRange : natural := 1;  -- MULT_F = kClkRange*5 (choose >=120MHz=1, >=60MHz=2, >=40MHz=3)      
            kRstActiveHigh : boolean := true); --true, if active-high; false, if active-low
        Port(
            -- DVI 1.0 TMDS video interface
            TMDS_Clk_p : out std_logic;
            TMDS_Clk_n : out std_logic;
            TMDS_Data_p : out std_logic_vector(2 downto 0);
            TMDS_Data_n : out std_logic_vector(2 downto 0);
            
            -- Auxiliary signals 
            aRst : in std_logic; --asynchronous reset; must be reset when RefClk is not within spec
            aRst_n : in std_logic; --asynchronous reset; must be reset when RefClk is not within spec
            
            -- Video in
            vid_pData : in std_logic_vector(23 downto 0);
            vid_pVDE : in std_logic;
            vid_pHSync : in std_logic;
            vid_pVSync : in std_logic;
            PixelClk : in std_logic; --pixel-clock recovered from the DVI interface
            
            SerialClk : in std_logic -- 5x PixelClk
        );
   end component;
   
   component dvi2rgb
        Generic (
            kEmulateDDC : boolean := true; --will emulate a DDC EEPROM with basic EDID, if set to yes 
            kRstActiveHigh : boolean := true; --true, if active-high; false, if active-low
            kAddBUFG : boolean := true; --true, if PixelClk should be re-buffered with BUFG 
            kClkRange : natural := 2;  -- MULT_F = kClkRange*5 (choose >=120MHz=1, >=60MHz=2, >=40MHz=3)
            kEdidFileName : string := "900p_edid.data";  -- Select EDID file to use
            -- 7-series specific
            kIDLY_TapValuePs : natural := 78; --delay in ps per tap
            kIDLY_TapWidth : natural := 5); --number of bits for IDELAYE2 tap counter   
        Port (
            -- DVI 1.0 TMDS video interface
            TMDS_Clk_p : in std_logic;
            TMDS_Clk_n : in std_logic;
            TMDS_Data_p : in std_logic_vector(2 downto 0);
            TMDS_Data_n : in std_logic_vector(2 downto 0);
            
            -- Auxiliary signals 
            RefClk : in std_logic; --200 MHz reference clock for IDELAYCTRL, reset, lock monitoring etc.
            aRst : in std_logic; --asynchronous reset; must be reset when RefClk is not within spec
            aRst_n : in std_logic; --asynchronous reset; must be reset when RefClk is not within spec
            
            -- Video out
            vid_pData : out std_logic_vector(23 downto 0);
            vid_pVDE : out std_logic;
            vid_pHSync : out std_logic;
            vid_pVSync : out std_logic;
            
            PixelClk : out std_logic; --pixel-clock recovered from the DVI interface
            
            SerialClk : out std_logic; -- advanced use only; 5x PixelClk
            aPixelClkLckd : out std_logic; -- advanced use only; PixelClk and SerialClk stable
            
            -- Optional DDC port
            DDC_SDA_I : in std_logic;
            DDC_SDA_O : out std_logic;
            DDC_SDA_T : out std_logic;
            DDC_SCL_I : in std_logic;
            DDC_SCL_O : out std_logic; 
            DDC_SCL_T : out std_logic;
            
            pRst : in std_logic; -- synchronous reset; will restart locking procedure
            pRst_n : in std_logic -- synchronous reset; will restart locking procedure
        );
    end component;
    
    component iobuf
        Port(
            O : out std_logic; -- Output (from buffer)
            IO : inout std_logic; -- Port pin
            I : in std_logic; -- Input (to buffer)
            T : in std_logic -- Tristate control
        );
    end component;
    
    signal s_vid_pData : std_logic_vector(23 downto 0) := (others=>'0');
    signal ns_vid_pData : std_logic_vector(23 downto 0) := (others=>'0');
    signal s_vid_pVDE : std_logic;
    signal s_vid_pHSync : std_logic;
    signal s_vid_pVSync : std_logic;
    signal s_PixelClk : std_logic; --pixel-clock recovered from the DVI interface
    
    signal s_SerialClk : std_logic; -- 5x PixelClk
    
    signal s_RefClk : std_logic; --200 MHz reference clock for IDELAYCTRL, reset, lock monitoring etc.
    
    signal s_DDC_SDA_I : std_logic;
    signal s_DDC_SDA_O : std_logic;
    signal s_DDC_SDA_T : std_logic;
    signal s_DDC_SCL_I : std_logic;
    signal s_DDC_SCL_O : std_logic;
    signal s_DDC_SCL_T : std_logic;
    
    signal s_aRst : std_logic := '0';
    signal s_pRst : std_logic := '0';

begin

    ns_vid_pData <= not s_vid_pData;
    led(0) <= s_vid_pVDE;
    led(1) <= not s_vid_pVDE;
    
    cw_ref: clk_wiz_0
            Port map(
                RefClk200 => s_RefClk,
                --Status and control signals
                reset => '0',
                sysclk => sysclk
            );

    hdmiout: rgb2dvi
        Generic map(
            kGenerateSerialClk => true,
            kClkPrimitive => "MMCM", -- "MMCM" or "PLL" to instantiate, if kGenerateSerialClk true
            kClkRange => 1,  -- MULT_F = kClkRange*5 (choose >=120MHz=1, >=60MHz=2, >=40MHz=3)      
            kRstActiveHigh => true) --true, if active-high; false, if active-low
        Port map(
            -- DVI 1.0 TMDS video interface
            TMDS_Clk_p => hdmi_tx_clk_p,
            TMDS_Clk_n => hdmi_tx_clk_n,
            TMDS_Data_p => hdmi_tx_d_p,
            TMDS_Data_n => hdmi_tx_d_n,
            
            -- Auxiliary signals 
            aRst => s_aRst, --asynchronous reset; must be reset when RefClk is not within spec
            aRst_n => aRst_n, --asynchronous reset; must be reset when RefClk is not within spec
            
            -- Video in
            vid_pData => ns_vid_pData,
            vid_pVDE => s_vid_pVDE,
            vid_pHSync => s_vid_pHSync,
            vid_pVSync => s_vid_pVSync,
            PixelClk => s_PixelClk, --pixel-clock recovered from the DVI interface
            
            SerialClk => s_SerialClk -- 5x PixelClk
        );
   
   hdmiin: dvi2rgb
        Generic map(
            kEmulateDDC => true, --will emulate a DDC EEPROM with basic EDID, if set to yes 
            kRstActiveHigh => true, --true, if active-high; false, if active-low
            kAddBUFG => true, --true, if PixelClk should be re-buffered with BUFG 
            kClkRange => 2,  -- MULT_F = kClkRange*5 (choose >=120MHz=1, >=60MHz=2, >=40MHz=3)
            kEdidFileName => "900p_edid.data",  -- Select EDID file to use
            -- 7-series specific
            kIDLY_TapValuePs => 78, --delay in ps per tap
            kIDLY_TapWidth => 5 --number of bits for IDELAYE2 tap counter 
        )   
        Port map(
            -- DVI 1.0 TMDS video interface
            TMDS_Clk_p => hdmi_rx_clk_p,
            TMDS_Clk_n => hdmi_rx_clk_n,
            TMDS_Data_p => hdmi_rx_d_p,
            TMDS_Data_n => hdmi_rx_d_n,
            
            -- Auxiliary signals 
            RefClk => s_RefClk, --200 MHz reference clock for IDELAYCTRL, reset, lock monitoring etc.
            aRst => s_aRst, --asynchronous reset; must be reset when RefClk is not within spec
            aRst_n => aRst_n, --asynchronous reset; must be reset when RefClk is not within spec
            
            -- Video out
            vid_pData => s_vid_pData,
            vid_pVDE => s_vid_pVDE,
            vid_pHSync => s_vid_pHSync,
            vid_pVSync => s_vid_pVSync,
            
            PixelClk => s_PixelClk, --pixel-clock recovered from the DVI interface
            
            SerialClk => s_SerialClk, -- advanced use only; 5x PixelClk
            --aPixelClkLckd => aPixelClkLckd, -- advanced use only; PixelClk and SerialClk stable
            
            -- Optional DDC port
            DDC_SDA_I => s_DDC_SDA_I,
            DDC_SDA_O => s_DDC_SDA_O,
            DDC_SDA_T => S_DDC_SDA_T,
            DDC_SCL_I => S_DDC_SCL_I,
            DDC_SCL_O => S_DDC_SCL_O,
            DDC_SCL_T => S_DDC_SCL_T,
            
            pRst => s_pRst, -- synchronous reset; will restart locking procedure
            pRst_n => pRst_n -- synchronous reset; will restart locking procedure
        );
        
        sda_io: IOBUF
            Port map(
                I => s_DDC_SDA_O,
                IO => hdmi_rx_sda,
                O => s_DDC_SDA_I,
                T => s_DDC_SDA_T
            );
            
        scl_io: IOBUF
            Port map(
                I => s_DDC_SCL_O,
                IO => hdmi_rx_scl,
                O => s_DDC_SCL_I,
                T => s_DDC_SCL_T
            );

end Behavioral;