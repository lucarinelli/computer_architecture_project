-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
-- Date        : Mon May 14 00:07:45 2018
-- Host        : SATANASSO running 64-bit unknown
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/hdmi_out_test/hdmi_out_test.sim/sim_1/synth/func/xsim/hdmi_controller_tb_func_synth.vhd
-- Design      : hdmi_controller
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wiz_hdmi_clk_wiz_hdmi_clk_wiz is
  port (
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of clk_wiz_hdmi_clk_wiz_hdmi_clk_wiz : entity is "clk_wiz_hdmi_clk_wiz";
end clk_wiz_hdmi_clk_wiz_hdmi_clk_wiz;

architecture STRUCTURE of clk_wiz_hdmi_clk_wiz_hdmi_clk_wiz is
  signal clk_in1_clk_wiz_hdmi : STD_LOGIC;
  signal clk_out1_clk_wiz_hdmi : STD_LOGIC;
  signal clk_out2_clk_wiz_hdmi : STD_LOGIC;
  signal clkfbout_buf_clk_wiz_hdmi : STD_LOGIC;
  signal clkfbout_clk_wiz_hdmi : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT2_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT3_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute box_type : string;
  attribute box_type of clkf_buf : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of clkin1_ibufg : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of clkin1_ibufg : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of clkin1_ibufg : label is "AUTO";
  attribute box_type of clkin1_ibufg : label is "PRIMITIVE";
  attribute box_type of clkout1_buf : label is "PRIMITIVE";
  attribute box_type of clkout2_buf : label is "PRIMITIVE";
  attribute box_type of plle2_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_clk_wiz_hdmi,
      O => clkfbout_buf_clk_wiz_hdmi
    );
clkin1_ibufg: unisim.vcomponents.IBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => clk_in1,
      O => clk_in1_clk_wiz_hdmi
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out1_clk_wiz_hdmi,
      O => clk_out1
    );
clkout2_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out2_clk_wiz_hdmi,
      O => clk_out2
    );
plle2_adv_inst: unisim.vcomponents.PLLE2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT => 8,
      CLKFBOUT_PHASE => 0.000000,
      CLKIN1_PERIOD => 8.000000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE => 40,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT1_DIVIDE => 4,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 1,
      IS_CLKINSEL_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      STARTUP_WAIT => "FALSE"
    )
        port map (
      CLKFBIN => clkfbout_buf_clk_wiz_hdmi,
      CLKFBOUT => clkfbout_clk_wiz_hdmi,
      CLKIN1 => clk_in1_clk_wiz_hdmi,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKOUT0 => clk_out1_clk_wiz_hdmi,
      CLKOUT1 => clk_out2_clk_wiz_hdmi,
      CLKOUT2 => NLW_plle2_adv_inst_CLKOUT2_UNCONNECTED,
      CLKOUT3 => NLW_plle2_adv_inst_CLKOUT3_UNCONNECTED,
      CLKOUT4 => NLW_plle2_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_plle2_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_plle2_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => locked,
      PWRDWN => '0',
      RST => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity serializer10bit is
  port (
    ch : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 5 downto 0 )
  );
end serializer10bit;

architecture STRUCTURE of serializer10bit is
  signal \count[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \count[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \count[2]_i_1__1_n_0\ : STD_LOGIC;
  signal \count[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_reg_n_0_[3]\ : STD_LOGIC;
  signal \dout_i_1__1_n_0\ : STD_LOGIC;
  signal \dout_i_2__1_n_0\ : STD_LOGIC;
  signal \dout_i_3__1_n_0\ : STD_LOGIC;
  signal \dout_i_4__1_n_0\ : STD_LOGIC;
  signal internal : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \internal[9]_i_1__1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1__1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \count[1]_i_1__1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \count[2]_i_1__1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \count[3]_i_1__1\ : label is "soft_lutpair10";
begin
\count[0]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      O => \count[0]_i_1__1_n_0\
    );
\count[1]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0FB0"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => \count_reg_n_0_[0]\,
      O => \count[1]_i_1__1_n_0\
    );
\count[2]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      O => \count[2]_i_1__1_n_0\
    );
\count[3]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AA2"
    )
        port map (
      I0 => \count_reg_n_0_[3]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      I3 => \count_reg_n_0_[2]\,
      O => \count[3]_i_1__1_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \count[0]_i_1__1_n_0\,
      Q => \count_reg_n_0_[0]\,
      R => '0'
    );
\count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \count[1]_i_1__1_n_0\,
      Q => \count_reg_n_0_[1]\,
      R => '0'
    );
\count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \count[2]_i_1__1_n_0\,
      Q => \count_reg_n_0_[2]\,
      R => '0'
    );
\count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \count[3]_i_1__1_n_0\,
      Q => \count_reg_n_0_[3]\,
      R => '0'
    );
\dout_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \dout_i_2__1_n_0\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \dout_i_3__1_n_0\,
      I3 => \count_reg_n_0_[2]\,
      I4 => \dout_i_4__1_n_0\,
      O => \dout_i_1__1_n_0\
    );
\dout_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00EFEFFF004040"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => internal(0),
      I2 => \count_reg_n_0_[1]\,
      I3 => internal(9),
      I4 => \count_reg_n_0_[0]\,
      I5 => internal(8),
      O => \dout_i_2__1_n_0\
    );
\dout_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => internal(7),
      I1 => internal(6),
      I2 => \count_reg_n_0_[1]\,
      I3 => internal(0),
      I4 => \count_reg_n_0_[0]\,
      I5 => internal(4),
      O => \dout_i_3__1_n_0\
    );
\dout_i_4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => internal(7),
      I1 => internal(6),
      I2 => \count_reg_n_0_[1]\,
      I3 => internal(0),
      I4 => \count_reg_n_0_[0]\,
      I5 => internal(0),
      O => \dout_i_4__1_n_0\
    );
dout_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \dout_i_1__1_n_0\,
      Q => ch(0),
      R => '0'
    );
\internal[9]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      I3 => \count_reg_n_0_[3]\,
      O => \internal[9]_i_1__1_n_0\
    );
\internal_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1__1_n_0\,
      D => D(0),
      Q => internal(0),
      R => '0'
    );
\internal_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1__1_n_0\,
      D => D(1),
      Q => internal(4),
      R => '0'
    );
\internal_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1__1_n_0\,
      D => D(2),
      Q => internal(6),
      R => '0'
    );
\internal_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1__1_n_0\,
      D => D(3),
      Q => internal(7),
      R => '0'
    );
\internal_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1__1_n_0\,
      D => D(4),
      Q => internal(8),
      R => '0'
    );
