----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2018 10:41:26 PM
-- Design Name: Very ignorant deserializer
-- Module Name: deserializer - Behavioral
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

entity deserializer is
    Port (
        d_in : in std_logic;
        d_out : out std_logic_vector(9 downto 0);
        reset : in std_logic;
        clk : in std_logic
    );
end deserializer;

architecture Behavioral of deserializer is
    
    signal internal: std_logic_vector (9 downto 0) := (others => '1');
    
begin

    process(clk)
        variable count : integer range 0 to 10 := 0;
    begin
        if(clk'event and clk='1') then
            if reset = '1' then 
                count := 0;
            end if;
            if (count=10) then
                d_out<=internal;
                count:=0;
            end if;
            internal(count-1)<=d_in;
            count:=count+1;
        end if;
    end process;

end Behavioral;
