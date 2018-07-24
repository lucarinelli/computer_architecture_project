----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2018 05:27:02 PM
-- Design Name: 
-- Module Name: loader - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--  loads contiguos data from memory until the output buffer is filled.
--  Following requests will load following data chunks
--
--  in particular:
--  Load next chunk when load goes up. 
--  To start reading again from the start, set load_first to 1 while setting load to 1
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--  (NOTE) the loader should store anything that is read over the DOUT_WIDTH for
--  for further readings, but it doesn't
--
--  SO: DOUT_WIDTH should be divided perfectly by DBUS_WIDTH  
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity loader is
    generic(
        -- RAM-dependent
        ABUS_WIDTH : natural := 16;
        DBUS_WIDTH : natural := 128;
        -- should be the hor. resolution if loading a line of black|white pixels
        DOUT_WIDTH : natural := 1600
    );
    port (
        clk : in STD_LOGIC; -- should be the RAM clock, and the RAM should be sensible on its rising edge
        load : in STD_LOGIC;
        load_first : in STD_LOGIC;
        -- to be connected to RAM
        abus : out STD_LOGIC_VECTOR (ABUS_WIDTH-1 downto 0) := (others=>'0');
        dbus : in STD_LOGIC_VECTOR (DBUS_WIDTH-1 downto 0);
        ren : out STD_LOGIC; -- read enable
        --
        dout : out STD_LOGIC_VECTOR (DOUT_WIDTH-1 downto 0)
    );
end loader;

architecture Behavioral of loader is
    signal i : natural range 0 to (2**ABUS_WIDTH)-1 := 0;
    signal can_load : boolean := false; -- used to ensure that we load data (and increment index) only once while load = '1'
    signal loaded : natural range 0 to DOUT_WIDTH*2 := 0; -- counts how many bits are currently loaded into dout
    
    signal lf_old, lf_new : std_logic := '0'; -- load_first_old, load_first_new
begin
    --abus <= std_logic_vector(to_unsigned(i, ABUS_WIDTH));
    --read_enable <= '1' when (load = '1' and loaded < DOUT_WIDTH) else '0';
    
    abus <= (others=>'0');
    ren <= '1';
    dout(DBUS_WIDTH-1 downto 0) <= dbus;
    
    process (clk, load, load_first)
    begin
        
--        if load = '1' and loaded < DOUT_WIDTH then
--            ren <= '1';
--            --setting the abus (i)
--            if falling_edge(clk) then
--                if lf_old = '0' and lf_new = '1' then
--                    --reset_abus <= false;
--                    i <= 0;
--                else
--                    i <= i+1;
--                end if;
--            end if; 
--        elsif load = '0' then
--            ren <= '0';
--            loaded <= 0; -- resets the counter between chunks loading
--        end if;
        
--        -- NOTE: maybe we should use clk='1' instead to have a bigger time interval
--        -- otherwise we might read the old value
--        -- but the problem would be i incrementing
--        if rising_edge(clk) then
--            if load = '1' and loaded < DOUT_WIDTH then
--                dout((i+1)*DBUS_WIDTH -1 downto i*DBUS_WIDTH) <= dbus;
--                loaded <= loaded + DBUS_WIDTH;
--                i <= i+1;
--            end if;
--            lf_old <= lf_new;
--            lf_new <= load_first;
--        end if;
    end process;
end Behavioral;
