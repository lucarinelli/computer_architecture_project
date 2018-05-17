----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2018 09:19:47 PM
-- Design Name: 
-- Module Name: tmds_encoder - Behavioral
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

use IEEE.STD_LOGIC_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity tmds_encoder is
    generic (
        channel_num : natural range 0 to 2 := 0
    );
    Port (
        clk : in STD_LOGIC;
        clkx10 : in STD_LOGIC;
        mode : in STD_LOGIC_VECTOR (2 downto 0);
        control : in STD_LOGIC_VECTOR (1 downto 0);
        HSYNC : in std_logic;
        VSYNC : in std_logic;
        d_in : in STD_LOGIC_VECTOR (7 downto 0);
        tmds_o : out std_logic
    );
end tmds_encoder;

architecture Behavioral of tmds_encoder is

    component serializer10bit
        Port(
            clk : in STD_LOGIC;
            din : in STD_LOGIC_VECTOR (9 downto 0);
            dout : out STD_LOGIC
        );
    end component;

    signal ones_d_in: unsigned(3 downto 0) := (others => '0');
    signal total_disp: signed(3 downto 0) := (others => '0');
    signal d_in_xor: unsigned(8 downto 0) := (others => '0');
    signal d_in_xnor: unsigned(8 downto 0) := (others => '0');
    signal d_in_encoded: unsigned(8 downto 0) := (others => '0');
    signal d_in_encoded_inv: unsigned(8 downto 0) := (others => '0');
    signal d_in_encoded_disp: signed(3 downto 0) := (others => '0');
    signal data_to_serializer: unsigned(9 downto 0) := (others => '0');
    --signal serializer_out: std_logic := '0';
    
    function terc4 (din : std_logic_vector(3 downto 0)) return unsigned is
        begin
            case din is
                when "0000" =>  return "1010011100";
                when "0001" =>  return "1001100011";
                when "0010" =>  return "1011100100";
                when "0011" =>  return "1011100010";
                when "0100" =>  return "0101110001";
                when "0101" =>  return "0100011110";
                when "0110" =>  return "0110001110";
                when "0111" =>  return "0100111100";
                when "1000" =>  return "1011001100";
                when "1001" =>  return "0100111001";
                when "1010" =>  return "0110011100";
                when "1011" =>  return "1011000110";
                when "1100" =>  return "1010001110";
                when "1101" =>  return "1001110001";
                when "1110" =>  return "0101100011";
                when others =>  return "1011000011";
            end case;
    end function;
    
begin

    serializer_inst : serializer10bit
        port map(
            clk => clkx10,
            din => std_logic_vector(data_to_serializer),
            dout => tmds_o
        );

    d_in_xor(0) <= d_in(0);
    d_in_xor(1) <= d_in(1) xor d_in(0);
    d_in_xor(2) <= d_in(2) xor d_in_xor(1);
    d_in_xor(3) <= d_in(3) xor d_in_xor(2);
    d_in_xor(4) <= d_in(4) xor d_in_xor(3);
    d_in_xor(5) <= d_in(5) xor d_in_xor(4);
    d_in_xor(6) <= d_in(6) xor d_in_xor(5);
    d_in_xor(7) <= d_in(7) xor d_in_xor(6);
    d_in_xor(8) <= '1';
    
    d_in_xnor(0) <= d_in(0);
    d_in_xnor(1) <= d_in(1) xnor d_in(0);
    d_in_xnor(2) <= d_in(2) xnor d_in_xnor(1);
    d_in_xnor(3) <= d_in(3) xnor d_in_xnor(2);
    d_in_xnor(4) <= d_in(4) xnor d_in_xnor(3);
    d_in_xnor(5) <= d_in(5) xnor d_in_xnor(4);
    d_in_xnor(6) <= d_in(6) xnor d_in_xnor(5);
    d_in_xnor(7) <= d_in(7) xnor d_in_xnor(6);
    d_in_xnor(8) <= '0';
    
    d_in_encoded_inv <= not d_in_encoded;

    process(d_in)
        variable ones: unsigned(3 downto 0);
    begin
        ones:="0000";
        for i in 0 to 7 loop
            if(d_in(i)='1') then
                ones := ones + 1;
            end if;
        end loop;
        ones_d_in <= ones;
    end process;
    
