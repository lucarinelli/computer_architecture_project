----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2018 06:57:17 PM
-- Design Name: 
-- Module Name: edge_matrix_applier - Behavioral
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

entity edge_matrix_applier is
    Generic(
        counter_bit_size: natural := 11;
        DEPTH: natural := 4;
        WIDTH: natural := 1920;
        RES_HEIGHT: natural := 1080;
        THRESHOLD: natural := 4900
    );
    Port(
        grey: in std_logic_vector(7 downto 0);
        pixel_clock: in std_logic;
        video_enable: in std_logic;
        hsync: in std_logic;
        vsync: in std_logic;
        
        bicolor: out std_logic;
        bicolor_ready: out std_logic
    );
end edge_matrix_applier;

architecture Behavioral of edge_matrix_applier is

    type state_type is (
        WAIT_FOR_SYNC,
        WAIT_FOR_VIDEO,
        FILL_ZEROTH,
        WAIT_AFTER_ZEROTH,
        FILL_FIRST,
        WAIT_AFTER_FIRST,
        FILL_AND_COMPUTE,
        WAIT_NORMAL_CASE,
        COMPUTE_FILL_ZERO
    );
    
    type reg_type is record
        state: state_type;
        x: natural range 0 to WIDTH;
        y: natural range 0 to RES_HEIGHT+4;
        filling: natural range 0 to 3;
        computing: natural range 0 to 3;
    end record;
    
    constant reg_type_def   : reg_type := (
        state => WAIT_FOR_SYNC,
        x => 0,
        y => 0,
        filling => 0,
        computing => 0
    );

    type ram_type is
        array (0 to DEPTH-1, 0 to WIDTH -1) of
            std_logic_vector(7 downto 0);
    
    signal ram  : ram_type := (others=> (others => (others => '0')));
    
    signal curr_reg : reg_type := reg_type_def;
    signal next_reg : reg_type := reg_type_def;
    
    function sobel_x (ram: ram_type; x: natural; y: natural range 0 to 3) return integer is
    begin
        return to_integer(unsigned(ram(x+1,y+1)))+to_integer(unsigned(ram(x+1,y)))*2+to_integer(unsigned(ram(x+1,y-1)))
               -to_integer(unsigned(ram(x-1,y-1)))-to_integer(unsigned(ram(x-1,y)))*2-to_integer(unsigned(ram(x-1,y+1)));
    end function;
    
    function sobel_y (ram: ram_type; x: natural; y: natural range 0 to 3) return integer is
    begin
        return to_integer(unsigned(ram(x+1,y+1)))+to_integer(unsigned(ram(x,y+1)))*2+to_integer(unsigned(ram(x-1,y+1)))
               -to_integer(unsigned(ram(x+1,y-1)))-to_integer(unsigned(ram(x,y-1)))*2-to_integer(unsigned(ram(x-1,y-1)));
    end function;
    
     
