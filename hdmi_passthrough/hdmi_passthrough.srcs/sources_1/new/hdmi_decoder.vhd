----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2018 10:42:06 PM
-- Design Name: 
-- Module Name: hdmi_decoder - Behavioral
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

entity hdmi_decoder is
    Port (
        d : in std_logic_vector (9 downto 0);
        q : out std_logic_vector (7 downto 0);
        pixel_clock : in std_logic
    );
end hdmi_decoder;

architecture Behavioral of hdmi_decoder is

    signal q_m : std_logic_vector (7 downto 0);
    signal q_n_xor : std_logic_vector (7 downto 0);
    signal q_n_xnor : std_logic_vector (7 downto 0);
    signal q_xor : std_logic_vector (7 downto 0);
    signal q_xnor : std_logic_vector (7 downto 0);
    signal dnot : std_logic_vector (9 downto 0);
    
begin
    
    dnot <= not d;
    
    q_n_xor(0) <= dnot(0);
    q_n_xor(1) <= dnot(1) xor dnot(0);
    q_n_xor(2) <= dnot(2) xor dnot(1);
    q_n_xor(3) <= dnot(3) xor dnot(2);
    q_n_xor(4) <= dnot(4) xor dnot(3);
    q_n_xor(5) <= dnot(5) xor dnot(4);
    q_n_xor(6) <= dnot(6) xor dnot(5);
    q_n_xor(7) <= dnot(7) xor dnot(6);
    
    q_n_xnor(0) <= dnot(0);
    q_n_xnor(1) <= dnot(1) xnor dnot(0);
    q_n_xnor(2) <= dnot(2) xnor dnot(1);
    q_n_xnor(3) <= dnot(3) xnor dnot(2);
    q_n_xnor(4) <= dnot(4) xnor dnot(3);
    q_n_xnor(5) <= dnot(5) xnor dnot(4);
    q_n_xnor(6) <= dnot(6) xnor dnot(5);
    q_n_xnor(7) <= dnot(7) xnor dnot(6);
    
    q_xor(0) <= d(0);
    q_xor(1) <= d(1) xor d(0);
    q_xor(2) <= d(2) xor d(1);
    q_xor(3) <= d(3) xor d(2);
    q_xor(4) <= d(4) xor d(3);
    q_xor(5) <= d(5) xor d(4);
    q_xor(6) <= d(6) xor d(5);
    q_xor(7) <= d(7) xor d(6);
    
    q_xnor(0) <= d(0);
    q_xnor(1) <= d(1) xnor d(0);
    q_xnor(2) <= d(2) xnor d(1);
    q_xnor(3) <= d(3) xnor d(2);
    q_xnor(4) <= d(4) xnor d(3);
    q_xnor(5) <= d(5) xnor d(4);
    q_xnor(6) <= d(6) xnor d(5);
    q_xnor(7) <= d(7) xnor d(6);

    process(pixel_clock)
    begin
        if rising_edge(pixel_clock) then
            if d(9)='1' then
                if d(8)='1' then
                    q_m <= q_n_xor;
                else
                    q_m <= q_n_xnor;
                end if;
            else
                if d(8)='1' then
                    q_m <= q_xor;
                else
                    q_m <= q_xnor;
                end if;
            end if;
        end if;
    end process;

    q <= q_m;
    
end Behavioral;