\internal_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1__1_n_0\,
      D => D(5),
      Q => internal(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity serializer10bit_0 is
  port (
    ch : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of serializer10bit_0 : entity is "serializer10bit";
end serializer10bit_0;

architecture STRUCTURE of serializer10bit_0 is
  signal \count[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \count[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \count[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \count[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_reg_n_0_[3]\ : STD_LOGIC;
  signal \dout_i_1__0_n_0\ : STD_LOGIC;
  signal \dout_i_2__0_n_0\ : STD_LOGIC;
  signal \dout_i_3__0_n_0\ : STD_LOGIC;
  signal \dout_i_4__0_n_0\ : STD_LOGIC;
  signal internal : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \internal[9]_i_1__0_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1__0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \count[1]_i_1__0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \count[2]_i_1__0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \count[3]_i_1__0\ : label is "soft_lutpair5";
begin
\count[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      O => \count[0]_i_1__0_n_0\
    );
\count[1]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0FB0"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => \count_reg_n_0_[0]\,
      O => \count[1]_i_1__0_n_0\
    );
\count[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      O => \count[2]_i_1__0_n_0\
    );
\count[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AA2"
    )
        port map (
      I0 => \count_reg_n_0_[3]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      I3 => \count_reg_n_0_[2]\,
      O => \count[3]_i_1__0_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \count[0]_i_1__0_n_0\,
      Q => \count_reg_n_0_[0]\,
      R => '0'
    );
\count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \count[1]_i_1__0_n_0\,
      Q => \count_reg_n_0_[1]\,
      R => '0'
    );
\count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \count[2]_i_1__0_n_0\,
      Q => \count_reg_n_0_[2]\,
      R => '0'
    );
\count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \count[3]_i_1__0_n_0\,
      Q => \count_reg_n_0_[3]\,
      R => '0'
    );
\dout_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \dout_i_2__0_n_0\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \dout_i_3__0_n_0\,
      I3 => \count_reg_n_0_[2]\,
      I4 => \dout_i_4__0_n_0\,
      O => \dout_i_1__0_n_0\
    );
\dout_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00EFEFFF004040"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => internal(0),
      I2 => \count_reg_n_0_[1]\,
      I3 => internal(9),
      I4 => \count_reg_n_0_[0]\,
      I5 => internal(8),
      O => \dout_i_2__0_n_0\
    );
\dout_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => internal(7),
      I1 => internal(6),
      I2 => \count_reg_n_0_[1]\,
      I3 => internal(0),
      I4 => \count_reg_n_0_[0]\,
      I5 => internal(4),
      O => \dout_i_3__0_n_0\
    );
\dout_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => internal(7),
      I1 => internal(6),
      I2 => \count_reg_n_0_[1]\,
      I3 => internal(0),
      I4 => \count_reg_n_0_[0]\,
      I5 => internal(0),
      O => \dout_i_4__0_n_0\
    );
dout_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \dout_i_1__0_n_0\,
      Q => ch(0),
      R => '0'
    );
\internal[9]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      I3 => \count_reg_n_0_[3]\,
      O => \internal[9]_i_1__0_n_0\
    );
\internal_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1__0_n_0\,
      D => D(0),
      Q => internal(0),
      R => '0'
    );
\internal_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1__0_n_0\,
      D => D(1),
      Q => internal(4),
      R => '0'
    );
\internal_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1__0_n_0\,
      D => D(2),
      Q => internal(6),
      R => '0'
    );
\internal_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1__0_n_0\,
      D => D(3),
      Q => internal(7),
      R => '0'
    );
\internal_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1__0_n_0\,
      D => D(4),
      Q => internal(8),
      R => '0'
    );
\internal_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1__0_n_0\,
      D => D(5),
      Q => internal(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity serializer10bit_1 is
  port (
    ch : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of serializer10bit_1 : entity is "serializer10bit";
end serializer10bit_1;

architecture STRUCTURE of serializer10bit_1 is
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[1]_i_1_n_0\ : STD_LOGIC;
  signal \count[2]_i_1_n_0\ : STD_LOGIC;
  signal \count[3]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_reg_n_0_[3]\ : STD_LOGIC;
  signal dout_i_1_n_0 : STD_LOGIC;
  signal dout_i_2_n_0 : STD_LOGIC;
  signal dout_i_3_n_0 : STD_LOGIC;
  signal dout_i_4_n_0 : STD_LOGIC;
  signal internal : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \internal[9]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count[3]_i_1\ : label is "soft_lutpair0";
begin
\count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      O => \count[0]_i_1_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0FB0"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => \count_reg_n_0_[0]\,
      O => \count[1]_i_1_n_0\
    );
\count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      O => \count[2]_i_1_n_0\
    );
\count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AA2"
    )
        port map (
      I0 => \count_reg_n_0_[3]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      I3 => \count_reg_n_0_[2]\,
      O => \count[3]_i_1_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \count[0]_i_1_n_0\,
      Q => \count_reg_n_0_[0]\,
      R => '0'
    );
\count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \count[1]_i_1_n_0\,
      Q => \count_reg_n_0_[1]\,
      R => '0'
    );
\count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \count[2]_i_1_n_0\,
      Q => \count_reg_n_0_[2]\,
      R => '0'
    );
\count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \count[3]_i_1_n_0\,
      Q => \count_reg_n_0_[3]\,
      R => '0'
    );
dout_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => dout_i_2_n_0,
      I1 => \count_reg_n_0_[3]\,
      I2 => dout_i_3_n_0,
      I3 => \count_reg_n_0_[2]\,
      I4 => dout_i_4_n_0,
      O => dout_i_1_n_0
    );
dout_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00EFEFFF004040"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => internal(0),
      I2 => \count_reg_n_0_[1]\,
      I3 => internal(9),
      I4 => \count_reg_n_0_[0]\,
      I5 => internal(8),
      O => dout_i_2_n_0
    );
dout_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => internal(7),
      I1 => internal(6),
      I2 => \count_reg_n_0_[1]\,
      I3 => internal(0),
      I4 => \count_reg_n_0_[0]\,
      I5 => internal(4),
      O => dout_i_3_n_0
    );
dout_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => internal(7),
      I1 => internal(6),
      I2 => \count_reg_n_0_[1]\,
      I3 => internal(0),
      I4 => \count_reg_n_0_[0]\,
      I5 => internal(0),
      O => dout_i_4_n_0
    );
dout_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => dout_i_1_n_0,
      Q => ch(0),
      R => '0'
    );
\internal[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      I3 => \count_reg_n_0_[3]\,
      O => \internal[9]_i_1_n_0\
    );
\internal_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1_n_0\,
      D => D(0),
      Q => internal(0),
      R => '0'
    );
\internal_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1_n_0\,
      D => D(1),
      Q => internal(4),
      R => '0'
    );
\internal_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1_n_0\,
      D => D(2),
      Q => internal(6),
      R => '0'
    );
\internal_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1_n_0\,
      D => D(3),
      Q => internal(7),
      R => '0'
    );
\internal_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1_n_0\,
      D => D(4),
      Q => internal(8),
      R => '0'
    );
