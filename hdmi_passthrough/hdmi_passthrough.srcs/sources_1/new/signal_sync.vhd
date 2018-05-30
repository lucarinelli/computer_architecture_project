----------------------------------------------------------------------------------
-- Engineer: Mario Rossi
-- 
-- Create Date:    09:07:49 09/16/2014 
-- Module Name:    SIGNAL_SYNC - rtl 
-- Project Name:   SIGNAL_SYNC
-- Tool versions:  Xilinx Vivado
-- Description: 
--
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SIGNAL_SYNC is
    generic (
        DEFAULT_VALUE   : std_ulogic := '0';
        SHIFT_LEVELS    : positive range 2 to 16 := 2
    );
    port (
        CLK : in std_ulogic;        
        DIN : in std_ulogic;
        DOUT    : out std_ulogic := DEFAULT_VALUE
    );
end SIGNAL_SYNC;

architecture rtl of SIGNAL_SYNC is
    signal q    : std_ulogic_vector(SHIFT_LEVELS-2 downto 0)
                    := (others => DEFAULT_VALUE);
begin
    
    shift_gen : if SHIFT_LEVELS>2 generate
        
        shift_proc : process(CLK)
        begin
            if rising_edge(CLK) then
                q(q'high downto 1)    <= q(q'high-1 downto 0);
            end if;
        end process;
        
    end generate;
    
    sync_proc : process(CLK)
    begin
        if rising_edge(CLK) then
            DOUT    <= q(q'high);
            q(0)    <= DIN;
        end if;
    end process;
    
end rtl;