begin

    state_machine_sync_proc: process(pixel_clock)
    begin
        if rising_edge(pixel_clock) then
            curr_reg <= next_reg;
        end if;
    end process;

    fill_proc: process(curr_reg.state,video_enable,vsync)
    begin
        case curr_reg.state is
            when WAIT_FOR_SYNC =>
                if vsync='0' then
                    next_reg.state<=WAIT_FOR_VIDEO;
                end if;
            when WAIT_FOR_VIDEO =>
                next_reg.x <= 0;
                
                if video_enable='1' then
                    next_reg.state<=FILL_ZEROTH;
                    next_reg.x<= 1;
                    ram(0,0) <= grey;
                end if;
            when FILL_ZEROTH =>
                if (video_enable ='1') then
                    ram(0, curr_reg.x) <= grey;
                    next_reg.x <= curr_reg.x+1;
                else
                    next_reg.state<= WAIT_AFTER_ZEROTH;
                    next_reg.y <= 1;
                    next_reg.x <= 0;
                    next_reg.filling<=1;
                end if;
            when WAIT_AFTER_ZEROTH =>
                if (video_enable='1') then
                    next_reg.state <= FILL_FIRST;
                    ram(1,0)<= grey;
                    next_reg.x<= 1;
                end if;
            when FILL_FIRST =>
                if (video_enable ='1') then
                    ram(1, curr_reg.x) <= grey;
                    next_reg.x <= curr_reg.x+1;
                else
                    next_reg.state<= WAIT_AFTER_FIRST;
                    next_reg.y <= 2;
                    next_reg.x <= 0;
                    next_reg.filling<=2;
                end if;
            when WAIT_AFTER_FIRST =>
                if (video_enable='1') then
                    next_reg.state <= FILL_AND_COMPUTE;
                    ram(2,0)<= grey;
                    next_reg.x<= 1;
                end if;
            when FILL_AND_COMPUTE =>
                if (video_enable='1') then
                    ram(curr_reg.filling, curr_reg.x)<= grey;
                    next_reg.x<= curr_reg.x + 1;
                else
                    next_reg.y<= curr_reg.y+1;
                    next_reg.x<= 0;
                    next_reg.filling<= curr_reg.filling+1;
                    next_reg.computing <= curr_reg.computing+1;
                end if;
            when WAIT_NORMAL_CASE =>
                if (video_enable = '1') then
                    ram(curr_reg.filling, 0) <= grey;
                    next_reg.x <= 0;
                    if (curr_reg.y>RES_HEIGHT-1) then
                        next_reg.state <= COMPUTE_FILL_ZERO;
                    else
                        next_reg.state <= FILL_AND_COMPUTE;
                    end if;
                end if;
            when COMPUTE_FILL_ZERO =>
                if(video_enable = '1') then
                    ram(curr_reg.filling, curr_reg.x) <= (others=>'0');
                    next_reg.x<= curr_reg.x +1;
                else
                    next_reg.y<= curr_reg.y+1;
                    next_reg.x<= 0;
                    if (curr_reg.y = RES_HEIGHT+4) then
                        next_reg <= reg_type_def;
                    end if;
                end if;
        end case;
    end process;
    
    compute_proc: process(curr_reg.state)
        --buffer/deserializer -> memory
--        bicolor_string: out std_logic_vector(31 downto 0);
--        bicolor_string_ready: out std_logic;
--        bicolor_x_start : out natural range 0 to WIDTH;
--        bicolor_y : out natural range 0 to RES_HEIGHT
        variable result : natural;
        variable xcomp : natural;
        variable ycomp : natural;
        variable buff_i : natural;
    begin
        
        case curr_reg.state is
            when WAIT_AFTER_FIRST =>
                    if xcomp > WIDTH-1 then
                        xcomp := 0;
                    end if;
                    result := sobel_x(ram,xcomp,curr_reg.computing)**2+sobel_y(ram,xcomp,curr_reg.computing)**2;
                    if result > THRESHOLD then
                        bicolor<= '1';
                    else 
                        bicolor<= '0';
                    end if;
                    bicolor_ready<='1';
                    xcomp := xcomp+1;
            when FILL_AND_COMPUTE =>
                    if xcomp < WIDTH then
                        result := sobel_x(ram,xcomp,curr_reg.computing)**2+sobel_y(ram,xcomp,curr_reg.computing)**2;
                        if result > THRESHOLD then
                            bicolor<= '1';
                        else 
                            bicolor<= '0';
                        end if;
                        xcomp := xcomp+1;
                        ycomp := ycomp+1;
                    else bicolor_ready<='0';
                    end if;
            when WAIT_NORMAL_CASE =>
                if xcomp > WIDTH-1 then
                    xcomp := 0;
                end if;
                result := sobel_x(ram,xcomp,curr_reg.computing)**2+sobel_y(ram,xcomp,curr_reg.computing)**2;
                if result > THRESHOLD then
                    bicolor<= '1';
                else 
                    bicolor<= '0';
                end if;
                bicolor_ready<='1';
                xcomp := xcomp+1;
            when COMPUTE_FILL_ZERO =>
                if xcomp < WIDTH and ycomp < RES_HEIGHT then
                    result := sobel_x(ram,xcomp,curr_reg.computing)**2+sobel_y(ram,xcomp,curr_reg.computing)**2;
                    if result > THRESHOLD then
                        bicolor<= '1';
                    else 
                        bicolor<= '0';
                    end if;
                    xcomp := xcomp+1;
                    ycomp := ycomp+1;
                else bicolor_ready<='0';
                end if;
            when others =>
                xcomp := 0;
                ycomp := 0;
                buff_i :=0;
        end case;
    end process;
    
end Behavioral;