\internal_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \internal[9]_i_1_n_0\,
      D => D(5),
      Q => internal(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wiz_hdmi is
  port (
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
end clk_wiz_hdmi;

architecture STRUCTURE of clk_wiz_hdmi is
begin
inst: entity work.clk_wiz_hdmi_clk_wiz_hdmi_clk_wiz
     port map (
      clk_in1 => clk_in1,
      clk_out1 => clk_out1,
      clk_out2 => clk_out2,
      locked => locked,
      reset => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity tmds_encoder is
  port (
    ch : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    sel0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    \mode_reg[2]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    clk_out1 : in STD_LOGIC
  );
end tmds_encoder;

architecture STRUCTURE of tmds_encoder is
  signal data_out : STD_LOGIC_VECTOR ( 9 to 9 );
  signal \data_out1__0\ : STD_LOGIC;
  signal data_to_serializer : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \data_to_serializer[4]_i_1_n_0\ : STD_LOGIC;
  signal \data_to_serializer[6]_i_1_n_0\ : STD_LOGIC;
  signal \data_to_serializer[8]_i_1_n_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal \total_disp[1]_i_1_n_0\ : STD_LOGIC;
  signal \total_disp[2]_i_1_n_0\ : STD_LOGIC;
  signal \total_disp[3]_i_1_n_0\ : STD_LOGIC;
  signal \total_disp_reg_n_0_[1]\ : STD_LOGIC;
  signal \total_disp_reg_n_0_[2]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \data_to_serializer[4]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \data_to_serializer[6]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \data_to_serializer[9]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \total_disp[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \total_disp[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \total_disp[3]_i_1\ : label is "soft_lutpair3";
begin
\data_to_serializer[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"54FFFFAA"
    )
        port map (
      I0 => p_1_in,
      I1 => \total_disp_reg_n_0_[1]\,
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => Q(0),
      I4 => Q(1),
      O => \data_to_serializer[4]_i_1_n_0\
    );
\data_to_serializer[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"540000AA"
    )
        port map (
      I0 => p_1_in,
      I1 => \total_disp_reg_n_0_[1]\,
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => Q(0),
      I4 => Q(1),
      O => \data_to_serializer[6]_i_1_n_0\
    );
\data_to_serializer[8]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Q(1),
      O => \data_to_serializer[8]_i_1_n_0\
    );
\data_to_serializer[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BB88B88BB88BBB88"
    )
        port map (
      I0 => sel0(0),
      I1 => \mode_reg[2]\,
      I2 => \data_out1__0\,
      I3 => Q(1),
      I4 => Q(0),
      I5 => p_1_in,
      O => data_out(9)
    );
\data_to_serializer[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01FFFF01"
    )
        port map (
      I0 => p_1_in,
      I1 => \total_disp_reg_n_0_[1]\,
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => Q(0),
      I4 => Q(1),
      O => \data_out1__0\
    );
\data_to_serializer_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \data_to_serializer[4]_i_1_n_0\,
      Q => data_to_serializer(0),
      S => \mode_reg[2]\
    );
\data_to_serializer_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \data_to_serializer[4]_i_1_n_0\,
      Q => data_to_serializer(4),
      R => \mode_reg[2]\
    );
\data_to_serializer_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \data_to_serializer[6]_i_1_n_0\,
      Q => data_to_serializer(6),
      R => \mode_reg[2]\
    );
\data_to_serializer_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \data_to_serializer[6]_i_1_n_0\,
      Q => data_to_serializer(7),
      S => \mode_reg[2]\
    );
\data_to_serializer_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \data_to_serializer[8]_i_1_n_0\,
      Q => data_to_serializer(8),
      R => \mode_reg[2]\
    );
\data_to_serializer_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => data_out(9),
      Q => data_to_serializer(9),
      R => '0'
    );
serializer_inst: entity work.serializer10bit_1
     port map (
      CLK => CLK,
      D(5 downto 2) => data_to_serializer(9 downto 6),
      D(1) => data_to_serializer(4),
      D(0) => data_to_serializer(0),
      ch(0) => ch(0)
    );
\total_disp[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"98CCCC66"
    )
        port map (
      I0 => p_1_in,
      I1 => \total_disp_reg_n_0_[1]\,
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => Q(0),
      I4 => Q(1),
      O => \total_disp[1]_i_1_n_0\
    );
\total_disp[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E0F0F078"
    )
        port map (
      I0 => p_1_in,
      I1 => \total_disp_reg_n_0_[1]\,
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => Q(0),
      I4 => Q(1),
      O => \total_disp[2]_i_1_n_0\
    );
\total_disp[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55AAAAD5"
    )
        port map (
      I0 => p_1_in,
      I1 => \total_disp_reg_n_0_[1]\,
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => Q(0),
      I4 => Q(1),
      O => \total_disp[3]_i_1_n_0\
    );
\total_disp_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \total_disp[1]_i_1_n_0\,
      Q => \total_disp_reg_n_0_[1]\,
      R => \mode_reg[2]\
    );
\total_disp_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \total_disp[2]_i_1_n_0\,
      Q => \total_disp_reg_n_0_[2]\,
      R => \mode_reg[2]\
    );
\total_disp_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \total_disp[3]_i_1_n_0\,
      Q => p_1_in,
      R => \mode_reg[2]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \tmds_encoder__parameterized1\ is
  port (
    ch : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \mode_reg[2]\ : in STD_LOGIC;
    clk_out1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \tmds_encoder__parameterized1\ : entity is "tmds_encoder";
end \tmds_encoder__parameterized1\;

architecture STRUCTURE of \tmds_encoder__parameterized1\ is
  signal \data_to_serializer[0]_i_1_n_0\ : STD_LOGIC;
  signal \data_to_serializer[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \data_to_serializer[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \data_to_serializer[7]_i_1_n_0\ : STD_LOGIC;
  signal \data_to_serializer[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \data_to_serializer[9]_i_1__1_n_0\ : STD_LOGIC;
  signal \data_to_serializer_reg_n_0_[0]\ : STD_LOGIC;
  signal \data_to_serializer_reg_n_0_[4]\ : STD_LOGIC;
  signal \data_to_serializer_reg_n_0_[6]\ : STD_LOGIC;
  signal \data_to_serializer_reg_n_0_[7]\ : STD_LOGIC;
  signal \data_to_serializer_reg_n_0_[8]\ : STD_LOGIC;
  signal \data_to_serializer_reg_n_0_[9]\ : STD_LOGIC;
  signal \total_disp[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \total_disp[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \total_disp[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \total_disp_reg_n_0_[1]\ : STD_LOGIC;
  signal \total_disp_reg_n_0_[2]\ : STD_LOGIC;
  signal \total_disp_reg_n_0_[3]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \data_to_serializer[4]_i_1__0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \data_to_serializer[6]_i_1__0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \data_to_serializer[7]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \total_disp[1]_i_1__0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \total_disp[2]_i_1__0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \total_disp[3]_i_1__0\ : label is "soft_lutpair9";
begin
\data_to_serializer[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7777EEE6"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => \total_disp_reg_n_0_[1]\,
      I4 => \total_disp_reg_n_0_[3]\,
      O => \data_to_serializer[0]_i_1_n_0\
    );
\data_to_serializer[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"54FFFFAA"
    )
        port map (
      I0 => \total_disp_reg_n_0_[3]\,
      I1 => \total_disp_reg_n_0_[1]\,
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => Q(0),
      I4 => Q(1),
      O => \data_to_serializer[4]_i_1__0_n_0\
    );
\data_to_serializer[6]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11118880"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => \total_disp_reg_n_0_[1]\,
      I4 => \total_disp_reg_n_0_[3]\,
      O => \data_to_serializer[6]_i_1__0_n_0\
    );
\data_to_serializer[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"540000AA"
    )
        port map (
      I0 => \total_disp_reg_n_0_[3]\,
      I1 => \total_disp_reg_n_0_[1]\,
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => Q(0),
      I4 => Q(1),
      O => \data_to_serializer[7]_i_1_n_0\
    );
\data_to_serializer[8]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Q(1),
      O => \data_to_serializer[8]_i_1__0_n_0\
    );
\data_to_serializer[9]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBBBB222A"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => \total_disp_reg_n_0_[1]\,
      I4 => \total_disp_reg_n_0_[3]\,
      I5 => \mode_reg[2]\,
      O => \data_to_serializer[9]_i_1__1_n_0\
    );
\data_to_serializer_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \data_to_serializer[0]_i_1_n_0\,
      Q => \data_to_serializer_reg_n_0_[0]\,
      R => \mode_reg[2]\
    );
\data_to_serializer_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \data_to_serializer[4]_i_1__0_n_0\,
      Q => \data_to_serializer_reg_n_0_[4]\,
      S => \mode_reg[2]\
    );
\data_to_serializer_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \data_to_serializer[6]_i_1__0_n_0\,
      Q => \data_to_serializer_reg_n_0_[6]\,
      S => \mode_reg[2]\
    );
\data_to_serializer_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \data_to_serializer[7]_i_1_n_0\,
      Q => \data_to_serializer_reg_n_0_[7]\,
      R => \mode_reg[2]\
    );
