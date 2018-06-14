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

entity merge is
    Generic (
        WIDTH : natural := 1920;
        HEIGHT : natural := 1080;
        BUFF_SIZE : natural := 128;
        MEM_ADDR_SIZE : natural := 14;
        REFILL_AT_INDEX : natural := 63;
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
end merge;

architecture Behavioral of merge is
    type state_type is (
        WAIT_FOR_VSYNC,
        WAIT_FOR_HSYNC,
        WAIT_FOR_VIDEO,
        STREAMING
    );
    
    type reg_type is record
        state: state_type;
        x: natural range 0 to WIDTH;
        y: integer range -1 to HEIGHT+1;
        streaming : natural range 0 to 1;
        loading : natural range 0 to 1;
        buff_index : natural range 0 to BUFF_SIZE-1;
        x_block_n : natural range 0 to BLOCK_NUM-1;
    end record;
    
    constant reg_type_def : reg_type := (
        state => WAIT_FOR_VSYNC,
        x => 0,
        y => -1,
        streaming => 1,
        loading => 0,
        buff_index => 0,
        x_block_n => 0
    );
    
    signal curr_reg, next_reg : reg_type := reg_type_def;
    
    type swap_buff_t is array(0 to 1) of
        std_logic_vector(BUFF_SIZE-1 downto 0);
    
    signal sw_buf  : swap_buff_t := (others => (others => '0'));
    
begin

    state_machine_proc: process(curr_reg.state,vsync,hsync) begin
        case curr_reg.state is
            when WAIT_FOR_VSYNC =>
                if vsync='0' then
                    next_reg.state <= WAIT_FOR_HSYNC;
                end if;
            when WAIT_FOR_HSYNC =>
                if hsync='1' then
                    next_reg.y <= next_reg.y + 1;
                    next_reg.state <= WAIT_FOR_VIDEO;
                    next_reg.x_block_n <= next_reg.x_block_n + 1;
                    next_reg.loading <= 1;
                    next_reg.streaming <= 0;
                else
                    mem_raddr <= std_logic_vector(to_unsigned(BLOCK_NUM*(curr_reg.y+1)+ curr_reg.x_block_n, MEM_ADDR_SIZE));
                    mem_ren <= '1';
                    sw_buf(curr_reg.loading) <= mem_d_in;
                end if;
            when WAIT_FOR_VIDEO =>
                if hsync='1' then
                    next_reg <= reg_type_def;
                elsif de='1' then
                    next_reg.x <= curr_reg.x + 1;
                    next_reg.buff_index <= curr_reg.buff_index + 1;
                    next_reg.state <= STREAMING;
                    
                    if sw_buf(curr_reg.streaming)(curr_reg.buff_index) = '1' then
                        rgb_out <= "000000001111111100000000";
                    else
                        rgb_out <= rgb_in;                    
                    end if;
                    
                end if;
            when STREAMING =>
                if de='0' then
                    next_reg.state <= WAIT_FOR_HSYNC;
                    next_reg.y <= next_reg.y + 1;
                    next_reg.x <= 0;
                    next_reg.buff_index <= 0;
                    next_reg.streaming <= 1;
                    next_reg.loading <= 0;
                else
                    if curr_reg.buff_index = REFILL_AT_INDEX then
                        mem_raddr <= std_logic_vector(to_unsigned(BLOCK_NUM*curr_reg.y+ curr_reg.x_block_n, MEM_ADDR_SIZE));
                        mem_ren <= '1';
                        sw_buf(curr_reg.loading) <= mem_d_in;
                    end if;
                    if curr_reg.buff_index=BUFF_SIZE-1 then
                        next_reg.loading <= curr_reg.streaming;
                        next_reg.streaming <= curr_reg.loading;
                        next_reg.x_block_n <= curr_reg.x_block_n+1;
                    end if;
                    next_reg.x <= curr_reg.x + 1;
                    next_reg.buff_index <= curr_reg.buff_index + 1;
                    
                    if sw_buf(curr_reg.streaming)(curr_reg.buff_index) = '1' then
                        rgb_out <= "000000001111111100000000";
                    else
                        rgb_out <= rgb_in;                    
                    end if;
                    
                end if;
        end case;
    end process;

    state_machine_sync_proc: process(pixel_clock) begin
        if rising_edge(pixel_clock) then
            curr_reg <= next_reg;
        end if;
    end process;

end Behavioral;
