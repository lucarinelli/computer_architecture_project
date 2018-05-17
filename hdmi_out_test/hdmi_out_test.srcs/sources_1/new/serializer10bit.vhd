----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2018 11:19:05 PM
-- Design Name: 
-- Module Name: serializer10bit - Behavioral
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

entity serializer10bit is
    Port ( clk : in STD_LOGIC;
           din : in STD_LOGIC_VECTOR (9 downto 0);
           dout : out STD_LOGIC);
end serializer10bit;

architecture Behavioral of serializer10bit is
    signal internal: std_logic_vector (9 downto 0) := din;
begin
    process(clk)
        variable count : integer range 0 to 10:= 0;
    begin
        if(clk'event and clk='1') then
            if(count=10)then
                internal <= din;
                count:=0;
            end if;
            dout<=internal(count);
            count:=count+1;
        end if;
    end process;
end Behavioral;