\data_to_serializer_reg[8]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \data_to_serializer[8]_i_1__0_n_0\,
      Q => \data_to_serializer_reg_n_0_[8]\,
      S => \mode_reg[2]\
    );
\data_to_serializer_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \data_to_serializer[9]_i_1__1_n_0\,
      Q => \data_to_serializer_reg_n_0_[9]\,
      R => '0'
    );
serializer_inst: entity work.serializer10bit_0
     port map (
      CLK => CLK,
      D(5) => \data_to_serializer_reg_n_0_[9]\,
      D(4) => \data_to_serializer_reg_n_0_[8]\,
      D(3) => \data_to_serializer_reg_n_0_[7]\,
      D(2) => \data_to_serializer_reg_n_0_[6]\,
      D(1) => \data_to_serializer_reg_n_0_[4]\,
      D(0) => \data_to_serializer_reg_n_0_[0]\,
      ch(0) => ch(0)
    );
\total_disp[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"98CCCC66"
    )
        port map (
      I0 => \total_disp_reg_n_0_[3]\,
      I1 => \total_disp_reg_n_0_[1]\,
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => Q(0),
      I4 => Q(1),
      O => \total_disp[1]_i_1__0_n_0\
    );
\total_disp[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E0F0F078"
    )
        port map (
      I0 => \total_disp_reg_n_0_[3]\,
      I1 => \total_disp_reg_n_0_[1]\,
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => Q(0),
      I4 => Q(1),
      O => \total_disp[2]_i_1__0_n_0\
    );
\total_disp[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55AAAAD5"
    )
        port map (
      I0 => \total_disp_reg_n_0_[3]\,
      I1 => \total_disp_reg_n_0_[1]\,
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => Q(0),
      I4 => Q(1),
      O => \total_disp[3]_i_1__0_n_0\
    );
\total_disp_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \total_disp[1]_i_1__0_n_0\,
      Q => \total_disp_reg_n_0_[1]\,
      R => \mode_reg[2]\
    );
\total_disp_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \total_disp[2]_i_1__0_n_0\,
      Q => \total_disp_reg_n_0_[2]\,
      R => \mode_reg[2]\
    );
\total_disp_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \total_disp[3]_i_1__0_n_0\,
      Q => \total_disp_reg_n_0_[3]\,
      R => \mode_reg[2]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \tmds_encoder__parameterized3\ is
  port (
    ch : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \mode_reg[2]\ : in STD_LOGIC;
    clk_out1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \tmds_encoder__parameterized3\ : entity is "tmds_encoder";
end \tmds_encoder__parameterized3\;

architecture STRUCTURE of \tmds_encoder__parameterized3\ is
  signal \data_to_serializer[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \data_to_serializer[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \data_to_serializer[8]_i_1__1_n_0\ : STD_LOGIC;
  signal \data_to_serializer[9]_i_1__0_n_0\ : STD_LOGIC;
  signal \data_to_serializer_reg_n_0_[0]\ : STD_LOGIC;
  signal \data_to_serializer_reg_n_0_[4]\ : STD_LOGIC;
  signal \data_to_serializer_reg_n_0_[6]\ : STD_LOGIC;
  signal \data_to_serializer_reg_n_0_[7]\ : STD_LOGIC;
  signal \data_to_serializer_reg_n_0_[8]\ : STD_LOGIC;
  signal \data_to_serializer_reg_n_0_[9]\ : STD_LOGIC;
  signal \total_disp[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \total_disp[2]_i_1__1_n_0\ : STD_LOGIC;
  signal \total_disp[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \total_disp_reg_n_0_[1]\ : STD_LOGIC;
  signal \total_disp_reg_n_0_[2]\ : STD_LOGIC;
  signal \total_disp_reg_n_0_[3]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \data_to_serializer[0]_i_1__0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \data_to_serializer[7]_i_1__0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \data_to_serializer[9]_i_1__0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \total_disp[1]_i_1__1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \total_disp[2]_i_1__1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \total_disp[3]_i_1__1\ : label is "soft_lutpair13";
begin
\data_to_serializer[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"54FFFFAA"
    )
        port map (
      I0 => \total_disp_reg_n_0_[3]\,
      I1 => \total_disp_reg_n_0_[1]\,
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => Q(0),
      I4 => Q(1),
      O => \data_to_serializer[0]_i_1__0_n_0\
    );
\data_to_serializer[7]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"540000AA"
    )
        port map (
      I0 => \total_disp_reg_n_0_[3]\,
      I1 => \total_disp_reg_n_0_[1]\,
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => Q(0),
      I4 => Q(1),
      O => \data_to_serializer[7]_i_1__0_n_0\
    );
\data_to_serializer[8]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Q(1),
      O => \data_to_serializer[8]_i_1__1_n_0\
    );
\data_to_serializer[9]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABFF00AA"
    )
        port map (
      I0 => \total_disp_reg_n_0_[3]\,
      I1 => \total_disp_reg_n_0_[1]\,
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => Q(0),
      I4 => Q(1),
      O => \data_to_serializer[9]_i_1__0_n_0\
    );
\data_to_serializer_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \data_to_serializer[0]_i_1__0_n_0\,
      Q => \data_to_serializer_reg_n_0_[0]\,
      R => \mode_reg[2]\
    );
\data_to_serializer_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \data_to_serializer[0]_i_1__0_n_0\,
      Q => \data_to_serializer_reg_n_0_[4]\,
      S => \mode_reg[2]\
    );
\data_to_serializer_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \data_to_serializer[7]_i_1__0_n_0\,
      Q => \data_to_serializer_reg_n_0_[6]\,
      S => \mode_reg[2]\
    );
