----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2018 05:34:32 PM
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
    Port ( sys_clk : in STD_LOGIC;
           led : out std_logic_vector (1 downto 0)
    );
end test;

architecture Behavioral of test is

    signal sign_pre : std_logic;
    signal sign_precise : std_logic;
    signal sign_poorly : std_logic;
    signal sign_preciseslow : std_logic;
    signal sign_poorlyslow : std_logic;
    
    component clk_wiz_pre
        Port(
            clk_sys : in std_logic;
            clk_pre : out std_logic;
            reset : in std_logic;
            locked : out std_logic
        );
    end component;
    
    component clk_wiz_precise
        Port(
            clk_in1 : in std_logic;
            clk_out1 : out std_logic;
            reset : in std_logic;
            locked : out std_logic
        );
    end component;
    
    component clk_wiz_poorly
        Port(
            clk_in1 : in std_logic;
            clk_out1 : out std_logic;
            reset : in std_logic;
            locked : out std_logic
        );
    end component;
    
    component clk_divider
        Generic(
            freq_in : natural := 74250;
            freq_out : natural := 1
        );
        Port ( clk_i : in STD_LOGIC;
               clk_o : out STD_LOGIC);
    end component;
    
begin
    cw_pre : clk_wiz_pre
        Port map(
            clk_sys => sys_clk,
            clk_pre => sign_pre,
            reset => '0'
        );
        
    cw_precise : clk_wiz_precise
        Port map(
            clk_in1 => sign_pre,
            clk_out1 => sign_precise,
            reset => '0'
        );
    
    cw_poorly : clk_wiz_poorly
        Port map(
            clk_in1 => sign_pre,
            clk_out1 => sign_poorly,
            reset => '0'
        );
        
    cd_precise : clk_divider
        Port map(
            clk_i => sign_precise,
            clk_o => sign_preciseslow
        );
        
    cd_poorly : clk_divider
        Port map(
            clk_i => sign_poorly,
            clk_o => sign_poorlyslow
        );
        
    cd_preciseslow : clk_divider
        generic map(freq_in => 250)
        Port map(
            clk_i => sign_preciseslow,
            clk_o => led(0)
        );
        
    cd_poorlyslow : clk_divider
        generic map(freq_in => 250)
        Port map(
            clk_i => sign_poorlyslow,
            clk_o => led(1)
        );

end Behavioral;
