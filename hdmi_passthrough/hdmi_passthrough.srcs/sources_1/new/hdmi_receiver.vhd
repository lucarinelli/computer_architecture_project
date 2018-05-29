----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2018 10:40:05 PM
-- Design Name: 
-- Module Name: hdmi_receiver - Behavioral
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

entity hdmi_receiver is
    Port (
        ch_in : in std_logic_vector (2 downto 0);
        
        pixel_clock : in std_logic;
        pixel_clock_x10 : in std_logic;
        
        reset : in std_logic;
        
        vsync : out std_logic := '0';
        hsync : out std_logic := '0';
        rgb : out std_logic_vector (23 downto 0) := (others => '0');
        rgb_valid : out std_logic := '0';
        aux : out std_logic_vector (8 downto 0) := (others => '0');
        aux_valid : out std_logic := '0';
        raw_data : out std_logic_vector(29 downto 0) := (others => '0');
        raw_data_valid : out std_logic := '0'
    );
end hdmi_receiver;

architecture Behavioral of hdmi_receiver is

    type state_type is (
        RESET_CHANNEL_DECODERS,
        WAIT_FOR_SYNC,
        WAIT_FOR_CONTROL,
        CONTROL,
        VIDEO_LGB,
        VIDEO,
        DATA_PACKET_LGB,
        DATA_PACKET_TGB,
        DATA_PACKET
        );
        
    type reg_type is record
        state       : state_type;
        resync      : std_logic;
        hsync       : std_logic;
        vsync       : std_logic;
        rgb_valid   : std_logic;
        aux_valid   : std_logic;
    end record;
    
    constant reg_type_def   : reg_type := (
        state       => RESET_CHANNEL_DECODERS,
        resync      => '1',
        hsync       => '0',
        vsync       => '0',
        rgb_valid   => '0',
        aux_valid   => '0'
        );
        
    signal cur_reg, next_reg : reg_type := reg_type_def;

    type channels_10bit_input_type is
        array(0 to 2) of
        std_logic_vector(9 downto 0);
        
    signal channels_10bit_input : channels_10bit_input_type := (others => (others => '0'));
        
    type chs_terc4_type is
        array(0 to 2) of
        std_logic_vector(3 downto 0);
    
    type chs_ctl_type is
        array(0 to 2) of
        std_logic_vector(1 downto 0);
    
    type chs_rgb_type is
        array(0 to 2) of
        std_logic_vector(7 downto 0);
    
    signal chs_data_valid   : std_logic_vector(2 downto 0) := "000";    
    signal chs_terc4        : chs_terc4_type := (others => (others => '0'));
    signal chs_ctl          : chs_ctl_type := (others => (others => '0'));
    signal chs_rgb          : chs_rgb_type := (others => (others => '0'));
    signal is_ch_ctl        : std_logic_vector(2 downto 0) := "000";
    signal is_ch_terc4      : std_logic_vector(2 downto 0) := "000";
    
    signal watchdog : unsigned(13 downto 0) := (others => '0');
        
    subtype ctl_type is std_logic_vector(9 downto 0);
    subtype terc4_type is std_logic_vector(9 downto 0);
    subtype gb_type is std_logic_vector(9 downto 0);
    
    constant CTL_00 : ctl_type := "1101010100";
    constant CTL_01 : ctl_type := "0010101011";
    constant CTL_10 : ctl_type := "0101010100";
    constant CTL_11 : ctl_type := "1010101011";
    
    constant TERC4_0000 : terc4_type := "1010011100";
    constant TERC4_0001 : terc4_type := "1001100011";
    constant TERC4_0010 : terc4_type := "1011100100";
    constant TERC4_0011 : terc4_type := "1011100010";
    constant TERC4_0100 : terc4_type := "0101110001";
    constant TERC4_0101 : terc4_type := "0100011110";
    constant TERC4_0110 : terc4_type := "0110001110";
    constant TERC4_0111 : terc4_type := "0100111100";
    constant TERC4_1000 : terc4_type := "1011001100";
    constant TERC4_1001 : terc4_type := "0100111001";
    constant TERC4_1010 : terc4_type := "0110011100";
    constant TERC4_1011 : terc4_type := "1011000110";
    constant TERC4_1100 : terc4_type := "1010001110";
    constant TERC4_1101 : terc4_type := "1001110001";
    constant TERC4_1110 : terc4_type := "0101100011";
    constant TERC4_1111 : terc4_type := "1011000011";
    
    constant DATA_ISLAND_GB     : gb_type   := "0100110011";
    constant VIDEO_GB_CH0_CH2   : gb_type   := "1011001100";
    constant VIDEO_GB_CH1       : gb_type   := "0100110011";
    
    function isDataIslandGb(chs_in : channels_10bit_input_type) return boolean is
    begin
        return
            chs_in(1)=DATA_ISLAND_GB and
            chs_in(2)=DATA_ISLAND_GB;
    end function;
    
    function isVideoGb(chs_in : channels_10bit_input_type) return boolean is
    begin
        return
            chs_in(0)=VIDEO_GB_CH0_CH2 and
            chs_in(1)=VIDEO_GB_CH1 and
            chs_in(2)=VIDEO_GB_CH0_CH2;
    end function;
    
    function tmds10to8 (din : std_logic_vector) return std_logic_vector is
        variable t  : std_logic_vector(7 downto 0);
    begin
        t   := din(7 downto 0);
        if din(9)='1' then
            t   := not t;
        end if;
        if din(8)='1' then
            return
                ( t(7) xor t(6) ) &
                ( t(6) xor t(5) ) &
                ( t(5) xor t(4) ) &
                ( t(4) xor t(3) ) &
                ( t(3) xor t(2) ) &
                ( t(2) xor t(1) ) &
                ( t(1) xor t(0) ) &
                ( t(0) );
        else
            return
                ( t(7) xnor t(6) ) &
                ( t(6) xnor t(5) ) &
                ( t(5) xnor t(4) ) &
                ( t(4) xnor t(3) ) &
                ( t(3) xnor t(2) ) &
                ( t(2) xnor t(1) ) &
                ( t(1) xnor t(0) ) &
                ( t(0) );
        end if;
    end function;
    
    component deserializer
        Port(
            d_in : in std_logic;
            d_out : out std_logic_vector(9 downto 0);
            reset : in std_logic;
            clk : in std_logic
        );
    end component;
    