\data_to_serializer_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \data_to_serializer[7]_i_1__0_n_0\,
      Q => \data_to_serializer_reg_n_0_[7]\,
      R => \mode_reg[2]\
    );
\data_to_serializer_reg[8]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \data_to_serializer[8]_i_1__1_n_0\,
      Q => \data_to_serializer_reg_n_0_[8]\,
      S => \mode_reg[2]\
    );
\data_to_serializer_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \data_to_serializer[9]_i_1__0_n_0\,
      Q => \data_to_serializer_reg_n_0_[9]\,
      R => \mode_reg[2]\
    );
serializer_inst: entity work.serializer10bit
     port map (
      CLK => CLK,
      D(5) => \data_to_serializer_reg_n_0_[9]\,
      D(4) => \data_to_serializer_reg_n_0_[8]\,
      D(3) => \data_to_serializer_reg_n_0_[7]\,
      D(2) => \data_to_serializer_reg_n_0_[6]\,
      D(1) => \data_to_serializer_reg_n_0_[4]\,
      D(0) => \data_to_serializer_reg_n_0_[0]\,
      ch(0) => ch(0)
    );
\total_disp[1]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"98CCCC66"
    )
        port map (
      I0 => \total_disp_reg_n_0_[3]\,
      I1 => \total_disp_reg_n_0_[1]\,
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => Q(0),
      I4 => Q(1),
      O => \total_disp[1]_i_1__1_n_0\
    );
\total_disp[2]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E0F0F078"
    )
        port map (
      I0 => \total_disp_reg_n_0_[3]\,
      I1 => \total_disp_reg_n_0_[1]\,
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => Q(0),
      I4 => Q(1),
      O => \total_disp[2]_i_1__1_n_0\
    );
\total_disp[3]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55AAAAD5"
    )
        port map (
      I0 => \total_disp_reg_n_0_[3]\,
      I1 => \total_disp_reg_n_0_[1]\,
      I2 => \total_disp_reg_n_0_[2]\,
      I3 => Q(0),
      I4 => Q(1),
      O => \total_disp[3]_i_1__1_n_0\
    );
\total_disp_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \total_disp[1]_i_1__1_n_0\,
      Q => \total_disp_reg_n_0_[1]\,
      R => \mode_reg[2]\
    );
\total_disp_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \total_disp[2]_i_1__1_n_0\,
      Q => \total_disp_reg_n_0_[2]\,
      R => \mode_reg[2]\
    );
\total_disp_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => \total_disp[3]_i_1__1_n_0\,
      Q => \total_disp_reg_n_0_[3]\,
      R => \mode_reg[2]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity tmds_transmitter is
  port (
    ch : out STD_LOGIC_VECTOR ( 2 downto 0 );
    CLK : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \mode_reg[2]\ : in STD_LOGIC;
    clk_out1 : in STD_LOGIC;
    sel0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end tmds_transmitter;

architecture STRUCTURE of tmds_transmitter is
begin
tmds_enc0: entity work.tmds_encoder
     port map (
      CLK => CLK,
      Q(1 downto 0) => Q(5 downto 4),
      ch(0) => ch(0),
      clk_out1 => clk_out1,
      \mode_reg[2]\ => \mode_reg[2]\,
      sel0(0) => sel0(0)
    );
tmds_enc1: entity work.\tmds_encoder__parameterized1\
     port map (
      CLK => CLK,
      Q(1 downto 0) => Q(3 downto 2),
      ch(0) => ch(1),
      clk_out1 => clk_out1,
      \mode_reg[2]\ => \mode_reg[2]\
    );
tmds_enc2: entity work.\tmds_encoder__parameterized3\
     port map (
      CLK => CLK,
      Q(1 downto 0) => Q(1 downto 0),
      ch(0) => ch(2),
      clk_out1 => clk_out1,
      \mode_reg[2]\ => \mode_reg[2]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hdmi_controller is
  port (
    reset : in STD_LOGIC;
    clk_sys : in STD_LOGIC;
    chp : out STD_LOGIC_VECTOR ( 2 downto 0 );
    chn : out STD_LOGIC_VECTOR ( 2 downto 0 );
    chclk : out STD_LOGIC_VECTOR ( 1 downto 0 );
    color_select : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of hdmi_controller : entity is true;
end hdmi_controller;

architecture STRUCTURE of hdmi_controller is
  signal ch : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal clk : STD_LOGIC;
  signal clkx10 : STD_LOGIC;
  signal \color[0]_i_1_n_0\ : STD_LOGIC;
  signal \color[16]_i_1_n_0\ : STD_LOGIC;
  signal \color[17]_i_1_n_0\ : STD_LOGIC;
  signal \color[17]_i_2_n_0\ : STD_LOGIC;
  signal \color[17]_i_3_n_0\ : STD_LOGIC;
  signal \color[17]_i_4_n_0\ : STD_LOGIC;
  signal \color[17]_i_6_n_0\ : STD_LOGIC;
  signal \color[17]_i_7_n_0\ : STD_LOGIC;
  signal \color[1]_i_1_n_0\ : STD_LOGIC;
  signal \color[8]_i_1_n_0\ : STD_LOGIC;
  signal \color[9]_i_1_n_0\ : STD_LOGIC;
  signal \color_reg_n_0_[0]\ : STD_LOGIC;
  signal \color_reg_n_0_[16]\ : STD_LOGIC;
  signal \color_reg_n_0_[17]\ : STD_LOGIC;
  signal \color_reg_n_0_[1]\ : STD_LOGIC;
  signal \color_reg_n_0_[8]\ : STD_LOGIC;
  signal \color_reg_n_0_[9]\ : STD_LOGIC;
  signal color_select_IBUF : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal mode : STD_LOGIC;
  signal \mode[2]_i_1_n_0\ : STD_LOGIC;
  signal \mode_reg_n_0_[2]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal sel0 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal vsync : STD_LOGIC;
  signal vsync_i_1_n_0 : STD_LOGIC;
  signal vsync_i_2_n_0 : STD_LOGIC;
  signal \x[10]_i_2_n_0\ : STD_LOGIC;
  signal \x[10]_i_3_n_0\ : STD_LOGIC;
  signal \x[10]_i_4_n_0\ : STD_LOGIC;
  signal \x[10]_i_5_n_0\ : STD_LOGIC;
  signal \x[10]_i_6_n_0\ : STD_LOGIC;
  signal \x[10]_i_7_n_0\ : STD_LOGIC;
  signal \x[2]_i_1_n_0\ : STD_LOGIC;
  signal \x[3]_i_1_n_0\ : STD_LOGIC;
  signal \x[4]_i_1_n_0\ : STD_LOGIC;
  signal \x[5]_i_1_n_0\ : STD_LOGIC;
  signal \x[6]_i_1_n_0\ : STD_LOGIC;
  signal \x[7]_i_1_n_0\ : STD_LOGIC;
  signal \x[7]_i_2_n_0\ : STD_LOGIC;
  signal \x[8]_i_1_n_0\ : STD_LOGIC;
  signal \x[9]_i_1_n_0\ : STD_LOGIC;
  signal \x_reg[10]_i_1_n_0\ : STD_LOGIC;
  signal \x_reg[10]_i_1_n_1\ : STD_LOGIC;
  signal \x_reg[10]_i_1_n_2\ : STD_LOGIC;
  signal \x_reg[10]_i_1_n_3\ : STD_LOGIC;
  signal \x_reg__0\ : STD_LOGIC_VECTOR ( 10 to 10 );
  signal \x_reg__1\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal y : STD_LOGIC;
  signal \y[2]_i_1_n_0\ : STD_LOGIC;
  signal \y[3]_i_1_n_0\ : STD_LOGIC;
  signal \y[4]_i_1_n_0\ : STD_LOGIC;
  signal \y[5]_i_1_n_0\ : STD_LOGIC;
  signal \y[6]_i_1_n_0\ : STD_LOGIC;
  signal \y[7]_i_1_n_0\ : STD_LOGIC;
  signal \y[8]_i_1_n_0\ : STD_LOGIC;
  signal \y[9]_i_2_n_0\ : STD_LOGIC;
  signal \y[9]_i_4_n_0\ : STD_LOGIC;
  signal \y[9]_i_5_n_0\ : STD_LOGIC;
  signal \y[9]_i_6_n_0\ : STD_LOGIC;
  signal \y[9]_i_7_n_0\ : STD_LOGIC;
  signal \y[9]_i_8_n_0\ : STD_LOGIC;
  signal \y_reg[9]_i_3_n_0\ : STD_LOGIC;
  signal \y_reg[9]_i_3_n_1\ : STD_LOGIC;
  signal \y_reg[9]_i_3_n_2\ : STD_LOGIC;
  signal \y_reg[9]_i_3_n_3\ : STD_LOGIC;
  signal \y_reg__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_clk_wiz_hdmi_0_locked_UNCONNECTED : STD_LOGIC;
  signal \NLW_x_reg[10]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_y_reg[9]_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of OBUFDS_0b : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of OBUFDS_0b : label is "OBUFDS";
  attribute box_type : string;
  attribute box_type of OBUFDS_0b : label is "PRIMITIVE";
  attribute CAPACITANCE of OBUFDS_1g : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM of OBUFDS_1g : label is "OBUFDS";
  attribute box_type of OBUFDS_1g : label is "PRIMITIVE";
  attribute CAPACITANCE of OBUFDS_2r : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM of OBUFDS_2r : label is "OBUFDS";
  attribute box_type of OBUFDS_2r : label is "PRIMITIVE";
  attribute CAPACITANCE of OBUFDS_clk : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM of OBUFDS_clk : label is "OBUFDS";
  attribute box_type of OBUFDS_clk : label is "PRIMITIVE";
  attribute syn_black_box : string;
  attribute syn_black_box of clk_wiz_hdmi_0 : label is "TRUE";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \color[0]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \color[16]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \color[17]_i_3\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \color[17]_i_6\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \color[17]_i_7\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \color[1]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \color[8]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \x[0]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \x[1]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \x[2]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \x[3]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \x[4]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \x[6]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \x[7]_i_2\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \x[8]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \x[9]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \y[1]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \y[2]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \y[4]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \y[7]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \y[8]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \y[9]_i_2\ : label is "soft_lutpair15";
begin
OBUFDS_0b: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ch(0),
      O => chp(0),
      OB => chn(0)
    );
OBUFDS_1g: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ch(1),
      O => chp(1),
      OB => chn(1)
    );
OBUFDS_2r: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ch(2),
      O => chp(2),
      OB => chn(2)
    );
