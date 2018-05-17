----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2018 04:48:08 PM
-- Design Name: 
-- Module Name: hdmi_controller_tb - Behavioral
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

entity hdmi_controller_tb is
--  Port ( );
end hdmi_controller_tb;

architecture Behavioral of hdmi_controller_tb is
    component hdmi_controller is
        Port (
           reset : in std_logic;
           clk_sys : in STD_LOGIC;
   
           -- the 3 TDMS channels from the serializers + clock channel (all [pos, neg])
           chclk : out std_logic_vector(1 downto 0);
           chp, chn : out std_logic_vector(2 downto 0);
           color_select : in STD_LOGIC_VECTOR (1 downto 0) --  color selection from a palette
        );
    end component;
    signal clk : std_logic := '0';
    signal chclk:std_logic_vector(1 downto 0);
    signal chp : std_logic_vector(2 downto 0);
    signal chn : std_logic_vector(2 downto 0);
    signal color_select : std_logic_vector(1 downto 0) := "00";
    
    constant CLK_SYS_PERIOD: time := 8 ns;  --  for 125 MHz
    
begin
    UUT: hdmi_controller
        port map(
            reset => '0',   --  actually not still used
            clk_sys => clk,
            chp => chp,
            chn => chn,
            chclk => chclk,
            color_select => color_select
        );
    
    tb : process begin
        clk <= '0';
        wait for CLK_SYS_PERIOD/2;
        clk <= '1';
        wait for CLK_SYS_PERIOD/2;
    end process;
    
    process begin
        report "testing gray";
        color_select <= "00";
        wait for 20 ms;
        
        report "testing red";
        color_select <= "01";
        wait for 20 ms;
        
        report "testing green";
        color_select <= "10";
        wait for 20 ms;
        
        report "testing blue";
        color_select <= "11";
        wait for 20 ms;
        
    end process;
    
end Behavioral;
