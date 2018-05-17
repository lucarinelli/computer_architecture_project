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

entity serializer10bit_tb is
--  Port ( );
end serializer10bit_tb;

architecture Behavioral of serializer10bit_tb is

    component serializer10bit is
        Port ( clk : in STD_LOGIC;
               din : in STD_LOGIC_VECTOR (9 downto 0);
               dout : out STD_LOGIC);
    end component;
    
    signal clk : std_logic := '0';
    signal dout : std_logic;
    signal din : std_logic_vector(9 downto 0) := "0110110001";
    
    constant CLK_SYS_PERIOD: time := 4 ns;  --  for 125 MHz
    
begin
    UUT: serializer10bit
        port map(
            clk => clk,
            din => din,
            dout => dout
        );
    
    tb : process begin
        clk <= '0';
        wait for CLK_SYS_PERIOD/2;
        clk <= '1';
        wait for CLK_SYS_PERIOD/2;
    end process;
    
end Behavioral;