OBUFDS_clk: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => clk,
      O => chclk(0),
      OB => chclk(1)
    );
clk_wiz_hdmi_0: entity work.clk_wiz_hdmi
     port map (
      clk_in1 => clk_sys,
      clk_out1 => clk,
      clk_out2 => clkx10,
      locked => NLW_clk_wiz_hdmi_0_locked_UNCONNECTED,
      reset => '0'
    );
\color[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => color_select_IBUF(0),
      I1 => color_select_IBUF(1),
      O => \color[0]_i_1_n_0\
    );
\color[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => color_select_IBUF(0),
      I1 => color_select_IBUF(1),
      O => \color[16]_i_1_n_0\
    );
\color[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => \x_reg__1\(9),
      I1 => \x_reg__0\(10),
      I2 => \x_reg__1\(8),
      I3 => \color[17]_i_3_n_0\,
      I4 => \color[17]_i_4_n_0\,
      I5 => vsync,
      O => \color[17]_i_1_n_0\
    );
\color[17]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => color_select_IBUF(1),
      O => \color[17]_i_2_n_0\
    );
\color[17]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \x_reg__1\(5),
      I1 => \x_reg__1\(6),
      O => \color[17]_i_3_n_0\
    );
\color[17]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \x_reg__1\(7),
      I1 => \x_reg__1\(4),
      I2 => \x_reg__1\(2),
      I3 => \x_reg__1\(3),
      I4 => \x_reg__1\(0),
      I5 => \x_reg__1\(1),
      O => \color[17]_i_4_n_0\
    );
\color[17]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \color[17]_i_6_n_0\,
      I1 => \color[17]_i_7_n_0\,
      I2 => \y_reg__0\(3),
      I3 => \y_reg__0\(5),
      I4 => \y_reg__0\(2),
      O => vsync
    );
\color[17]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \y_reg__0\(6),
      I1 => \y_reg__0\(8),
      I2 => \y_reg__0\(7),
      O => \color[17]_i_6_n_0\
    );
\color[17]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \y_reg__0\(1),
      I1 => \y_reg__0\(0),
      I2 => \y_reg__0\(9),
      I3 => \y_reg__0\(4),
      O => \color[17]_i_7_n_0\
    );
\color[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => color_select_IBUF(0),
      I1 => color_select_IBUF(1),
      O => \color[1]_i_1_n_0\
    );
\color[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => color_select_IBUF(1),
      I1 => color_select_IBUF(0),
      O => \color[8]_i_1_n_0\
    );
\color[9]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => color_select_IBUF(0),
      O => \color[9]_i_1_n_0\
    );
\color_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \color[17]_i_1_n_0\,
      D => \color[0]_i_1_n_0\,
      Q => \color_reg_n_0_[0]\,
      R => '0'
    );
\color_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \color[17]_i_1_n_0\,
      D => \color[16]_i_1_n_0\,
      Q => \color_reg_n_0_[16]\,
      R => '0'
    );
\color_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \color[17]_i_1_n_0\,
      D => \color[17]_i_2_n_0\,
      Q => \color_reg_n_0_[17]\,
      R => '0'
    );
\color_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \color[17]_i_1_n_0\,
      D => \color[1]_i_1_n_0\,
      Q => \color_reg_n_0_[1]\,
      R => '0'
    );
\color_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \color[17]_i_1_n_0\,
      D => \color[8]_i_1_n_0\,
      Q => \color_reg_n_0_[8]\,
      R => '0'
    );
\color_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \color[17]_i_1_n_0\,
      D => \color[9]_i_1_n_0\,
      Q => \color_reg_n_0_[9]\,
      R => '0'
    );
\color_select_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => color_select(0),
      O => color_select_IBUF(0)
    );
