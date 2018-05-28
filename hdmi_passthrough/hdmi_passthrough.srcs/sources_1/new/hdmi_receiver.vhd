----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2018 10:40:05 PM
-- Design Name: 
-- Module Name: hdmi_receiver - Behavioral
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

entity hdmi_receiver is
    Port (
        ch_in : in std_logic_vector (2 downto 0);
        
        pixel_clock : in std_logic;
        pixel_clock_x10 : in std_logic;
        
        vsync : out std_logic := '0';
        hsync : out std_logic := '0';
        rgb : out std_logic_vector (31 downto 0) := (others => '0');
        rgb_valid : out std_logic := '0';
        aux : out std_logic_vector (8 downto 0) := (others => '0');
        aux_valid : out std_logic := '0'
        --raw_data : out std_logic_vector(14 downto 0) := (others => '0');
        --raw_data_valid out std_logic := '0';
    );
end hdmi_receiver;

architecture Behavioral of hdmi_receiver is

    signal channels_10bit_input : std_logic_vector (29 downto 0);
    
    component deserializer
        Port(
            d_in : in std_logic;
            d_out : out std_logic_vector(9 downto 0);
            reset : in std_logic;
            clk : in std_logic
        );
    end component;

    component hdmi_decoder
        Port (
            d : in std_logic_vector (9 downto 0);
            q : out std_logic_vector (7 downto 0);
            pixel_clock : in std_logic
        );
    end component;
    
begin

    deserializes_gen : for i in 0 to 2 generate
        
        deserializer_inst : deserializer
            port map (
                d_in => ch_in(i),
                d_out => channels_10bit_input(i*10 downto i*10+9),
                reset => '1',
                clk => pixel_clock_x10
            );
        
    end generate;


    decoders_gen : for i in 0 to 2 generate
        
        decoder_inst : hdmi_decoder
            --generic map ()?
            port map (
                d => channels_10bit_input(i*10+9 downto i*10),
                q => rgb(i*8+7 downto i*8),
                aux
                pixel_clock => pixel_clock
            );
        
    end generate;

end Behavioral;
