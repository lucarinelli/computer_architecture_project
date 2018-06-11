----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2018 10:01:01 AM
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
    Port (
        led: out std_logic_vector(3 downto 0);
        btn: in std_logic_vector(3 downto 0);
        sw: in std_logic_vector(1 downto 0);
        
        sysclk: in std_logic
    );
end test;

architecture Behavioral of test is
    
    
    component blk_mem_gen_0 is
        port (
            clka : IN STD_LOGIC;
            ena : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            clkb : IN STD_LOGIC;
            enb : IN STD_LOGIC;
            addrb : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    end component;
    
    component clk_wiz_0 
        Port(
            memclk: out std_logic;
            reset: in std_logic;
            locked: out std_logic;
            sysclk: in std_logic
         );
    end component;
    
    signal addr_in : std_logic_vector(16 downto 0) := (others=>'0');
    signal addr_out : std_logic_vector(16 downto 0) := (others=>'0');
    
    signal data_in : std_logic_vector(15 downto 0) := (others=>'0');
    signal data_out : std_logic_vector(15 downto 0) := (others=>'0');
    
    signal n_sw0 : std_logic;
    
    signal memclk : std_logic;
    
begin

    n_sw0 <= not sw(0);
    
    data_in <= btn(3)&btn(2)&btn(1)&btn(0)&"000000000000";

    block_mem : blk_mem_gen_0
        Port map(
            clka => memclk,
            clkb => memclk,
            ena => sw(0),
            wea => "1",
            enb => n_sw0,
            addra => addr_in,
            addrb => addr_out,
            dina => data_in,
            doutb => data_out   
        );
        
    cw: clk_wiz_0 
        Port map(
            memclk => memclk,
            reset => '0',
            sysclk => sysclk
         );
        
    process(sw(1))
    begin
        if sw(1)='1' then
            addr_in <= (others=>'1');
            addr_out <= (others=>'1');
        else
            addr_in <= (others=>'0');
            addr_out <= (others=>'0');
        end if;
    end process;
    
    process(sw(0))
    begin
        if sw(0)='0' then
            led <= data_out(15 downto 12);
        else
            led <= btn(3)&btn(2)&btn(1)&btn(0);
        end if;
    end process;


end Behavioral;
