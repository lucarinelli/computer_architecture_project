----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2018 05:36:12 PM
-- Design Name: 
-- Module Name: main - Behavioral
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

entity main is
    Port ( clk : in STD_LOGIC;
           led : out STD_LOGIC);
end main;

architecture Behavioral of main is

component clk_wiz_0 is
    Port (
        clk_out1 : out std_logic;
        reset : in std_logic;
        locked : out std_logic;
        clk_in1 : in std_logic
    );
end component;

component clk_gen is
    Generic(
        freq_in : natural := 125000;
        freq_out : natural := 1
    );
    Port ( clk_i : in STD_LOGIC;
           clk_o : out STD_LOGIC);
end component;

signal state : std_logic :='0';
signal clka : std_logic;
signal clkb : std_logic;
begin

    cw_0: clk_wiz_0
        port map (
            clk_out1 => clkb,
            reset => '0',
            clk_in1 => clk
        );

    c_inst0: clk_gen
        generic map(
            freq_in => 125000000,
            freq_out => 1
            )
        port map(
            clk_i=>clkb,
            clk_o=>clka
        );

    process(clka)       
    begin
        led <= clka;
--        if (clka'>event and clka='1') then
--            led<='1';
--        else then
--            led<='0';
--        end if;
    end process;

end Behavioral;
