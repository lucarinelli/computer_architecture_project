library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity merge_v2_tb is
    Generic (
        WIDTH : natural := 400;
        HEIGHT : natural := 300;
        MEM_ADDR_SIZE : natural := 14
    );
    port(
        mem_raddr : out STD_LOGIC_VECTOR (MEM_ADDR_SIZE-1 downto 0);
        mem_ren : out STD_LOGIC;
        rgb_out : out STD_LOGIC_VECTOR (23 downto 0)
    );
end merge_v2_tb;

architecture Behavioral of merge_v2_tb is
    component merge_v2
        Generic (
            WIDTH : natural;
            HEIGHT : natural;
            MEM_ADDR_SIZE : natural
        );
        Port (
            vsync : in STD_LOGIC;
            hsync : in STD_LOGIC;
            de : in STD_LOGIC;
            mem_d_in : in STD_LOGIC_VECTOR (127 downto 0);
            pixel_clock : in STD_LOGIC;
            mem_raddr : out STD_LOGIC_VECTOR (MEM_ADDR_SIZE-1 downto 0);
            mem_ren : out STD_LOGIC;
            rgb_in : in STD_LOGIC_VECTOR (23 downto 0);
            rgb_out : out STD_LOGIC_VECTOR (23 downto 0)
       );
       end component;
       
   signal vsync : std_logic := '1';
   signal hsync, de, pixel_clock : std_logic := '0';
   signal mem_d_in : std_logic_vector(127 downto 0);
   signal rgb_in : std_logic_vector(23 downto 0);
   

begin
    
    UUT : merge_v2
        generic map(
            WIDTH => WIDTH,
            HEIGHT => HEIGHT,
            MEM_ADDR_SIZE => MEM_ADDR_SIZE
        )
        port map(
            vsync => vsync,
            hsync => hsync,
            de => de,
            mem_d_in => mem_d_in,
            pixel_clock => pixel_clock,
            mem_raddr => mem_raddr,
            mem_ren => mem_ren,
            rgb_in => rgb_in,
            rgb_out => rgb_out 
        );
    
    --clock
    process
    begin
        -- generating a 148.5 MHz clock
        wait for 3.350 ns;
        pixel_clock <= '1';
        wait for 3.350 ns;
        pixel_clock <= '0';
    end process;

    process (pixel_clock)
        variable x : integer := -280;
        variable y : integer := -45;
    begin
        if rising_edge(pixel_clock) then
        --updating h/vsync
            if x>=(-280+88) and x < (-280+132) then
                hsync <= '1';
            else
                hsync <= '0';
            end if;
            
            if y > (-45+4) and y < (-45+9) then
                vsync <='0';
            else
                vsync <= '1';
            end if;
            if x >= 0 and y >= 0 then
                de<= '1';
            else
                de <= '0';
            end if;
            
            --updating coordinates
            x := x+1;
            if x = WIDTH then
                x:= -280;                
                y:= y+1;
                if y = HEIGHT then
                    y:= -45;
                end if;
            end if;
        end if;
    end process;

end Behavioral;

