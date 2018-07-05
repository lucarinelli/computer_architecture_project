----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/05/2018 06:29:20 PM
-- Design Name: 
-- Module Name: deserializer_tb - Behavioral
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

entity deserializer_tb is
Generic(
        WIDTH : natural := 32
    );
Port (
        --d_in : in std_logic;
        d_out : out std_logic_vector(WIDTH-1 downto 0);
        d_out_valid : out std_logic := '0'--;
        --reset : in std_logic;
        --pixel_clock : in std_logic;
        --d_in_valid : in std_logic
    );
end deserializer_tb;

architecture Behavioral of deserializer_tb is
    component deserializer 
        Generic(
            WIDTH : natural := 32
        );
        Port (
            d_in : in std_logic;
            d_out : out std_logic_vector(WIDTH-1 downto 0);
            d_out_valid : out std_logic;
            reset : in std_logic;
            pixel_clock : in std_logic;
            d_in_valid : in std_logic
        );
    end component;
    
    signal d_in : std_logic;
    --signal d_out : std_logic_vector(WIDTH-1 downto 0);
    --signal d_out_valid : std_logic := '0';
    --signal reset : std_logic;
    --signal pixel_clock : std_logic;
    signal d_in_valid : std_logic;
    signal clk : std_logic := '1';  -- clock starts from 1 so we have a falling edge before the first rising edge to
                                    -- set the correct inputs to the circuit
begin
    UUT : deserializer
        port map(
            d_in => d_in,
            d_out => d_out,
            d_out_valid => d_out_valid,
            reset => '0',
            pixel_clock => clk,
            d_in_valid => '1' 
        );

    process
    begin
        -- should be this for 1080p
        clk <= '1';
        wait for 4.0188 ns;
        clk <= '0';
        wait for 4.0188 ns;
    end process;
    
    process (clk)
        variable cnt : natural := 0;
    begin
        if falling_edge(clk) then
            -- basically we write "010101...11"
            if (cnt mod 2) = 1 or cnt > WIDTH-3 then
                d_in <= '1';
            else
                d_in <= '0';
            end if;
        end if;
        if rising_edge(clk) then
            report "sending bit # " & integer'image(cnt);
            cnt := (cnt+1) mod WIDTH;
        end if;
    end process;
end Behavioral;
