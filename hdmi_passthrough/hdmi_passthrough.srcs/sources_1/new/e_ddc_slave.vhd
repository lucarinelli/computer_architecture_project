----------------------------------------------------------------------------------
-- Description: 
--   This core implements the enhanced display data channel (1.1) in slave mode
--   and is compatible to DDC2B
-- Additional Comments:
--   Generic:
--     READ_ADDR     : 8bit read address of the DDC receiver, usually 0xA1
--     WRITE_ADDR    : 8bit write address of the DDC receiver, usually 0xA0
--     SEG_P_ADDR    : 8bit write address of the segment pointer, usually 0x60
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real."ceil";
use IEEE.math_real."log2";

entity E_DDC_SLAVE is
    generic (
        READ_ADDR       : std_logic_vector(7 downto 0) := x"A1";
        WRITE_ADDR      : std_logic_vector(7 downto 0) := x"A0";
        SEG_P_ADDR      : std_logic_vector(7 downto 0) := x"60"
    );
    port (
        CLK : in std_logic;
        RST : in std_logic;
        
        DATA_IN_ADDR    : in natural range 0 to 63;
        DATA_IN_WR_EN   : in std_logic;
        DATA_IN         : in std_logic_vector(7 downto 0);
        BLOCK_VALID     : in std_logic;
        BLOCK_INVALID   : in std_logic;
        
        SDA_IN  : in std_logic;
        SDA_OUT : out std_logic := '1';
        SCL_IN  : in std_logic;
        SCL_OUT : out std_logic := '1';
        
        BLOCK_CHECK     : out std_logic := '0';
        BLOCK_REQUEST   : out std_logic := '0';
        BLOCK_NUMBER    : out std_logic_vector(7 downto 0) := x"00";
        BUSY            : out std_logic := '0'
    );
end E_DDC_SLAVE;

architecture rtl of E_DDC_SLAVE is
    
    constant BLOCK_SIZE : natural := 128;
    
    type state_type is (
        INIT,
        WAIT_FOR_SENDER,
        WAIT_FOR_START,
        GET_ADDR_WAIT_FOR_SCL_LOW,
        GET_ADDR_WAIT_FOR_SCL_HIGH,
        CHECK_ADDR_WAIT_FOR_SCL_LOW,
        CHECK_ADDR,
        SEG_P_ADDR_SEND_ACK_WAIT_FOR_SCL_HIGH,
        SEG_P_ADDR_SEND_ACK_WAIT_FOR_SCL_LOW,
        GET_SEG_P_WAIT_FOR_SCL_HIGH,
        GET_SEG_P_WAIT_FOR_SCL_LOW,
        CHECK_FOR_BLOCK_WAIT_FOR_SCL_LOW,
        CHECK_FOR_BLOCK,
        BLOCK_NUM_SEND_ACK_WAIT_FOR_SCL_HIGH,
        BLOCK_NUM_SEND_ACK_WAIT_FOR_SCL_LOW,
        WRITE_ADDR_SEND_ACK_WAIT_FOR_SCL_HIGH,
        WRITE_ADDR_SEND_ACK_WAIT_FOR_SCL_LOW,
        GET_WORD_OFFS_WAIT_FOR_SCL_HIGH,
        GET_WORD_OFFS_WAIT_FOR_SCL_LOW,
        REQUEST_BLOCK,
        READ_ADDR_SEND_ACK_WAIT_FOR_SCL_HIGH,
        READ_ADDR_SEND_ACK_WAIT_FOR_SCL_LOW,
        SEND_BYTE_WAIT_FOR_SCL_HIGH,
        SEND_BYTE_WAIT_FOR_SCL_LOW,
        CHECK_FOR_BLOCK_END,
        SEND_BYTE_GET_ACK_WAIT_FOR_SCL_HIGH,
        SEND_BYTE_GET_ACK_WAIT_FOR_SCL_LOW,
        SEND_NACK_WAIT_FOR_SCL_HIGH,
        SEND_NACK_WAIT_FOR_SCL_LOW
    );
    
    type reg_type is record
        state           : state_type;
        sda_out         : std_logic;
        scl_out         : std_logic;
        segment_pointer : std_logic_vector(6 downto 0);
        byte            : std_logic_vector(7 downto 0);
        bit_index       : natural range 0 to 7; -- 0..7
        block_check     : std_logic;
        block_request   : std_logic;
        block_number    : std_logic_vector(7 downto 0);
        --ram_rd_addr     : std_ulogic_vector(log2(BLOCK_SIZE-1)-1 downto 0);
        ram_rd_addr : natural range 0 to BLOCK_SIZE-1;
    end record;
    
    constant reg_type_def   : reg_type := (
        state           => INIT,
        sda_out         => '1',
        scl_out         => '1',
        segment_pointer => "0000000",
        byte            => x"00",
        bit_index       => 3,
        block_check     => '0',
        block_request   => '0',
        block_number    => x"00",
        ram_rd_addr     => 0
    );
    
    signal cur_reg, next_reg    : reg_type := reg_type_def;
    
    signal ram_dout     : std_logic_vector(7 downto 0) := x"00";
    
    signal sda_in_sync  : std_ulogic := '1';
    signal scl_in_sync  : std_ulogic := '1';
    signal sda_in_q     : std_ulogic := '1';
    signal scl_in_q     : std_ulogic := '1';
    signal stop         : std_ulogic := '0';
    
    component SIGNAL_SYNC
        generic (
            DEFAULT_VALUE   : std_logic := '0';
            SHIFT_LEVELS    : positive range 2 to 16 := 2
        );
        port (
            CLK : in std_logic;        
            DIN : in std_logic;
            DOUT    : out std_logic := DEFAULT_VALUE
        );
    end component;
    
    component DUAL_PORT_RAM
        generic (
            -- default: 1 Kilobyte in bytes
            WIDTH       : natural := 8;
            DEPTH       : natural := 1024;
            WRITE_FIRST : boolean := true
        );
        port (
            CLK : in std_ulogic;
    
            RD_ADDR : in natural range 0 to 1023;
            WR_EN   : in std_logic;
            WR_ADDR : in natural range 0 to 1023;
            DIN     : in std_logic_vector(WIDTH-1 downto 0);
    
            DOUT    : out std_logic_vector(WIDTH-1 downto 0) := (others => '0')
        );
    end component;
    