\color_select_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => color_select(1),
      O => color_select_IBUF(1)
    );
\mode[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFE2"
    )
        port map (
      I0 => \mode_reg_n_0_[2]\,
      I1 => mode,
      I2 => \x_reg__0\(10),
      I3 => vsync,
      O => \mode[2]_i_1_n_0\
    );
\mode[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000002"
    )
        port map (
      I0 => \color[17]_i_4_n_0\,
      I1 => \x_reg__1\(8),
      I2 => \x_reg__1\(5),
      I3 => \x_reg__1\(6),
      I4 => \x_reg__1\(9),
      I5 => \x_reg__0\(10),
      O => mode
    );
\mode_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \mode[2]_i_1_n_0\,
      Q => \mode_reg_n_0_[2]\,
      R => '0'
    );
tdms_tx: entity work.tmds_transmitter
     port map (
      CLK => clkx10,
      Q(5) => \color_reg_n_0_[17]\,
      Q(4) => \color_reg_n_0_[16]\,
      Q(3) => \color_reg_n_0_[9]\,
      Q(2) => \color_reg_n_0_[8]\,
      Q(1) => \color_reg_n_0_[1]\,
      Q(0) => \color_reg_n_0_[0]\,
      ch(2 downto 0) => ch(2 downto 0),
      clk_out1 => clk,
      \mode_reg[2]\ => \mode_reg_n_0_[2]\,
      sel0(0) => sel0(1)
    );
vsync_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => vsync_i_2_n_0,
      I1 => sel0(1),
      I2 => vsync,
      O => vsync_i_1_n_0
    );
vsync_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \color[17]_i_4_n_0\,
      I1 => \x_reg__1\(6),
      I2 => \x_reg__1\(5),
      I3 => \x_reg__1\(8),
      I4 => \x_reg__1\(9),
      I5 => \x_reg__0\(10),
      O => vsync_i_2_n_0
    );
vsync_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => vsync_i_1_n_0,
      Q => sel0(1),
      R => '0'
    );
\x[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \x_reg__1\(0),
      O => p_0_in(0)
    );
\x[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \x_reg__0\(10),
      I1 => \x_reg__1\(6),
      I2 => \x[10]_i_7_n_0\,
      I3 => \x_reg__1\(7),
      I4 => \x_reg__1\(8),
      I5 => \x_reg__1\(9),
      O => \x[10]_i_2_n_0\
    );
\x[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000007FFF8000"
    )
        port map (
      I0 => \x_reg__1\(6),
      I1 => \x[10]_i_7_n_0\,
      I2 => \x_reg__1\(7),
      I3 => \x_reg__1\(8),
      I4 => \x_reg__1\(9),
      I5 => \x_reg__0\(10),
      O => \x[10]_i_3_n_0\
    );
\x[10]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1004"
    )
        port map (
      I0 => \x_reg__1\(8),
      I1 => \x_reg__1\(7),
      I2 => \x[10]_i_7_n_0\,
      I3 => \x_reg__1\(6),
      O => \x[10]_i_4_n_0\
    );
\x[10]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000001111111"
    )
        port map (
      I0 => \x_reg__1\(5),
      I1 => \x_reg__1\(4),
      I2 => \x_reg__1\(1),
      I3 => \x_reg__1\(0),
      I4 => \x_reg__1\(2),
      I5 => \x_reg__1\(3),
      O => \x[10]_i_5_n_0\
    );
\x[10]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \x_reg__1\(2),
      I1 => \x_reg__1\(0),
      I2 => \x_reg__1\(1),
      O => \x[10]_i_6_n_0\
    );
\x[10]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \x_reg__1\(5),
      I1 => \x_reg__1\(3),
      I2 => \x_reg__1\(2),
      I3 => \x_reg__1\(0),
      I4 => \x_reg__1\(1),
      I5 => \x_reg__1\(4),
      O => \x[10]_i_7_n_0\
    );
\x[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_reg__1\(0),
      I1 => \x_reg__1\(1),
      O => p_0_in(1)
    );
\x[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \x_reg__1\(2),
      I1 => \x_reg__1\(1),
      I2 => \x_reg__1\(0),
      O => \x[2]_i_1_n_0\
    );
\x[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \x_reg__1\(3),
      I1 => \x_reg__1\(2),
      I2 => \x_reg__1\(0),
      I3 => \x_reg__1\(1),
      O => \x[3]_i_1_n_0\
    );
\x[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \x_reg__1\(4),
      I1 => \x_reg__1\(1),
      I2 => \x_reg__1\(0),
      I3 => \x_reg__1\(2),
      I4 => \x_reg__1\(3),
      O => \x[4]_i_1_n_0\
    );
\x[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \x_reg__1\(4),
      I1 => \x_reg__1\(1),
      I2 => \x_reg__1\(0),
      I3 => \x_reg__1\(2),
      I4 => \x_reg__1\(3),
      I5 => \x_reg__1\(5),
      O => \x[5]_i_1_n_0\
    );
\x[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A6AAAAAA"
    )
        port map (
      I0 => \x_reg__1\(6),
      I1 => \x_reg__1\(4),
      I2 => \x[7]_i_2_n_0\,
      I3 => \x_reg__1\(3),
      I4 => \x_reg__1\(5),
      O => \x[6]_i_1_n_0\
    );
\x[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6AAAAAAAAAAAAA"
    )
        port map (
      I0 => \x_reg__1\(7),
      I1 => \x_reg__1\(5),
      I2 => \x_reg__1\(3),
      I3 => \x[7]_i_2_n_0\,
      I4 => \x_reg__1\(4),
      I5 => \x_reg__1\(6),
      O => \x[7]_i_1_n_0\
    );
\x[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \x_reg__1\(1),
      I1 => \x_reg__1\(0),
      I2 => \x_reg__1\(2),
      O => \x[7]_i_2_n_0\
    );
\x[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \x_reg__1\(8),
      I1 => \x_reg__1\(6),
      I2 => \x[10]_i_7_n_0\,
      I3 => \x_reg__1\(7),
      O => \x[8]_i_1_n_0\
    );
\x[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \x_reg__1\(9),
      I1 => \x_reg__1\(8),
      I2 => \x_reg__1\(7),
      I3 => \x[10]_i_7_n_0\,
      I4 => \x_reg__1\(6),
      O => \x[9]_i_1_n_0\
    );
\x_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_0_in(0),
      Q => \x_reg__1\(0),
      R => \x_reg[10]_i_1_n_0\
    );
\x_reg[10]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \x[10]_i_2_n_0\,
      Q => \x_reg__0\(10),
      S => \x_reg[10]_i_1_n_0\
    );
\x_reg[10]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \x_reg[10]_i_1_n_0\,
      CO(2) => \x_reg[10]_i_1_n_1\,
      CO(1) => \x_reg[10]_i_1_n_2\,
      CO(0) => \x_reg[10]_i_1_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_x_reg[10]_i_1_O_UNCONNECTED\(3 downto 0),
      S(3) => \x[10]_i_3_n_0\,
      S(2) => \x[10]_i_4_n_0\,
      S(1) => \x[10]_i_5_n_0\,
      S(0) => \x[10]_i_6_n_0\
    );
