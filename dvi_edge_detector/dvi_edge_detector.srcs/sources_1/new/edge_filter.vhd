	----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Fanti Andrea
-- 
-- Create Date: 06/06/2018 05:41:11 PM
-- Design Name: 
-- Module Name: edge_filter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: converts a black and white image stored in RAM to a 2-color
-- image, and store it in RAM
-- see https://en.wikipedia.org/wiki/Sobel_operator for details
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

entity edge_detect is
    generic (
        IMGIN_BASE_ADDR : natural := 0;
        IMGOUT_BASE_ADDR :natural := 307201;
    );
    port (
        en : in std_logic;
        clk : in std_logic;
        img_ready : in std_logic;
        res_x : in std_logic; -- x resolution
        res_y : in std_logic; -- y resolution
        abus : out std_logic; -- RAM's address bus
        ram_w : out std_logic:= '0'; -- RAM's write control signal
        ram_r : out std_logic:= '0'; -- RAM's read control signal
    );
end edge_detect;

architecture Behavioral of edge_detect is

    process (clk)
        variable x : integer := 0;
        variable xx : integer range -1 to +1:= -1;
        variable y : integer := 0;
        variable yy : integer range -1 to +1:= 0;
        variable matr : (array(2 downto 0) of (array(2 downto 0) of unsigned(range 0 to 2))) 
    begin
        

        -- incrementing indexes
        x:= x+1;
        if (x = res_x) then
            x:= 0;
            y:= y+1;
            if (y = res_y) then y:= 0; end if;
        end if;
    end process;
begin


end Behavioral;
-- vim:shiftwidth=4 tabstop=4
-- vim:expandtab
