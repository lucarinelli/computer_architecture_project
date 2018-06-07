
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
use IEEE.math_real."ceil";
use IEEE.math_real."log2";
--use work.help_funcs.all;

entity dual_port_ram is
    generic (
        -- default: 1 Kilobyte in bytes
        WIDTH       : natural := 8;
        DEPTH       : natural := 1024;
        WRITE_FIRST : boolean := true
    );
    port (
        clk : in std_ulogic;

        rd_addr : in std_logic_vector(integer(ceil(log2(real(DEPTH))))-1 downto 0);
        wr_en   : in std_logic;
        wr_addr : in std_logic_vector(integer(ceil(log2(real(DEPTH))))-1 downto 0);
        din     : in std_logic_vector(WIDTH-1 downto 0);

        dout    : out std_logic_vector(WIDTH-1 downto 0) := (others => '0')
    );
end dual_port_ram;

architecture Behavioral of dual_port_ram is
    
    type ram_type is
        array (0 to DEPTH-1) of
        std_logic_vector(WIDTH-1 downto 0);
    
    signal ram  : ram_type := (others => (others => '0'));
    
begin

    ram_ctrl_proc : process(CLK)
    begin
        if rising_edge(CLK) then
            
            dout    <= ram(to_integer(signed(rd_addr)));
            
            if wr_en='1' then
                ram(to_integer(signed(wr_addr)))   <= din;
            end if;
            
            if write_first and WR_EN='1' and rd_addr=wr_addr then
                dout    <= din;
            end if;
            
        end if;
    end process;

end Behavioral;
