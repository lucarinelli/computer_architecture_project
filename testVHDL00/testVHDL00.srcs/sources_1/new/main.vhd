----------------------------------------------------------------------------------
-- Company: Fantus Inc. 
-- Engineer: maybe in the future
-- 
-- Create Date: 04/30/2018 02:09:45 AM
-- Design Name: 
-- Module Name: main - Behavioral
-- Project Name: D FF
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--    a simple D flip-flop
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
   Port(
      D, EN : in STD_LOGIC;
      Q, NQ : out STD_LOGIC;
      CLK : in std_logic);
end main;

architecture Behavioral of main is
begin
   --process (X, Y) means that the "code" inside is executed only when X or Y change value
   --using this strategy, wait statements are not allowed
   --see http://vhdl.renerta.com/mobile/source/vhd00053.htm
   -- (X, Y) is called the "sensitivity list"
   process(EN, D)
   begin
      --the (X='1' and X'event) condition is true when we have a rising edge on the X signal
      --using X='0' we would have a IC sensible to X's falling edge
      if(CLK='1' and CLK'event and EN='1') then
      --if we don't use the CLK here vivado complains that the circuit isn't tied with the clock of the board
      --we would have this error: https://www.xilinx.com/support/answers/64452.html
      --(error removable adding set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets EN_IBUF]; to the .xdc file)
         Q <= D;
         NQ <= not D;
         --sleep 10n
      end if;
   end process;
end Behavioral;