begin
    
    SDA_OUT <= '0' when cur_reg.sda_out='0' else 'Z';
    SCL_OUT <= '0' when cur_reg.scl_out='0' else 'Z';
    
    BUSY            <= '0' when cur_reg.state=WAIT_FOR_START else '1';
    
    BLOCK_CHECK     <= cur_reg.block_check;
    BLOCK_REQUEST   <= cur_reg.block_request;
    BLOCK_NUMBER    <= cur_reg.block_number;
    
    SCL_IN_SIGNAL_SYNC_inst : signal_sync
        generic map (
            DEFAULT_VALUE   => '1'
        )
        port map (
            CLK     => CLK,
            DIN     => SCL_IN,
            DOUT    => scl_in_sync
        );
    
    SDA_IN_SIGNAL_SYNC_inst : signal_sync
        generic map (
            DEFAULT_VALUE   => '1'
        )
        port map (
            CLK     => CLK,
            DIN     => SDA_IN,
            DOUT    => sda_in_sync
        );
    
    DUAL_PORT_RAM_inst : dual_port_ram
        generic map (
            WIDTH   => 8,
            DEPTH   => BLOCK_SIZE
        )
        port map (
            CLK => CLK,
            
            RD_ADDR => cur_reg.ram_rd_addr,
            WR_EN   => DATA_IN_WR_EN,
            WR_ADDR => DATA_IN_ADDR,
            DIN     => DATA_IN,
            
            DOUT    => ram_dout
        );
    
    stop_detect_proc : process(CLK)
    begin
        if rising_edge(CLK) then
            sda_in_q    <= sda_in_sync;
            scl_in_q    <= scl_in_sync;
            -- stop condition: SDA from low to high while SCL remains high
            stop        <=
                (scl_in_q and scl_in_sync) and
                (not sda_in_q and sda_in_sync);
        end if;
    end process;
    
    stm_proc : process(RST, cur_reg, BLOCK_VALID,
        BLOCK_INVALID, sda_in_sync, scl_in_sync, stop, ram_dout)
        alias cr is cur_reg;
        variable r  : reg_type := reg_type_def;
    begin
        r   := cr;
        
        r.scl_out       := '1';
        r.sda_out       := '1';
        r.block_check   := '0';
        r.block_request := '0';
        
        case cur_reg.state is
            
            when INIT =>
                r.bit_index     := 3;
                r.ram_rd_addr   := 0;
                r.state         := WAIT_FOR_SENDER;
            
            when WAIT_FOR_SENDER =>
                if (scl_in_sync and sda_in_sync)='1' then
                    r.state := WAIT_FOR_START;
                end if;
            
            when WAIT_FOR_START =>
                if sda_in_sync='0' then
                    r.state := GET_ADDR_WAIT_FOR_SCL_LOW;
                end if;
            
            when GET_ADDR_WAIT_FOR_SCL_LOW =>
                if scl_in_sync='0' then
                    r.state := GET_ADDR_WAIT_FOR_SCL_HIGH;
                end if;
            
            when GET_ADDR_WAIT_FOR_SCL_HIGH =>
                r.byte(cr.bit_index) := sda_in_sync;
                if scl_in_sync='1' then
                    r.bit_index := cr.bit_index-1;
                    r.state     := GET_ADDR_WAIT_FOR_SCL_LOW;
                    if cr.bit_index=0 then
                        r.state := CHECK_ADDR_WAIT_FOR_SCL_LOW;
                    end if;
                end if;
            
            when CHECK_ADDR_WAIT_FOR_SCL_LOW =>
                if scl_in_sync='0' then
                    r.state := CHECK_ADDR;
                end if;
            
            when CHECK_ADDR =>
                if    cr.byte=SEG_P_ADDR then r.state  := SEG_P_ADDR_SEND_ACK_WAIT_FOR_SCL_HIGH;
                elsif cr.byte=WRITE_ADDR then r.state  := WRITE_ADDR_SEND_ACK_WAIT_FOR_SCL_HIGH;
                elsif cr.byte=READ_ADDR  then r.state  := REQUEST_BLOCK;
                else                          r.state  := INIT; -- unrecognized address
                end if;
            
            when SEG_P_ADDR_SEND_ACK_WAIT_FOR_SCL_HIGH =>
                r.sda_out   := '0';
                if scl_in_sync='1' then
                    r.state := SEG_P_ADDR_SEND_ACK_WAIT_FOR_SCL_LOW;
                end if;
            
            when SEG_P_ADDR_SEND_ACK_WAIT_FOR_SCL_LOW =>
                r.sda_out   := '0';
                if scl_in_sync='0' then
                    r.state := GET_SEG_P_WAIT_FOR_SCL_HIGH;
                end if;
            
            when GET_SEG_P_WAIT_FOR_SCL_HIGH =>
                r.byte(cr.bit_index)   := sda_in_sync;
                -- check for first block of that segment
                r.block_number              := cr.byte(6 downto 0) & "0";
                r.segment_pointer           := cr.byte(6 downto 0);
                if scl_in_sync='1' then
                    r.bit_index := cr.bit_index-1;
                    r.state     := GET_SEG_P_WAIT_FOR_SCL_LOW;
                    if cr.bit_index=0 then
                        r.state := CHECK_FOR_BLOCK_WAIT_FOR_SCL_LOW;
                    end if;
                end if;
            
            when GET_SEG_P_WAIT_FOR_SCL_LOW =>
                if scl_in_sync='0' then
                    r.state := GET_SEG_P_WAIT_FOR_SCL_HIGH;
                end if;
            
            when CHECK_FOR_BLOCK_WAIT_FOR_SCL_LOW =>
                if scl_in_sync='0' then
                    r.state := CHECK_FOR_BLOCK;
                end if;
            
            when CHECK_FOR_BLOCK =>
                -- stretch the clock until the requested block is checked
                r.scl_out       := '0';
                r.block_check   := '1';
                if BLOCK_VALID='1' then
                    r.state := BLOCK_NUM_SEND_ACK_WAIT_FOR_SCL_HIGH;
                end if;
                if BLOCK_INVALID='1' then
                    r.state := SEND_NACK_WAIT_FOR_SCL_HIGH;
                end if;
            
            when BLOCK_NUM_SEND_ACK_WAIT_FOR_SCL_HIGH =>
                r.sda_out   := '0';
                if scl_in_sync='1' then
                    r.state := BLOCK_NUM_SEND_ACK_WAIT_FOR_SCL_LOW;
                end if;
            
            when BLOCK_NUM_SEND_ACK_WAIT_FOR_SCL_LOW =>
                r.sda_out   := '0';
                if scl_in_sync='0' then
                    r.state := INIT;
                end if;
            
            when WRITE_ADDR_SEND_ACK_WAIT_FOR_SCL_HIGH =>
                r.sda_out   := '0';
                if scl_in_sync='1' then
                    r.state := WRITE_ADDR_SEND_ACK_WAIT_FOR_SCL_LOW;
                end if;
            
            when WRITE_ADDR_SEND_ACK_WAIT_FOR_SCL_LOW =>
                r.sda_out   := '0';
                if scl_in_sync='0' then
                    r.state := GET_WORD_OFFS_WAIT_FOR_SCL_HIGH;
                end if;
            
            when GET_WORD_OFFS_WAIT_FOR_SCL_HIGH =>
                r.byte(cr.bit_index)   := sda_in_sync;
                -- the highest bit of the word offset determines the block in that segment
                r.block_number              := cr.segment_pointer & cr.byte(7);
                if scl_in_sync='1' then
                    r.bit_index := cr.bit_index-1;
                    r.state     := GET_WORD_OFFS_WAIT_FOR_SCL_LOW;
                    if cr.bit_index=0 then
                        r.state := CHECK_FOR_BLOCK_WAIT_FOR_SCL_LOW;
                    end if;
                end if;
            
            when GET_WORD_OFFS_WAIT_FOR_SCL_LOW =>
                if scl_in_sync='0' then
                    r.state := GET_WORD_OFFS_WAIT_FOR_SCL_HIGH;
                end if;
            
            when REQUEST_BLOCK =>
                -- stretch the clock until the requested block has been written to the RAM
                r.scl_out       := '0';
                r.block_request := '1';
                if BLOCK_VALID='1' then
                    r.state := READ_ADDR_SEND_ACK_WAIT_FOR_SCL_HIGH;
                end if;
                if BLOCK_INVALID='1' then
                    r.state := SEND_NACK_WAIT_FOR_SCL_HIGH;
                end if;
            
            when READ_ADDR_SEND_ACK_WAIT_FOR_SCL_HIGH =>
                r.sda_out   := '0';
                if scl_in_sync='1' then
                    r.state := READ_ADDR_SEND_ACK_WAIT_FOR_SCL_LOW;
                end if;
            
            when READ_ADDR_SEND_ACK_WAIT_FOR_SCL_LOW =>
                r.sda_out   := '0';
                if scl_in_sync='0' then
                    r.state := SEND_BYTE_WAIT_FOR_SCL_HIGH;
                end if;
            
            when SEND_BYTE_WAIT_FOR_SCL_HIGH =>
                r.sda_out   := ram_dout(cr.bit_index);
                if scl_in_sync='1' then
                    r.state := SEND_BYTE_WAIT_FOR_SCL_LOW;
                end if;
            
            when SEND_BYTE_WAIT_FOR_SCL_LOW =>
                r.sda_out   := ram_dout(cr.bit_index);
                if scl_in_sync='0' then
                    r.bit_index := cr.bit_index-1;
                    r.state     := SEND_BYTE_WAIT_FOR_SCL_HIGH;
                    if cr.bit_index=0 then
                        r.state := CHECK_FOR_BLOCK_END;
                    end if;
                end if;
            
            when CHECK_FOR_BLOCK_END =>
                r.state := SEND_BYTE_GET_ACK_WAIT_FOR_SCL_HIGH;
                if cr.ram_rd_addr=BLOCK_SIZE-1 then
                    -- second block of segment
                    r.block_number(0)   := '1';
                    r.state             := REQUEST_BLOCK;
                end if;
            
            when SEND_BYTE_GET_ACK_WAIT_FOR_SCL_HIGH =>
                if scl_in_sync='1' then
                    r.state := SEND_BYTE_GET_ACK_WAIT_FOR_SCL_LOW;
                    if sda_in_sync='1' then
                        -- NACK from master, end of transmission
                        r.state := INIT;
                    end if;
                end if;
            
            when SEND_BYTE_GET_ACK_WAIT_FOR_SCL_LOW =>
                if scl_in_sync='0' then
                    r.ram_rd_addr   := cr.ram_rd_addr+1;
                    r.state         := SEND_BYTE_WAIT_FOR_SCL_HIGH;
                end if;
            
            when SEND_NACK_WAIT_FOR_SCL_HIGH =>
                if scl_in_sync='1' then
                    r.state := SEND_NACK_WAIT_FOR_SCL_LOW;
                end if;
            
            when SEND_NACK_WAIT_FOR_SCL_LOW =>
                if scl_in_sync='0' then
                    r.state := INIT;
                end if;
            
        end case;
        
        if RST='1' or stop='1' then
            r   := reg_type_def;
        end if;
        
        next_reg    <= r;
    end process;

    sync_stm_proc : process(RST, CLK)
    begin
        if RST='1' then
            cur_reg <= reg_type_def;
        elsif rising_edge(CLK) then
            cur_reg <= next_reg;
        end if;
    end process;
    
end;