begin

    deserializes_gen : for i in 0 to 2 generate
        
        deserializer_inst : deserializer
            port map (
                d_in => ch_in(i),
                d_out => channels_10bit_input(i),
                reset => cur_reg.resync,
                clk => pixel_clock_x10
            );
        
    end generate;
    
    chs_data_decode_gen : for i in 0 to 2 generate
            
        with channels_10bit_input(i) select
            chs_ctl(i)  <=  "00" when CTL_00,
                            "01" when CTL_01,
                            "10" when CTL_10,
                            "11" when others;
        
        with channels_10bit_input(i) select
            chs_terc4(i)    <=  "0000" when TERC4_0000,
                                "0001" when TERC4_0001,
                                "0010" when TERC4_0010,
                                "0011" when TERC4_0011,
                                "0100" when TERC4_0100,
                                "0101" when TERC4_0101,
                                "0110" when TERC4_0110,
                                "0111" when TERC4_0111,
                                "1000" when TERC4_1000,
                                "1001" when TERC4_1001,
                                "1010" when TERC4_1010,
                                "1011" when TERC4_1011,
                                "1100" when TERC4_1100,
                                "1101" when TERC4_1101,
                                "1110" when TERC4_1110,
                                "1111" when others;
        
        chs_rgb(i)  <= tmds10to8(channels_10bit_input(i));
        
        with channels_10bit_input(i) select
            is_ch_ctl(i)    <=  '1' when CTL_00, '1' when CTL_01,
                                '1' when CTL_10, '1' when CTL_11,
                                '0' when others;
        
        with channels_10bit_input(i) select
            is_ch_terc4(i)  <=  '1' when TERC4_0000, '1' when TERC4_0001,
                                '1' when TERC4_0010, '1' when TERC4_0011,
                                '1' when TERC4_0100, '1' when TERC4_0101,
                                '1' when TERC4_0110, '1' when TERC4_0111,
                                '1' when TERC4_1000, '1' when TERC4_1001,
                                '1' when TERC4_1010, '1' when TERC4_1011,
                                '1' when TERC4_1100, '1' when TERC4_1101,
                                '1' when TERC4_1110, '1' when TERC4_1111,
                                '0' when others;
        
    end generate;
    
    raw_data <= channels_10bit_input(2) & channels_10bit_input(1) & channels_10bit_input(0);
    raw_data_valid <= '1' when chs_data_valid="111" else '0';
    
    hsync <= cur_reg.hsync;
    vsync <= cur_reg.vsync;
    rgb_valid <= cur_reg.rgb_valid;
    aux_valid <= cur_reg.aux_valid; 
    
    send_out_proc : process(pixel_clock)
    begin
        if rising_edge(pixel_clock) then
            RGB <= chs_rgb(2) & chs_rgb(1) & chs_rgb(0);
            AUX <= chs_terc4(0)(2) & chs_terc4(1) & chs_terc4(2);
        end if;
    end process;
    
    stm_proc : process(reset, cur_reg, channels_10bit_input, chs_data_valid, chs_ctl, chs_terc4, is_ch_ctl)
        alias cr is cur_reg;
        variable r  : reg_type := reg_type_def;
    begin
        r   := cr;
        
        case cr.state is
            
            when RESET_CHANNEL_DECODERS =>
                r.resync    := '1';
                r.vsync     := '0';
                r.hsync     := '0';
                r.state     := WAIT_FOR_SYNC;
            
            when WAIT_FOR_SYNC =>
                r.resync    := '0';
                if chs_data_valid="111" then
                    -- all channels have valid signals
                    r.state := WAIT_FOR_CONTROL;
                end if;
            
            when WAIT_FOR_CONTROL =>
                if is_ch_ctl(0)='1' then
                    -- control period
                    r.state := CONTROL;
                end if;
            
            when CONTROL =>
                if isDataIslandGb(channels_10bit_input) then
                    -- data island leading guard band
                    r.state := DATA_PACKET_LGB;
                elsif isVideoGb(channels_10bit_input) then
                    -- video data leading guard band
                    r.state := VIDEO_LGB;
                elsif is_ch_ctl(0)='0' then
                    -- DVI mode, no guard bands
                    r.rgb_valid := '1';
                    r.state     := VIDEO;
                else
                    -- control period
                    r.vsync := chs_ctl(0)(1);
                    r.hsync := chs_ctl(0)(0);
                end if;
            
            when VIDEO_LGB =>
                r.state := VIDEO;
            
            when VIDEO =>
                -- (there's no video data trailing guard band)
                if is_ch_ctl(0)='1' then
                    r.rgb_valid := '0';
                    r.vsync     := chs_ctl(0)(1);
                    r.hsync     := chs_ctl(0)(0);
                    r.state     := CONTROL;
                else
                    -- video pixel
                    r.rgb_valid := '1';
                end if;
            
            when DATA_PACKET_LGB =>
                r.state := DATA_PACKET;
            
            when DATA_PACKET =>
                if isDataIslandGb(channels_10bit_input) then
                    -- data island trailing guard band
                    r.aux_valid := '0';
                    r.state     := DATA_PACKET_TGB;
                else
                    -- auxiliary data
                    r.aux_valid := '1';
                    r.vsync     := chs_terc4(0)(1);
                    r.hsync     := chs_terc4(0)(0);
                end if;
            
            when DATA_PACKET_TGB =>
                r.state := CONTROL;
            
        end case;
        
        if reset='1' then
            r   := reg_type_def;
        end if;
        next_reg    <= r;
    end process;
    
    sync_stm_proc : process(reset, pixel_clock)
    begin
        if reset='1' then
            cur_reg     <= reg_type_def;
            watchdog    <= (others => '0');
        elsif rising_edge(pixel_clock) then
            cur_reg <= next_reg;
            
            -- synchronisation watchdog
            if
                cur_reg.state/=RESET_CHANNEL_DECODERS and
                cur_reg.state/=WAIT_FOR_SYNC
            then
                watchdog    <= watchdog+1;
                if chs_data_valid/="111" then
                    cur_reg <= reg_type_def;
                end if;
            end if;
            
            if watchdog(watchdog'high)='1' then
                cur_reg <= reg_type_def;
            end if;
            
            if is_ch_ctl="111" then
                watchdog    <= (others => '0');
            end if;
        end if;
    end process;

end Behavioral;
