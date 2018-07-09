----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/13/2018 11:58:44 PM
-- Design Name: 
-- Module Name: merge - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity merge_v2 is
    Generic (
        WIDTH : natural := 1920;
        HEIGHT : natural := 1080;
        --BUFF_SIZE : natural := 128;
        MEM_ADDR_SIZE : natural := 14;
        --REFILL_AT_INDEX : natural := 63;
        BLOCK_NUM : natural := 60
    );
    Port ( vsync : in STD_LOGIC;
           hsync : in STD_LOGIC;
           de : in STD_LOGIC;
           mem_d_in : in STD_LOGIC_VECTOR (127 downto 0);
           pixel_clock : in STD_LOGIC;
           mem_raddr : out STD_LOGIC_VECTOR (MEM_ADDR_SIZE-1 downto 0);
           mem_ren : out STD_LOGIC;
           rgb_in : in STD_LOGIC_VECTOR (23 downto 0);
           rgb_out : out STD_LOGIC_VECTOR (23 downto 0));
end merge_v2;

architecture Behavioral of merge_v2 is
    type state_type is (
--      WAIT_FOR_VSYNC, -- loads the next row of elaborated video
        WAIT_FOR_DE,    -- when de = '1', 
        WAIT_FOR_HSYNC -- loads the next row of elaborated video
    );
    
    type reg_type is record
        state: state_type;
        x: natural range 0 to WIDTH*2; -- to have some range
        y: integer range 0 to HEIGHT+1;
    end record;
    
    constant reg_type_def : reg_type := (
        state => WAIT_FOR_HSYNC,
        x => 0,
        y => 0
    );
    
    signal curr_reg, next_reg : reg_type := reg_type_def;
    
    -- signals that go to the loader
    -- TODO: program a loader that loads a pixel row from memmory whenever load_row goes to 1 (load the first one when also load_first is high)
    signal load_first : std_logic := '0';
    signal load_row : std_logic := '0';
    signal curr_width : natural range 1 to 1920 := WIDTH; -- fullHD maximum supported   | these should be implemented if we want to support multiple resolutions
    signal new_width : natural range 1 to 1920 := WIDTH; --                             |
    signal buff : std_logic_vector(WIDTH-1 to 0);   -- loaded by the loader, contains the elaborated bits from the filter
    
begin

    state_machine_proc: process(pixel_clock, de, vsync, hsync)
    begin
        if vsync='0' then
            -- in any case, if vsync goes low, we reset the indexes and load from memory the first video row
            load_first <= '1';
            load_row <= '1';
            next_reg.state <= WAIT_FOR_DE;
            next_reg.x <= 0;
            next_reg.y <= 0;
        else
            case curr_reg.state is
                when WAIT_FOR_DE =>
                    if rising_edge(pixel_clock) then
                        if de = '1' then -- if we should transmit video
                            -- updating horizontal indexes
                            next_reg.x <= curr_reg.x+1;
                            
                            -- TODO : UNCOMMENT THE FOLLOWING...
--                            if buff(curr_reg.x) = '1' then
--                                rgb_out <= (others=>'1');
--                            else
--                                rgb_out <= (others=>'0');
--                            end if;
                            -- ... and erase this, which is a test
                            if curr_reg.x < 100 then
                                if (curr_reg.x mod 20) < 10 then
                                    rgb_out <= "000000000000000011111111";
                                else
                                    rgb_out <= "111111110000000000000000";
                                end if;
                            else
                                if (curr_reg.x mod 40) < 20 then
                                    rgb_out <= "000000001111111100000000";
                                else
                                    rgb_out <= "111111110000000000000000";
                                end if;
                                
                            end if;
                            --   R -> R
                            --   B -> G
                            --   G -> B
                            --- soooo: green and blue *were* swapped
                            -- ... damn digilent employ some good programmers
                        elsif curr_reg.x > 0 then -- ("and de='0'" implicit), checking if the video stream has finished being transmitted
                            -- fun fact: place > 4 to have a completely black screen!
                            next_reg.state <= WAIT_FOR_HSYNC;
                            load_row <= '0';
                            load_first <= '0';
                        end if;
                    end if;
            -- this should be an alternative to the "elsif" above except it starts the loading of the line slightly after
                    -- when hsync goes to 1 we load the next row from memory and wait for the video stream to start.
                    -- we don't do that immediately so we are sure the loader has time to sense that load_row went to 0
--                    if hsync = '1' then
--                        next_reg.state <= WAIT_FOR_HSYNC;
--                        load_row <= '0';
--                        load_first <= '0';
--                    end if;
                
                when WAIT_FOR_HSYNC =>
                    -- use this \/ if you use the alternative to the "elsif"
                    --if rising_edge(pixel_clock) and hsync = '0' then -- wait until hsync goes to 0 again
                    if falling_edge(hsync) then
                    --if rising_edge(pixel_clock) and hsync = '1' then -- last hope, we sacrifice the useless y variable to have a bigger time interval
                        load_row <= '1'; -- we load something also during the first part of vertical blanking, but who cares (it'll be overwritten)
                        next_reg.x <= 0;
                        --next_reg.y <= curr_reg.y + 1; why should we care about the y
                        next_reg.state <= WAIT_FOR_DE;
                    end if;
                
                when others=> null;
            end case;
        end if;
    end process;
    
    state_machine_sync_proc: process(pixel_clock) begin
        -- we update the state between 2 pixels so we are sure that it is in a consistent state when pixel_clock goes up
        if falling_edge(pixel_clock) then
            curr_reg <= next_reg;
        end if;
    end process;

end Behavioral;