\x_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_0_in(1),
      Q => \x_reg__1\(1),
      R => \x_reg[10]_i_1_n_0\
    );
\x_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \x[2]_i_1_n_0\,
      Q => \x_reg__1\(2),
      R => \x_reg[10]_i_1_n_0\
    );
\x_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \x[3]_i_1_n_0\,
      Q => \x_reg__1\(3),
      R => \x_reg[10]_i_1_n_0\
    );
\x_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \x[4]_i_1_n_0\,
      Q => \x_reg__1\(4),
      R => \x_reg[10]_i_1_n_0\
    );
\x_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \x[5]_i_1_n_0\,
      Q => \x_reg__1\(5),
      S => \x_reg[10]_i_1_n_0\
    );
\x_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \x[6]_i_1_n_0\,
      Q => \x_reg__1\(6),
      S => \x_reg[10]_i_1_n_0\
    );
\x_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \x[7]_i_1_n_0\,
      Q => \x_reg__1\(7),
      R => \x_reg[10]_i_1_n_0\
    );
\x_reg[8]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \x[8]_i_1_n_0\,
      Q => \x_reg__1\(8),
      S => \x_reg[10]_i_1_n_0\
    );
\x_reg[9]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \x[9]_i_1_n_0\,
      Q => \x_reg__1\(9),
      S => \x_reg[10]_i_1_n_0\
    );
\y[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \y_reg__0\(0),
      O => \p_0_in__0\(0)
    );
\y[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \y_reg__0\(0),
      I1 => \y_reg__0\(1),
      O => \p_0_in__0\(1)
    );
\y[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \y_reg__0\(2),
      I1 => \y_reg__0\(1),
      I2 => \y_reg__0\(0),
      O => \y[2]_i_1_n_0\
    );
\y[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \y_reg__0\(3),
      I1 => \y_reg__0\(2),
      I2 => \y_reg__0\(0),
      I3 => \y_reg__0\(1),
      O => \y[3]_i_1_n_0\
    );
\y[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \y_reg__0\(4),
      I1 => \y_reg__0\(1),
      I2 => \y_reg__0\(0),
      I3 => \y_reg__0\(2),
      I4 => \y_reg__0\(3),
      O => \y[4]_i_1_n_0\
    );
\y[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \y_reg__0\(5),
      I1 => \y_reg__0\(3),
      I2 => \y_reg__0\(2),
      I3 => \y_reg__0\(0),
      I4 => \y_reg__0\(1),
      I5 => \y_reg__0\(4),
      O => \y[5]_i_1_n_0\
    );
\y[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \y_reg__0\(6),
      I1 => \y[9]_i_4_n_0\,
      O => \y[6]_i_1_n_0\
    );
\y[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \y_reg__0\(7),
      I1 => \y[9]_i_4_n_0\,
      I2 => \y_reg__0\(6),
      O => \y[7]_i_1_n_0\
    );
\y[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \y_reg__0\(8),
      I1 => \y_reg__0\(6),
      I2 => \y[9]_i_4_n_0\,
      I3 => \y_reg__0\(7),
      O => \y[8]_i_1_n_0\
    );
\y[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \y_reg[9]_i_3_n_0\,
      I1 => \x_reg[10]_i_1_n_0\,
      O => y
    );
\y[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \y_reg__0\(9),
      I1 => \y_reg__0\(6),
      I2 => \y_reg__0\(8),
      I3 => \y_reg__0\(7),
      I4 => \y[9]_i_4_n_0\,
      O => \y[9]_i_2_n_0\
    );
\y[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \y_reg__0\(5),
      I1 => \y_reg__0\(3),
      I2 => \y_reg__0\(2),
      I3 => \y_reg__0\(0),
      I4 => \y_reg__0\(1),
      I5 => \y_reg__0\(4),
      O => \y[9]_i_4_n_0\
    );
\y[9]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80007FFF"
    )
        port map (
      I0 => \y[9]_i_4_n_0\,
      I1 => \y_reg__0\(7),
      I2 => \y_reg__0\(8),
      I3 => \y_reg__0\(6),
      I4 => \y_reg__0\(9),
      O => \y[9]_i_5_n_0\
    );
\y[9]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0880"
    )
        port map (
      I0 => \y_reg__0\(8),
      I1 => \y_reg__0\(7),
      I2 => \y[9]_i_4_n_0\,
      I3 => \y_reg__0\(6),
      O => \y[9]_i_6_n_0\
    );
\y[9]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000002222222"
    )
        port map (
      I0 => \y_reg__0\(5),
      I1 => \y_reg__0\(3),
      I2 => \y_reg__0\(2),
      I3 => \y_reg__0\(0),
      I4 => \y_reg__0\(1),
      I5 => \y_reg__0\(4),
      O => \y[9]_i_7_n_0\
    );
\y[9]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \y_reg__0\(2),
      I1 => \y_reg__0\(0),
      I2 => \y_reg__0\(1),
      O => \y[9]_i_8_n_0\
    );
\y_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \x_reg[10]_i_1_n_0\,
      D => \p_0_in__0\(0),
      Q => \y_reg__0\(0),
      S => y
    );
\y_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \x_reg[10]_i_1_n_0\,
      D => \p_0_in__0\(1),
      Q => \y_reg__0\(1),
      S => y
    );
\y_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \x_reg[10]_i_1_n_0\,
      D => \y[2]_i_1_n_0\,
      Q => \y_reg__0\(2),
      R => y
    );
\y_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \x_reg[10]_i_1_n_0\,
      D => \y[3]_i_1_n_0\,
      Q => \y_reg__0\(3),
      R => y
    );
\y_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \x_reg[10]_i_1_n_0\,
      D => \y[4]_i_1_n_0\,
      Q => \y_reg__0\(4),
      S => y
    );
\y_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \x_reg[10]_i_1_n_0\,
      D => \y[5]_i_1_n_0\,
      Q => \y_reg__0\(5),
      R => y
    );
\y_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \x_reg[10]_i_1_n_0\,
      D => \y[6]_i_1_n_0\,
      Q => \y_reg__0\(6),
      S => y
    );
\y_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \x_reg[10]_i_1_n_0\,
      D => \y[7]_i_1_n_0\,
      Q => \y_reg__0\(7),
      S => y
    );
\y_reg[8]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \x_reg[10]_i_1_n_0\,
      D => \y[8]_i_1_n_0\,
      Q => \y_reg__0\(8),
      S => y
    );
\y_reg[9]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \x_reg[10]_i_1_n_0\,
      D => \y[9]_i_2_n_0\,
      Q => \y_reg__0\(9),
      S => y
    );
\y_reg[9]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \y_reg[9]_i_3_n_0\,
      CO(2) => \y_reg[9]_i_3_n_1\,
      CO(1) => \y_reg[9]_i_3_n_2\,
      CO(0) => \y_reg[9]_i_3_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_y_reg[9]_i_3_O_UNCONNECTED\(3 downto 0),
      S(3) => \y[9]_i_5_n_0\,
      S(2) => \y[9]_i_6_n_0\,
      S(1) => \y[9]_i_7_n_0\,
      S(0) => \y[9]_i_8_n_0\
    );
end STRUCTURE;
