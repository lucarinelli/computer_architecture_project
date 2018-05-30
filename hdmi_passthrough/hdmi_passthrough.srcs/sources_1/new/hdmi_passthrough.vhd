----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2018 10:44:02 PM
-- Design Name: 
-- Module Name: hdmi_passthrough - Behavioral
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
library UNISIM;
use UNISIM.VComponents.all;

entity hdmi_passthrough is
    Port (
        hdmi_rx_clk_n : in std_logic;
        hdmi_rx_clk_p : in std_logic;
        hdmi_rx_d_n : in std_logic_vector(2 downto 0);
        hdmi_rx_d_p : in std_logic_vector(2 downto 0);
        
        hdmi_rx_hpd : out std_logic := '1';
        
        led : out std_logic_vector(1 downto 0);
        
        sysclk : in std_logic
    );
end hdmi_passthrough;

architecture Behavioral of hdmi_passthrough is

    component hdmi_receiver is
        Port (
            ch_in : in std_logic_vector (2 downto 0);
            
            pixel_clock : in std_logic;
            pixel_clock_x10 : in std_logic;
            
            reset : in std_logic;
            
            vsync : out std_logic := '0';
            hsync : out std_logic := '0';
            rgb : out std_logic_vector (23 downto 0) := (others => '0');
            rgb_valid : out std_logic := '0';
            aux : out std_logic_vector (8 downto 0) := (others => '0');
            aux_valid : out std_logic := '0';
            raw_data : out std_logic_vector(29 downto 0) := (others => '0');
            raw_data_valid : out std_logic := '0'
        );
    end component;
    
    component clk_wiz_0 is
        Port(
            -- Clock out ports
            clk_out1 : out std_logic;
            clk_out2 : out std_logic;
            -- Status and control signals
            reset : in std_logic;
            locked : out std_logic;
            -- Clock in ports
            clk_in1 : in std_logic
        );
    end component;
    
    
    
    signal clk : std_logic := '0';
    signal clkx10 : std_logic := '0';
    
    signal chs : std_logic_vector(2 downto 0);

begin

--    --clock
--    IBUFDS_clk : IBUFDS
--        port map (
--            O => clk,
--            IB => hdmi_rx_clk_n,
--            I => hdmi_rx_clk_p 
--        );
        
    --  CHANNEL 0 (blue) 
    IBUFDS_0b : IBUFDS
        port map (
            O => chs(0),
            IB => hdmi_rx_d_n(0),
            I => hdmi_rx_d_p(0)
        );
    --  CHANNEL 1 (green)
    IBUFDS_1g : IBUFDS
        port map (
            O => chs(1),
            IB => hdmi_rx_d_n(1),
            I => hdmi_rx_d_p(1)
        );
    --  CHANNEL 2 (red)
    IBUFDS_2r : IBUFDS
        port map (
            O => chs(2),
            IB => hdmi_rx_d_n(2),
            I => hdmi_rx_d_p(2)
        );
    
    cw : clk_wiz_0 
        Port map(
            -- Clock out ports
            clk_out1 => clk,
            clk_out2 => clkx10,
            -- Status and control signals
            reset => '0',
            --locked : out std_logic;
            -- Clock in ports
            clk_in1 => sysclk
        );
        
    hr: hdmi_receiver
        Port map(
            ch_in => chs,
            
            pixel_clock => clk,
            pixel_clock_x10 => clkx10,
            
            reset => '0',
            
            vsync => led(1),
            --hsync : out std_logic := '0';
            --rgb : out std_logic_vector (23 downto 0) := (others => '0');
            rgb_valid => led(0)
            --aux : out std_logic_vector (8 downto 0) := (others => '0');
            --aux_valid : out std_logic := '0';
            --raw_data : out std_logic_vector(29 downto 0) := (others => '0');
            --raw_data_valid : out std_logic := '0'
        );

end Behavioral;