--    ones_d_in <= d_in(0) + d_in(1) + d_in(2) + d_in(3) + d_in(4) +d_in(5) + d_in(6) + d_in(7);
    
    process(ones_d_in,d_in(0))
    begin
        if(ones_d_in > 4 or (ones_d_in = 4 and d_in(0)='0')) then
            d_in_encoded <= d_in_xnor;
        else
            d_in_encoded <= d_in_xor;
        end if;
    end process;
    
    process(d_in_encoded)
        variable disp: signed(3 downto 0) := (others => '0');
    begin
        disp := (others => '0');
        for i in 0 to 7 loop
            if(d_in_encoded(i)='1') then
                disp := disp + 1;
            else
                disp := disp - 1;
            end if;
        end loop;
        d_in_encoded_disp <= disp; --determine the difference between the number of ones and zeros  
    end process;
    
    --determine output and new disparity
    process(clk)
        variable data_out       : unsigned(9 downto 0) := (others => '0');
        variable ones           : unsigned(2 downto 0) := "000";
        variable disp_out       : signed(3 downto 0) := x"0";
    begin
        if rising_edge(clk) then
            ---reset disparity between video frames
            disp_out := to_signed(0, total_disp'length);
            case mode is
                when "010" =>
                    --video
                    if(total_disp=0 or d_in_encoded_disp=0) then
                        if(d_in_encoded(8)='0') then
                            data_out := "10"&d_in_encoded_inv(7 downto 0);
                            disp_out := total_disp - d_in_encoded_disp;
                        else
                            data_out := "01"&d_in_encoded(7 downto 0);
                            disp_out := total_disp + d_in_encoded_disp;
                        end if;
                    else
                        if total_disp(total_disp'high) = d_in_encoded_disp(d_in_encoded_disp'high) then
                            -- either positive or negative disparity in both
                            -- the previous transm. and the current data,
                            -- correction needed
                            data_out := "1" & d_in_encoded(8) & d_in_encoded_inv(7 downto 0);
                            disp_out := total_disp + signed("000" & d_in_encoded(8 downto 8)) +
                                        signed("000" & d_in_encoded(8 downto 8)) - d_in_encoded_disp;
                        else
                            -- the current data is already correcting the
                            -- total disperity, don't change it
                            data_out := "0" & d_in_encoded;
                            disp_out := total_disp - signed("000" & d_in_encoded_inv(8 downto 8)) -
                                        signed("000" & d_in_encoded_inv(8 downto 8)) + d_in_encoded_disp;
                        end if;
                    end if;
                when "011" =>
                    --data
                    data_out := terc4(d_in(3 downto 0));
                when "100" =>
                    --video guard band
                    case CHANNEL_NUM is
                        when 0  => data_out := "1011001100";
                        when 1  => data_out := "0100110011";
                        when 2  => data_out := "1011001100";
                    end case;
                when "101" =>
                    --data guard band
                    case CHANNEL_NUM is
                        when 0 => data_out := terc4("11" & VSYNC & HSYNC); -- 0xC to 0xF
                        when 1 => data_out := "0100110011";
                        when 2 => data_out := "0100110011";
                    end case;
                when others =>
                    --control
                    case control is
                        when "00" => data_out := "1101010100";
                        when "01" => data_out := "0010101011";
                        when "10" => data_out := "0101010100";
                        when "11" => data_out := "1010101011";
                        when others => null;
                    end case;
            end case;
            data_to_serializer <= data_out;
            total_disp <= disp_out;
        end if;
    end process;
    
end Behavioral;
