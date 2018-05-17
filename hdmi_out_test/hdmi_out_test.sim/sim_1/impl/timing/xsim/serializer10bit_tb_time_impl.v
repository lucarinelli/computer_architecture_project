// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Wed May 16 12:45:49 2018
// Host        : DESKTOP-0KG3I12 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/rinel/Desktop/computer_architecture_project/hdmi_out_test/hdmi_out_test.sim/sim_1/impl/timing/xsim/serializer10bit_tb_time_impl.v
// Design      : hdmi_controller
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module clk_wiz_hdmi
   (clk_out1,
    clk_out2,
    reset,
    locked,
    clk_in1);
  output clk_out1;
  output clk_out2;
  input reset;
  output locked;
  input clk_in1;

  wire clk_in1;
  wire clk_out1;
  wire clk_out2;
  wire reset;
  wire NLW_inst_locked_UNCONNECTED;

  clk_wiz_hdmi_clk_wiz_hdmi_clk_wiz inst
       (.clk_in1(clk_in1),
        .clk_out1(clk_out1),
        .clk_out2(clk_out2),
        .locked(NLW_inst_locked_UNCONNECTED),
        .reset(reset));
endmodule

(* ORIG_REF_NAME = "clk_wiz_hdmi_clk_wiz" *) 
module clk_wiz_hdmi_clk_wiz_hdmi_clk_wiz
   (clk_out1,
    clk_out2,
    reset,
    locked,
    clk_in1);
  output clk_out1;
  output clk_out2;
  input reset;
  output locked;
  input clk_in1;

  wire clk_in1;
  wire clk_in1_clk_wiz_hdmi;
  wire clk_out1;
  wire clk_out1_clk_wiz_hdmi;
  wire clk_out2;
  wire clk_out2_clk_wiz_hdmi;
  wire clkfbout_buf_clk_wiz_hdmi;
  wire clkfbout_clk_wiz_hdmi;
  wire reset;
  wire NLW_plle2_adv_inst_CLKOUT2_UNCONNECTED;
  wire NLW_plle2_adv_inst_CLKOUT3_UNCONNECTED;
  wire NLW_plle2_adv_inst_CLKOUT4_UNCONNECTED;
  wire NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED;
  wire NLW_plle2_adv_inst_DRDY_UNCONNECTED;
  wire NLW_plle2_adv_inst_LOCKED_UNCONNECTED;
  wire [15:0]NLW_plle2_adv_inst_DO_UNCONNECTED;

  (* box_type = "PRIMITIVE" *) 
  BUFG clkf_buf
       (.I(clkfbout_clk_wiz_hdmi),
        .O(clkfbout_buf_clk_wiz_hdmi));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUF #(
    .IOSTANDARD("DEFAULT")) 
    clkin1_ibufg
       (.I(clk_in1),
        .O(clk_in1_clk_wiz_hdmi));
  (* box_type = "PRIMITIVE" *) 
  BUFG clkout1_buf
       (.I(clk_out1_clk_wiz_hdmi),
        .O(clk_out1));
  (* box_type = "PRIMITIVE" *) 
  BUFG clkout2_buf
       (.I(clk_out2_clk_wiz_hdmi),
        .O(clk_out2));
  (* box_type = "PRIMITIVE" *) 
  PLLE2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT(8),
    .CLKFBOUT_PHASE(0.000000),
    .CLKIN1_PERIOD(8.000000),
    .CLKIN2_PERIOD(0.000000),
    .CLKOUT0_DIVIDE(40),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT1_DIVIDE(4),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .COMPENSATION("ZHOLD"),
    .DIVCLK_DIVIDE(1),
    .IS_CLKINSEL_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REF_JITTER1(0.010000),
    .REF_JITTER2(0.010000),
    .STARTUP_WAIT("FALSE")) 
    plle2_adv_inst
       (.CLKFBIN(clkfbout_buf_clk_wiz_hdmi),
        .CLKFBOUT(clkfbout_clk_wiz_hdmi),
        .CLKIN1(clk_in1_clk_wiz_hdmi),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKOUT0(clk_out1_clk_wiz_hdmi),
        .CLKOUT1(clk_out2_clk_wiz_hdmi),
        .CLKOUT2(NLW_plle2_adv_inst_CLKOUT2_UNCONNECTED),
        .CLKOUT3(NLW_plle2_adv_inst_CLKOUT3_UNCONNECTED),
        .CLKOUT4(NLW_plle2_adv_inst_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_plle2_adv_inst_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_plle2_adv_inst_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(NLW_plle2_adv_inst_LOCKED_UNCONNECTED),
        .PWRDWN(1'b0),
        .RST(reset));
endmodule

(* ECO_CHECKSUM = "3c7506bb" *) 
(* NotValidForBitStream *)
module hdmi_controller
   (reset,
    clk_sys,
    chp,
    chn,
    chclk,
    color_select,
    screen_led);
  input reset;
  input clk_sys;
  output [2:0]chp;
  output [2:0]chn;
  output [1:0]chclk;
  input [1:0]color_select;
  output screen_led;

  wire [2:0]ch;
  wire [1:0]chclk;
  wire [2:0]chn;
  wire [2:0]chp;
  wire clk;
  (* IBUF_LOW_PWR *) wire clk_sys;
  wire clkx10;
  wire \color[0]_i_1_n_0 ;
  wire \color[16]_i_1_n_0 ;
  wire \color[17]_i_1_n_0 ;
  wire \color[17]_i_2_n_0 ;
  wire \color[17]_i_3_n_0 ;
  wire \color[17]_i_4_n_0 ;
  wire \color[17]_i_6_n_0 ;
  wire \color[1]_i_1_n_0 ;
  wire \color[8]_i_1_n_0 ;
  wire \color[9]_i_1_n_0 ;
  wire \color_reg_n_0_[0] ;
  wire \color_reg_n_0_[16] ;
  wire \color_reg_n_0_[17] ;
  wire \color_reg_n_0_[1] ;
  wire \color_reg_n_0_[8] ;
  wire \color_reg_n_0_[9] ;
  wire [1:0]color_select;
  wire [1:0]color_select_IBUF;
  wire led;
  wire led_i_1_n_0;
  wire led_reg_n_0;
  wire mode;
  wire \mode[2]_i_1_n_0 ;
  wire \mode_reg_n_0_[2] ;
  wire [1:0]p_0_in;
  wire [1:0]p_0_in__0;
  wire screen_led;
  wire screen_led_OBUF;
  wire screen_led_i_3_n_0;
  wire screen_led_i_4_n_0;
  wire screen_led_i_5_n_0;
  wire screen_led_i_6_n_0;
  wire screen_led_reg_i_2_n_0;
  wire [1:1]sel0;
  wire vsync;
  wire vsync_i_1_n_0;
  wire vsync_i_2_n_0;
  wire \x[10]_i_2_n_0 ;
  wire \x[10]_i_3_n_0 ;
  wire \x[10]_i_4_n_0 ;
  wire \x[10]_i_5_n_0 ;
  wire \x[10]_i_6_n_0 ;
  wire \x[10]_i_7_n_0 ;
  wire \x[2]_i_1_n_0 ;
  wire \x[3]_i_1_n_0 ;
  wire \x[4]_i_1_n_0 ;
  wire \x[5]_i_1_n_0 ;
  wire \x[6]_i_1_n_0 ;
  wire \x[7]_i_1_n_0 ;
  wire \x[7]_i_2_n_0 ;
  wire \x[8]_i_1_n_0 ;
  wire \x[9]_i_1_n_0 ;
  wire \x_reg[10]_i_1_n_0 ;
  wire [10:10]x_reg__0;
  wire [9:0]x_reg__1;
  wire \y[2]_i_1_n_0 ;
  wire \y[3]_i_1_n_0 ;
  wire \y[4]_i_1_n_0 ;
  wire \y[5]_i_1_n_0 ;
  wire \y[6]_i_1_n_0 ;
  wire \y[7]_i_1_n_0 ;
  wire \y[7]_i_2_n_0 ;
  wire \y[8]_i_1_n_0 ;
  wire \y[9]_i_1_n_0 ;
  wire \y[9]_i_2_n_0 ;
  wire [9:0]y_reg__0;
  wire NLW_clk_wiz_hdmi_0_locked_UNCONNECTED;
  wire [2:0]NLW_screen_led_reg_i_2_CO_UNCONNECTED;
  wire [3:0]NLW_screen_led_reg_i_2_O_UNCONNECTED;
  wire [2:0]\NLW_x_reg[10]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_x_reg[10]_i_1_O_UNCONNECTED ;

initial begin
 $sdf_annotate("serializer10bit_tb_time_impl.sdf",,,,"tool_control");
end
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  (* box_type = "PRIMITIVE" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    OBUFDS_0b
       (.I(ch[0]),
        .O(chp[0]),
        .OB(chn[0]));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  (* box_type = "PRIMITIVE" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    OBUFDS_1g
       (.I(ch[1]),
        .O(chp[1]),
        .OB(chn[1]));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  (* box_type = "PRIMITIVE" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    OBUFDS_2r
       (.I(ch[2]),
        .O(chp[2]),
        .OB(chn[2]));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  (* box_type = "PRIMITIVE" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    OBUFDS_clk
       (.I(clk),
        .O(chclk[0]),
        .OB(chclk[1]));
  (* syn_black_box = "TRUE" *) 
  clk_wiz_hdmi clk_wiz_hdmi_0
       (.clk_in1(clk_sys),
        .clk_out1(clk),
        .clk_out2(clkx10),
        .locked(NLW_clk_wiz_hdmi_0_locked_UNCONNECTED),
        .reset(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \color[0]_i_1 
       (.I0(color_select_IBUF[0]),
        .I1(color_select_IBUF[1]),
        .O(\color[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \color[16]_i_1 
       (.I0(color_select_IBUF[0]),
        .I1(color_select_IBUF[1]),
        .O(\color[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \color[17]_i_1 
       (.I0(x_reg__1[9]),
        .I1(x_reg__0),
        .I2(x_reg__1[8]),
        .I3(\color[17]_i_3_n_0 ),
        .I4(\color[17]_i_4_n_0 ),
        .I5(vsync),
        .O(\color[17]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \color[17]_i_2 
       (.I0(color_select_IBUF[1]),
        .O(\color[17]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \color[17]_i_3 
       (.I0(x_reg__1[5]),
        .I1(x_reg__1[6]),
        .O(\color[17]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \color[17]_i_4 
       (.I0(x_reg__1[7]),
        .I1(x_reg__1[4]),
        .I2(x_reg__1[2]),
        .I3(x_reg__1[3]),
        .I4(x_reg__1[0]),
        .I5(x_reg__1[1]),
        .O(\color[17]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00000040)) 
    \color[17]_i_5 
       (.I0(y_reg__0[3]),
        .I1(y_reg__0[4]),
        .I2(y_reg__0[6]),
        .I3(y_reg__0[5]),
        .I4(\color[17]_i_6_n_0 ),
        .O(vsync));
  LUT6 #(
    .INIT(64'hF7FFFFFFFFFFFFFF)) 
    \color[17]_i_6 
       (.I0(y_reg__0[8]),
        .I1(y_reg__0[7]),
        .I2(y_reg__0[2]),
        .I3(y_reg__0[9]),
        .I4(y_reg__0[0]),
        .I5(y_reg__0[1]),
        .O(\color[17]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \color[1]_i_1 
       (.I0(color_select_IBUF[0]),
        .I1(color_select_IBUF[1]),
        .O(\color[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \color[8]_i_1 
       (.I0(color_select_IBUF[1]),
        .I1(color_select_IBUF[0]),
        .O(\color[8]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \color[9]_i_1 
       (.I0(color_select_IBUF[0]),
        .O(\color[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \color_reg[0] 
       (.C(clk),
        .CE(\color[17]_i_1_n_0 ),
        .D(\color[0]_i_1_n_0 ),
        .Q(\color_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \color_reg[16] 
       (.C(clk),
        .CE(\color[17]_i_1_n_0 ),
        .D(\color[16]_i_1_n_0 ),
        .Q(\color_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \color_reg[17] 
       (.C(clk),
        .CE(\color[17]_i_1_n_0 ),
        .D(\color[17]_i_2_n_0 ),
        .Q(\color_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \color_reg[1] 
       (.C(clk),
        .CE(\color[17]_i_1_n_0 ),
        .D(\color[1]_i_1_n_0 ),
        .Q(\color_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \color_reg[8] 
       (.C(clk),
        .CE(\color[17]_i_1_n_0 ),
        .D(\color[8]_i_1_n_0 ),
        .Q(\color_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \color_reg[9] 
       (.C(clk),
        .CE(\color[17]_i_1_n_0 ),
        .D(\color[9]_i_1_n_0 ),
        .Q(\color_reg_n_0_[9] ),
        .R(1'b0));
  IBUF \color_select_IBUF[0]_inst 
       (.I(color_select[0]),
        .O(color_select_IBUF[0]));
  IBUF \color_select_IBUF[1]_inst 
       (.I(color_select[1]),
        .O(color_select_IBUF[1]));
  LUT3 #(
    .INIT(8'h78)) 
    led_i_1
       (.I0(\x_reg[10]_i_1_n_0 ),
        .I1(screen_led_reg_i_2_n_0),
        .I2(led_reg_n_0),
        .O(led_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    led_reg
       (.C(clk),
        .CE(1'b1),
        .D(led_i_1_n_0),
        .Q(led_reg_n_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFFE2)) 
    \mode[2]_i_1 
       (.I0(\mode_reg_n_0_[2] ),
        .I1(mode),
        .I2(x_reg__0),
        .I3(vsync),
        .O(\mode[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000002)) 
    \mode[2]_i_2 
       (.I0(\color[17]_i_4_n_0 ),
        .I1(x_reg__1[8]),
        .I2(x_reg__1[9]),
        .I3(x_reg__0),
        .I4(x_reg__1[5]),
        .I5(x_reg__1[6]),
        .O(mode));
  FDRE #(
    .INIT(1'b0)) 
    \mode_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\mode[2]_i_1_n_0 ),
        .Q(\mode_reg_n_0_[2] ),
        .R(1'b0));
  OBUF screen_led_OBUF_inst
       (.I(screen_led_OBUF),
        .O(screen_led));
  LUT2 #(
    .INIT(4'h8)) 
    screen_led_i_1
       (.I0(screen_led_reg_i_2_n_0),
        .I1(\x_reg[10]_i_1_n_0 ),
        .O(led));
  LUT5 #(
    .INIT(32'h95555555)) 
    screen_led_i_3
       (.I0(y_reg__0[9]),
        .I1(y_reg__0[7]),
        .I2(\y[9]_i_2_n_0 ),
        .I3(y_reg__0[6]),
        .I4(y_reg__0[8]),
        .O(screen_led_i_3_n_0));
  LUT4 #(
    .INIT(16'h6000)) 
    screen_led_i_4
       (.I0(\y[9]_i_2_n_0 ),
        .I1(y_reg__0[6]),
        .I2(y_reg__0[8]),
        .I3(y_reg__0[7]),
        .O(screen_led_i_4_n_0));
  LUT6 #(
    .INIT(64'h4000000002222222)) 
    screen_led_i_5
       (.I0(y_reg__0[5]),
        .I1(y_reg__0[3]),
        .I2(y_reg__0[2]),
        .I3(y_reg__0[0]),
        .I4(y_reg__0[1]),
        .I5(y_reg__0[4]),
        .O(screen_led_i_5_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    screen_led_i_6
       (.I0(y_reg__0[2]),
        .I1(y_reg__0[0]),
        .I2(y_reg__0[1]),
        .O(screen_led_i_6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    screen_led_reg
       (.C(clk),
        .CE(led),
        .D(led_reg_n_0),
        .Q(screen_led_OBUF),
        .R(1'b0));
  CARRY4 screen_led_reg_i_2
       (.CI(1'b0),
        .CO({screen_led_reg_i_2_n_0,NLW_screen_led_reg_i_2_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_screen_led_reg_i_2_O_UNCONNECTED[3:0]),
        .S({screen_led_i_3_n_0,screen_led_i_4_n_0,screen_led_i_5_n_0,screen_led_i_6_n_0}));
  tmds_transmitter tdms_tx
       (.CLK(clkx10),
        .Q({\color_reg_n_0_[17] ,\color_reg_n_0_[16] ,\color_reg_n_0_[9] ,\color_reg_n_0_[8] ,\color_reg_n_0_[1] ,\color_reg_n_0_[0] }),
        .ch(ch),
        .clk_out1(clk),
        .\mode_reg[2] (\mode_reg_n_0_[2] ),
        .sel0(sel0));
  LUT3 #(
    .INIT(8'hF4)) 
    vsync_i_1
       (.I0(vsync_i_2_n_0),
        .I1(sel0),
        .I2(vsync),
        .O(vsync_i_1_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    vsync_i_2
       (.I0(\color[17]_i_4_n_0 ),
        .I1(x_reg__1[6]),
        .I2(x_reg__1[5]),
        .I3(x_reg__1[8]),
        .I4(x_reg__1[9]),
        .I5(x_reg__0),
        .O(vsync_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    vsync_reg
       (.C(clk),
        .CE(1'b1),
        .D(vsync_i_1_n_0),
        .Q(sel0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \x[0]_i_1 
       (.I0(x_reg__1[0]),
        .O(p_0_in[0]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \x[10]_i_2 
       (.I0(x_reg__0),
        .I1(x_reg__1[6]),
        .I2(\x[10]_i_7_n_0 ),
        .I3(x_reg__1[7]),
        .I4(x_reg__1[8]),
        .I5(x_reg__1[9]),
        .O(\x[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000007FFF8000)) 
    \x[10]_i_3 
       (.I0(x_reg__1[6]),
        .I1(\x[10]_i_7_n_0 ),
        .I2(x_reg__1[7]),
        .I3(x_reg__1[8]),
        .I4(x_reg__1[9]),
        .I5(x_reg__0),
        .O(\x[10]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h1004)) 
    \x[10]_i_4 
       (.I0(x_reg__1[8]),
        .I1(x_reg__1[7]),
        .I2(\x[10]_i_7_n_0 ),
        .I3(x_reg__1[6]),
        .O(\x[10]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8000000001111111)) 
    \x[10]_i_5 
       (.I0(x_reg__1[5]),
        .I1(x_reg__1[4]),
        .I2(x_reg__1[1]),
        .I3(x_reg__1[0]),
        .I4(x_reg__1[2]),
        .I5(x_reg__1[3]),
        .O(\x[10]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \x[10]_i_6 
       (.I0(x_reg__1[2]),
        .I1(x_reg__1[0]),
        .I2(x_reg__1[1]),
        .O(\x[10]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \x[10]_i_7 
       (.I0(x_reg__1[5]),
        .I1(x_reg__1[3]),
        .I2(x_reg__1[2]),
        .I3(x_reg__1[0]),
        .I4(x_reg__1[1]),
        .I5(x_reg__1[4]),
        .O(\x[10]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \x[1]_i_1 
       (.I0(x_reg__1[0]),
        .I1(x_reg__1[1]),
        .O(p_0_in[1]));
  LUT3 #(
    .INIT(8'h6A)) 
    \x[2]_i_1 
       (.I0(x_reg__1[2]),
        .I1(x_reg__1[1]),
        .I2(x_reg__1[0]),
        .O(\x[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \x[3]_i_1 
       (.I0(x_reg__1[3]),
        .I1(x_reg__1[2]),
        .I2(x_reg__1[0]),
        .I3(x_reg__1[1]),
        .O(\x[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \x[4]_i_1 
       (.I0(x_reg__1[4]),
        .I1(x_reg__1[1]),
        .I2(x_reg__1[0]),
        .I3(x_reg__1[2]),
        .I4(x_reg__1[3]),
        .O(\x[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \x[5]_i_1 
       (.I0(x_reg__1[4]),
        .I1(x_reg__1[1]),
        .I2(x_reg__1[0]),
        .I3(x_reg__1[2]),
        .I4(x_reg__1[3]),
        .I5(x_reg__1[5]),
        .O(\x[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hA6AAAAAA)) 
    \x[6]_i_1 
       (.I0(x_reg__1[6]),
        .I1(x_reg__1[4]),
        .I2(\x[7]_i_2_n_0 ),
        .I3(x_reg__1[3]),
        .I4(x_reg__1[5]),
        .O(\x[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA6AAAAAAAAAAAAA)) 
    \x[7]_i_1 
       (.I0(x_reg__1[7]),
        .I1(x_reg__1[5]),
        .I2(x_reg__1[3]),
        .I3(\x[7]_i_2_n_0 ),
        .I4(x_reg__1[4]),
        .I5(x_reg__1[6]),
        .O(\x[7]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \x[7]_i_2 
       (.I0(x_reg__1[1]),
        .I1(x_reg__1[0]),
        .I2(x_reg__1[2]),
        .O(\x[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \x[8]_i_1 
       (.I0(x_reg__1[8]),
        .I1(x_reg__1[6]),
        .I2(\x[10]_i_7_n_0 ),
        .I3(x_reg__1[7]),
        .O(\x[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \x[9]_i_1 
       (.I0(x_reg__1[9]),
        .I1(x_reg__1[8]),
        .I2(x_reg__1[7]),
        .I3(\x[10]_i_7_n_0 ),
        .I4(x_reg__1[6]),
        .O(\x[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[0]),
        .Q(x_reg__1[0]),
        .R(\x_reg[10]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \x_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\x[10]_i_2_n_0 ),
        .Q(x_reg__0),
        .S(\x_reg[10]_i_1_n_0 ));
  CARRY4 \x_reg[10]_i_1 
       (.CI(1'b0),
        .CO({\x_reg[10]_i_1_n_0 ,\NLW_x_reg[10]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_x_reg[10]_i_1_O_UNCONNECTED [3:0]),
        .S({\x[10]_i_3_n_0 ,\x[10]_i_4_n_0 ,\x[10]_i_5_n_0 ,\x[10]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(x_reg__1[1]),
        .R(\x_reg[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\x[2]_i_1_n_0 ),
        .Q(x_reg__1[2]),
        .R(\x_reg[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\x[3]_i_1_n_0 ),
        .Q(x_reg__1[3]),
        .R(\x_reg[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\x[4]_i_1_n_0 ),
        .Q(x_reg__1[4]),
        .R(\x_reg[10]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \x_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\x[5]_i_1_n_0 ),
        .Q(x_reg__1[5]),
        .S(\x_reg[10]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \x_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\x[6]_i_1_n_0 ),
        .Q(x_reg__1[6]),
        .S(\x_reg[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \x_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\x[7]_i_1_n_0 ),
        .Q(x_reg__1[7]),
        .R(\x_reg[10]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \x_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\x[8]_i_1_n_0 ),
        .Q(x_reg__1[8]),
        .S(\x_reg[10]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \x_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\x[9]_i_1_n_0 ),
        .Q(x_reg__1[9]),
        .S(\x_reg[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \y[0]_i_1 
       (.I0(y_reg__0[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \y[1]_i_1 
       (.I0(y_reg__0[0]),
        .I1(y_reg__0[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \y[2]_i_1 
       (.I0(y_reg__0[2]),
        .I1(y_reg__0[1]),
        .I2(y_reg__0[0]),
        .O(\y[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \y[3]_i_1 
       (.I0(y_reg__0[3]),
        .I1(y_reg__0[2]),
        .I2(y_reg__0[0]),
        .I3(y_reg__0[1]),
        .O(\y[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \y[4]_i_1 
       (.I0(y_reg__0[4]),
        .I1(y_reg__0[1]),
        .I2(y_reg__0[0]),
        .I3(y_reg__0[2]),
        .I4(y_reg__0[3]),
        .O(\y[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \y[5]_i_1 
       (.I0(y_reg__0[5]),
        .I1(y_reg__0[3]),
        .I2(y_reg__0[2]),
        .I3(y_reg__0[0]),
        .I4(y_reg__0[1]),
        .I5(y_reg__0[4]),
        .O(\y[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hA6AAAAAA)) 
    \y[6]_i_1 
       (.I0(y_reg__0[6]),
        .I1(y_reg__0[4]),
        .I2(\y[7]_i_2_n_0 ),
        .I3(y_reg__0[3]),
        .I4(y_reg__0[5]),
        .O(\y[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA6AAAAAAAAAAAAA)) 
    \y[7]_i_1 
       (.I0(y_reg__0[7]),
        .I1(y_reg__0[5]),
        .I2(y_reg__0[3]),
        .I3(\y[7]_i_2_n_0 ),
        .I4(y_reg__0[4]),
        .I5(y_reg__0[6]),
        .O(\y[7]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \y[7]_i_2 
       (.I0(y_reg__0[1]),
        .I1(y_reg__0[0]),
        .I2(y_reg__0[2]),
        .O(\y[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \y[8]_i_1 
       (.I0(y_reg__0[8]),
        .I1(y_reg__0[6]),
        .I2(\y[9]_i_2_n_0 ),
        .I3(y_reg__0[7]),
        .O(\y[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \y[9]_i_1 
       (.I0(y_reg__0[8]),
        .I1(y_reg__0[6]),
        .I2(\y[9]_i_2_n_0 ),
        .I3(y_reg__0[7]),
        .I4(y_reg__0[9]),
        .O(\y[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \y[9]_i_2 
       (.I0(y_reg__0[5]),
        .I1(y_reg__0[3]),
        .I2(y_reg__0[2]),
        .I3(y_reg__0[0]),
        .I4(y_reg__0[1]),
        .I5(y_reg__0[4]),
        .O(\y[9]_i_2_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \y_reg[0] 
       (.C(clk),
        .CE(\x_reg[10]_i_1_n_0 ),
        .D(p_0_in__0[0]),
        .Q(y_reg__0[0]),
        .S(led));
  FDSE #(
    .INIT(1'b1)) 
    \y_reg[1] 
       (.C(clk),
        .CE(\x_reg[10]_i_1_n_0 ),
        .D(p_0_in__0[1]),
        .Q(y_reg__0[1]),
        .S(led));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[2] 
       (.C(clk),
        .CE(\x_reg[10]_i_1_n_0 ),
        .D(\y[2]_i_1_n_0 ),
        .Q(y_reg__0[2]),
        .R(led));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[3] 
       (.C(clk),
        .CE(\x_reg[10]_i_1_n_0 ),
        .D(\y[3]_i_1_n_0 ),
        .Q(y_reg__0[3]),
        .R(led));
  FDSE #(
    .INIT(1'b1)) 
    \y_reg[4] 
       (.C(clk),
        .CE(\x_reg[10]_i_1_n_0 ),
        .D(\y[4]_i_1_n_0 ),
        .Q(y_reg__0[4]),
        .S(led));
  FDRE #(
    .INIT(1'b0)) 
    \y_reg[5] 
       (.C(clk),
        .CE(\x_reg[10]_i_1_n_0 ),
        .D(\y[5]_i_1_n_0 ),
        .Q(y_reg__0[5]),
        .R(led));
  FDSE #(
    .INIT(1'b1)) 
    \y_reg[6] 
       (.C(clk),
        .CE(\x_reg[10]_i_1_n_0 ),
        .D(\y[6]_i_1_n_0 ),
        .Q(y_reg__0[6]),
        .S(led));
  FDSE #(
    .INIT(1'b1)) 
    \y_reg[7] 
       (.C(clk),
        .CE(\x_reg[10]_i_1_n_0 ),
        .D(\y[7]_i_1_n_0 ),
        .Q(y_reg__0[7]),
        .S(led));
  FDSE #(
    .INIT(1'b1)) 
    \y_reg[8] 
       (.C(clk),
        .CE(\x_reg[10]_i_1_n_0 ),
        .D(\y[8]_i_1_n_0 ),
        .Q(y_reg__0[8]),
        .S(led));
  FDSE #(
    .INIT(1'b1)) 
    \y_reg[9] 
       (.C(clk),
        .CE(\x_reg[10]_i_1_n_0 ),
        .D(\y[9]_i_1_n_0 ),
        .Q(y_reg__0[9]),
        .S(led));
endmodule

module serializer10bit
   (ch,
    CLK,
    D);
  output [0:0]ch;
  input CLK;
  input [5:0]D;

  wire CLK;
  wire [5:0]D;
  wire [0:0]ch;
  wire \count[0]_i_1__1_n_0 ;
  wire \count[1]_i_1__1_n_0 ;
  wire \count[2]_i_1__1_n_0 ;
  wire \count[3]_i_1__1_n_0 ;
  wire \count_reg_n_0_[0] ;
  wire \count_reg_n_0_[1] ;
  wire \count_reg_n_0_[2] ;
  wire \count_reg_n_0_[3] ;
  wire dout_i_1__1_n_0;
  wire dout_i_2__1_n_0;
  wire dout_i_3__1_n_0;
  wire dout_i_4__1_n_0;
  wire [9:0]internal;
  wire \internal[9]_i_1__1_n_0 ;

  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1__1 
       (.I0(\count_reg_n_0_[0] ),
        .O(\count[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0FB0)) 
    \count[1]_i_1__1 
       (.I0(\count_reg_n_0_[2] ),
        .I1(\count_reg_n_0_[3] ),
        .I2(\count_reg_n_0_[1] ),
        .I3(\count_reg_n_0_[0] ),
        .O(\count[1]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \count[2]_i_1__1 
       (.I0(\count_reg_n_0_[2] ),
        .I1(\count_reg_n_0_[1] ),
        .I2(\count_reg_n_0_[0] ),
        .O(\count[2]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h6AA2)) 
    \count[3]_i_1__1 
       (.I0(\count_reg_n_0_[3] ),
        .I1(\count_reg_n_0_[1] ),
        .I2(\count_reg_n_0_[0] ),
        .I3(\count_reg_n_0_[2] ),
        .O(\count[3]_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[0]_i_1__1_n_0 ),
        .Q(\count_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[1]_i_1__1_n_0 ),
        .Q(\count_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[2]_i_1__1_n_0 ),
        .Q(\count_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[3]_i_1__1_n_0 ),
        .Q(\count_reg_n_0_[3] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    dout_i_1__1
       (.I0(dout_i_2__1_n_0),
        .I1(\count_reg_n_0_[3] ),
        .I2(dout_i_3__1_n_0),
        .I3(\count_reg_n_0_[2] ),
        .I4(dout_i_4__1_n_0),
        .O(dout_i_1__1_n_0));
  LUT6 #(
    .INIT(64'hFF00EFEFFF004040)) 
    dout_i_2__1
       (.I0(\count_reg_n_0_[2] ),
        .I1(internal[0]),
        .I2(\count_reg_n_0_[1] ),
        .I3(internal[9]),
        .I4(\count_reg_n_0_[0] ),
        .I5(internal[8]),
        .O(dout_i_2__1_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    dout_i_3__1
       (.I0(internal[7]),
        .I1(internal[6]),
        .I2(\count_reg_n_0_[1] ),
        .I3(internal[0]),
        .I4(\count_reg_n_0_[0] ),
        .I5(internal[4]),
        .O(dout_i_3__1_n_0));
  LUT5 #(
    .INIT(32'hAFA0CFC0)) 
    dout_i_4__1
       (.I0(internal[7]),
        .I1(internal[6]),
        .I2(\count_reg_n_0_[1] ),
        .I3(internal[0]),
        .I4(\count_reg_n_0_[0] ),
        .O(dout_i_4__1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    dout_reg
       (.C(CLK),
        .CE(1'b1),
        .D(dout_i_1__1_n_0),
        .Q(ch),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0400)) 
    \internal[9]_i_1__1 
       (.I0(\count_reg_n_0_[2] ),
        .I1(\count_reg_n_0_[1] ),
        .I2(\count_reg_n_0_[0] ),
        .I3(\count_reg_n_0_[3] ),
        .O(\internal[9]_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[0] 
       (.C(CLK),
        .CE(\internal[9]_i_1__1_n_0 ),
        .D(D[0]),
        .Q(internal[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[4] 
       (.C(CLK),
        .CE(\internal[9]_i_1__1_n_0 ),
        .D(D[1]),
        .Q(internal[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[6] 
       (.C(CLK),
        .CE(\internal[9]_i_1__1_n_0 ),
        .D(D[2]),
        .Q(internal[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[7] 
       (.C(CLK),
        .CE(\internal[9]_i_1__1_n_0 ),
        .D(D[3]),
        .Q(internal[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[8] 
       (.C(CLK),
        .CE(\internal[9]_i_1__1_n_0 ),
        .D(D[4]),
        .Q(internal[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[9] 
       (.C(CLK),
        .CE(\internal[9]_i_1__1_n_0 ),
        .D(D[5]),
        .Q(internal[9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "serializer10bit" *) 
module serializer10bit_0
   (ch,
    CLK,
    D);
  output [0:0]ch;
  input CLK;
  input [5:0]D;

  wire CLK;
  wire [5:0]D;
  wire [0:0]ch;
  wire \count[0]_i_1__0_n_0 ;
  wire \count[1]_i_1__0_n_0 ;
  wire \count[2]_i_1__0_n_0 ;
  wire \count[3]_i_1__0_n_0 ;
  wire \count_reg_n_0_[0] ;
  wire \count_reg_n_0_[1] ;
  wire \count_reg_n_0_[2] ;
  wire \count_reg_n_0_[3] ;
  wire dout_i_1__0_n_0;
  wire dout_i_2__0_n_0;
  wire dout_i_3__0_n_0;
  wire dout_i_4__0_n_0;
  wire [9:0]internal;
  wire \internal[9]_i_1__0_n_0 ;

  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1__0 
       (.I0(\count_reg_n_0_[0] ),
        .O(\count[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0FB0)) 
    \count[1]_i_1__0 
       (.I0(\count_reg_n_0_[2] ),
        .I1(\count_reg_n_0_[3] ),
        .I2(\count_reg_n_0_[1] ),
        .I3(\count_reg_n_0_[0] ),
        .O(\count[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \count[2]_i_1__0 
       (.I0(\count_reg_n_0_[2] ),
        .I1(\count_reg_n_0_[1] ),
        .I2(\count_reg_n_0_[0] ),
        .O(\count[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h6AA2)) 
    \count[3]_i_1__0 
       (.I0(\count_reg_n_0_[3] ),
        .I1(\count_reg_n_0_[1] ),
        .I2(\count_reg_n_0_[0] ),
        .I3(\count_reg_n_0_[2] ),
        .O(\count[3]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[0]_i_1__0_n_0 ),
        .Q(\count_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[1]_i_1__0_n_0 ),
        .Q(\count_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[2]_i_1__0_n_0 ),
        .Q(\count_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[3]_i_1__0_n_0 ),
        .Q(\count_reg_n_0_[3] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    dout_i_1__0
       (.I0(dout_i_2__0_n_0),
        .I1(\count_reg_n_0_[3] ),
        .I2(dout_i_3__0_n_0),
        .I3(\count_reg_n_0_[2] ),
        .I4(dout_i_4__0_n_0),
        .O(dout_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hFF00EFEFFF004040)) 
    dout_i_2__0
       (.I0(\count_reg_n_0_[2] ),
        .I1(internal[0]),
        .I2(\count_reg_n_0_[1] ),
        .I3(internal[9]),
        .I4(\count_reg_n_0_[0] ),
        .I5(internal[8]),
        .O(dout_i_2__0_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    dout_i_3__0
       (.I0(internal[7]),
        .I1(internal[6]),
        .I2(\count_reg_n_0_[1] ),
        .I3(internal[0]),
        .I4(\count_reg_n_0_[0] ),
        .I5(internal[4]),
        .O(dout_i_3__0_n_0));
  LUT5 #(
    .INIT(32'hAFA0CFC0)) 
    dout_i_4__0
       (.I0(internal[7]),
        .I1(internal[6]),
        .I2(\count_reg_n_0_[1] ),
        .I3(internal[0]),
        .I4(\count_reg_n_0_[0] ),
        .O(dout_i_4__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    dout_reg
       (.C(CLK),
        .CE(1'b1),
        .D(dout_i_1__0_n_0),
        .Q(ch),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0400)) 
    \internal[9]_i_1__0 
       (.I0(\count_reg_n_0_[2] ),
        .I1(\count_reg_n_0_[1] ),
        .I2(\count_reg_n_0_[0] ),
        .I3(\count_reg_n_0_[3] ),
        .O(\internal[9]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[0] 
       (.C(CLK),
        .CE(\internal[9]_i_1__0_n_0 ),
        .D(D[0]),
        .Q(internal[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[4] 
       (.C(CLK),
        .CE(\internal[9]_i_1__0_n_0 ),
        .D(D[1]),
        .Q(internal[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[6] 
       (.C(CLK),
        .CE(\internal[9]_i_1__0_n_0 ),
        .D(D[2]),
        .Q(internal[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[7] 
       (.C(CLK),
        .CE(\internal[9]_i_1__0_n_0 ),
        .D(D[3]),
        .Q(internal[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[8] 
       (.C(CLK),
        .CE(\internal[9]_i_1__0_n_0 ),
        .D(D[4]),
        .Q(internal[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[9] 
       (.C(CLK),
        .CE(\internal[9]_i_1__0_n_0 ),
        .D(D[5]),
        .Q(internal[9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "serializer10bit" *) 
module serializer10bit_1
   (ch,
    CLK,
    D);
  output [0:0]ch;
  input CLK;
  input [5:0]D;

  wire CLK;
  wire [5:0]D;
  wire [0:0]ch;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count[2]_i_1_n_0 ;
  wire \count[3]_i_1_n_0 ;
  wire \count_reg_n_0_[0] ;
  wire \count_reg_n_0_[1] ;
  wire \count_reg_n_0_[2] ;
  wire \count_reg_n_0_[3] ;
  wire dout_i_1_n_0;
  wire dout_i_2_n_0;
  wire dout_i_3_n_0;
  wire dout_i_4_n_0;
  wire [9:0]internal;
  wire \internal[9]_i_1_n_0 ;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(\count_reg_n_0_[0] ),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0FB0)) 
    \count[1]_i_1 
       (.I0(\count_reg_n_0_[2] ),
        .I1(\count_reg_n_0_[3] ),
        .I2(\count_reg_n_0_[1] ),
        .I3(\count_reg_n_0_[0] ),
        .O(\count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \count[2]_i_1 
       (.I0(\count_reg_n_0_[2] ),
        .I1(\count_reg_n_0_[1] ),
        .I2(\count_reg_n_0_[0] ),
        .O(\count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6AA2)) 
    \count[3]_i_1 
       (.I0(\count_reg_n_0_[3] ),
        .I1(\count_reg_n_0_[1] ),
        .I2(\count_reg_n_0_[0] ),
        .I3(\count_reg_n_0_[2] ),
        .O(\count[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[0]_i_1_n_0 ),
        .Q(\count_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[1]_i_1_n_0 ),
        .Q(\count_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[2]_i_1_n_0 ),
        .Q(\count_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[3]_i_1_n_0 ),
        .Q(\count_reg_n_0_[3] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    dout_i_1
       (.I0(dout_i_2_n_0),
        .I1(\count_reg_n_0_[3] ),
        .I2(dout_i_3_n_0),
        .I3(\count_reg_n_0_[2] ),
        .I4(dout_i_4_n_0),
        .O(dout_i_1_n_0));
  LUT6 #(
    .INIT(64'hFF00EFEFFF004040)) 
    dout_i_2
       (.I0(\count_reg_n_0_[2] ),
        .I1(internal[0]),
        .I2(\count_reg_n_0_[1] ),
        .I3(internal[9]),
        .I4(\count_reg_n_0_[0] ),
        .I5(internal[8]),
        .O(dout_i_2_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    dout_i_3
       (.I0(internal[7]),
        .I1(internal[6]),
        .I2(\count_reg_n_0_[1] ),
        .I3(internal[0]),
        .I4(\count_reg_n_0_[0] ),
        .I5(internal[4]),
        .O(dout_i_3_n_0));
  LUT5 #(
    .INIT(32'hAFA0CFC0)) 
    dout_i_4
       (.I0(internal[7]),
        .I1(internal[6]),
        .I2(\count_reg_n_0_[1] ),
        .I3(internal[0]),
        .I4(\count_reg_n_0_[0] ),
        .O(dout_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    dout_reg
       (.C(CLK),
        .CE(1'b1),
        .D(dout_i_1_n_0),
        .Q(ch),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0400)) 
    \internal[9]_i_1 
       (.I0(\count_reg_n_0_[2] ),
        .I1(\count_reg_n_0_[1] ),
        .I2(\count_reg_n_0_[0] ),
        .I3(\count_reg_n_0_[3] ),
        .O(\internal[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[0] 
       (.C(CLK),
        .CE(\internal[9]_i_1_n_0 ),
        .D(D[0]),
        .Q(internal[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[4] 
       (.C(CLK),
        .CE(\internal[9]_i_1_n_0 ),
        .D(D[1]),
        .Q(internal[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[6] 
       (.C(CLK),
        .CE(\internal[9]_i_1_n_0 ),
        .D(D[2]),
        .Q(internal[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[7] 
       (.C(CLK),
        .CE(\internal[9]_i_1_n_0 ),
        .D(D[3]),
        .Q(internal[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[8] 
       (.C(CLK),
        .CE(\internal[9]_i_1_n_0 ),
        .D(D[4]),
        .Q(internal[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \internal_reg[9] 
       (.C(CLK),
        .CE(\internal[9]_i_1_n_0 ),
        .D(D[5]),
        .Q(internal[9]),
        .R(1'b0));
endmodule

module tmds_encoder
   (ch,
    CLK,
    sel0,
    \mode_reg[2] ,
    Q,
    clk_out1);
  output [0:0]ch;
  input CLK;
  input [0:0]sel0;
  input \mode_reg[2] ;
  input [1:0]Q;
  input clk_out1;

  wire CLK;
  wire [1:0]Q;
  wire [0:0]ch;
  wire clk_out1;
  wire [9:9]data_out;
  wire data_out1__0;
  wire [9:0]data_to_serializer;
  wire \data_to_serializer[4]_i_1_n_0 ;
  wire \data_to_serializer[6]_i_1_n_0 ;
  wire \data_to_serializer[8]_i_1_n_0 ;
  wire \mode_reg[2] ;
  wire p_1_in;
  wire [0:0]sel0;
  wire \total_disp[1]_i_1_n_0 ;
  wire \total_disp[2]_i_1_n_0 ;
  wire \total_disp[3]_i_1_n_0 ;
  wire \total_disp_reg_n_0_[1] ;
  wire \total_disp_reg_n_0_[2] ;

  LUT5 #(
    .INIT(32'h54FFFFAA)) 
    \data_to_serializer[4]_i_1 
       (.I0(p_1_in),
        .I1(\total_disp_reg_n_0_[1] ),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\data_to_serializer[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h540000AA)) 
    \data_to_serializer[6]_i_1 
       (.I0(p_1_in),
        .I1(\total_disp_reg_n_0_[1] ),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\data_to_serializer[6]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_to_serializer[8]_i_1 
       (.I0(Q[1]),
        .O(\data_to_serializer[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBB88B88BB88BBB88)) 
    \data_to_serializer[9]_i_1 
       (.I0(sel0),
        .I1(\mode_reg[2] ),
        .I2(data_out1__0),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(p_1_in),
        .O(data_out));
  LUT5 #(
    .INIT(32'h01FFFF01)) 
    \data_to_serializer[9]_i_2 
       (.I0(p_1_in),
        .I1(\total_disp_reg_n_0_[1] ),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(data_out1__0));
  FDSE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[0] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\data_to_serializer[4]_i_1_n_0 ),
        .Q(data_to_serializer[0]),
        .S(\mode_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[4] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\data_to_serializer[4]_i_1_n_0 ),
        .Q(data_to_serializer[4]),
        .R(\mode_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[6] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\data_to_serializer[6]_i_1_n_0 ),
        .Q(data_to_serializer[6]),
        .R(\mode_reg[2] ));
  FDSE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[7] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\data_to_serializer[6]_i_1_n_0 ),
        .Q(data_to_serializer[7]),
        .S(\mode_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[8] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\data_to_serializer[8]_i_1_n_0 ),
        .Q(data_to_serializer[8]),
        .R(\mode_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[9] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(data_out),
        .Q(data_to_serializer[9]),
        .R(1'b0));
  serializer10bit_1 serializer_inst
       (.CLK(CLK),
        .D({data_to_serializer[9:6],data_to_serializer[4],data_to_serializer[0]}),
        .ch(ch));
  LUT5 #(
    .INIT(32'h98CCCC66)) 
    \total_disp[1]_i_1 
       (.I0(p_1_in),
        .I1(\total_disp_reg_n_0_[1] ),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\total_disp[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hE0F0F078)) 
    \total_disp[2]_i_1 
       (.I0(p_1_in),
        .I1(\total_disp_reg_n_0_[1] ),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\total_disp[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h55AAAAD5)) 
    \total_disp[3]_i_1 
       (.I0(p_1_in),
        .I1(\total_disp_reg_n_0_[1] ),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\total_disp[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_disp_reg[1] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\total_disp[1]_i_1_n_0 ),
        .Q(\total_disp_reg_n_0_[1] ),
        .R(\mode_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \total_disp_reg[2] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\total_disp[2]_i_1_n_0 ),
        .Q(\total_disp_reg_n_0_[2] ),
        .R(\mode_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \total_disp_reg[3] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\total_disp[3]_i_1_n_0 ),
        .Q(p_1_in),
        .R(\mode_reg[2] ));
endmodule

(* ORIG_REF_NAME = "tmds_encoder" *) 
module tmds_encoder__parameterized1
   (ch,
    CLK,
    Q,
    \mode_reg[2] ,
    clk_out1);
  output [0:0]ch;
  input CLK;
  input [1:0]Q;
  input \mode_reg[2] ;
  input clk_out1;

  wire CLK;
  wire [1:0]Q;
  wire [0:0]ch;
  wire clk_out1;
  wire \data_to_serializer[0]_i_1_n_0 ;
  wire \data_to_serializer[4]_i_1__0_n_0 ;
  wire \data_to_serializer[6]_i_1__0_n_0 ;
  wire \data_to_serializer[7]_i_1_n_0 ;
  wire \data_to_serializer[8]_i_1__0_n_0 ;
  wire \data_to_serializer[9]_i_1__1_n_0 ;
  wire \data_to_serializer_reg_n_0_[0] ;
  wire \data_to_serializer_reg_n_0_[4] ;
  wire \data_to_serializer_reg_n_0_[6] ;
  wire \data_to_serializer_reg_n_0_[7] ;
  wire \data_to_serializer_reg_n_0_[8] ;
  wire \data_to_serializer_reg_n_0_[9] ;
  wire \mode_reg[2] ;
  wire \total_disp[1]_i_1__0_n_0 ;
  wire \total_disp[2]_i_1__0_n_0 ;
  wire \total_disp[3]_i_1__0_n_0 ;
  wire \total_disp_reg_n_0_[1] ;
  wire \total_disp_reg_n_0_[2] ;
  wire \total_disp_reg_n_0_[3] ;

  LUT5 #(
    .INIT(32'h7777EEE6)) 
    \data_to_serializer[0]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(\total_disp_reg_n_0_[1] ),
        .I4(\total_disp_reg_n_0_[3] ),
        .O(\data_to_serializer[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h54FFFFAA)) 
    \data_to_serializer[4]_i_1__0 
       (.I0(\total_disp_reg_n_0_[3] ),
        .I1(\total_disp_reg_n_0_[1] ),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\data_to_serializer[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h11118880)) 
    \data_to_serializer[6]_i_1__0 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(\total_disp_reg_n_0_[1] ),
        .I4(\total_disp_reg_n_0_[3] ),
        .O(\data_to_serializer[6]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h540000AA)) 
    \data_to_serializer[7]_i_1 
       (.I0(\total_disp_reg_n_0_[3] ),
        .I1(\total_disp_reg_n_0_[1] ),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\data_to_serializer[7]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_to_serializer[8]_i_1__0 
       (.I0(Q[1]),
        .O(\data_to_serializer[8]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFBBBB222A)) 
    \data_to_serializer[9]_i_1__1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(\total_disp_reg_n_0_[1] ),
        .I4(\total_disp_reg_n_0_[3] ),
        .I5(\mode_reg[2] ),
        .O(\data_to_serializer[9]_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[0] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\data_to_serializer[0]_i_1_n_0 ),
        .Q(\data_to_serializer_reg_n_0_[0] ),
        .R(\mode_reg[2] ));
  FDSE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[4] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\data_to_serializer[4]_i_1__0_n_0 ),
        .Q(\data_to_serializer_reg_n_0_[4] ),
        .S(\mode_reg[2] ));
  FDSE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[6] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\data_to_serializer[6]_i_1__0_n_0 ),
        .Q(\data_to_serializer_reg_n_0_[6] ),
        .S(\mode_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[7] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\data_to_serializer[7]_i_1_n_0 ),
        .Q(\data_to_serializer_reg_n_0_[7] ),
        .R(\mode_reg[2] ));
  FDSE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[8] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\data_to_serializer[8]_i_1__0_n_0 ),
        .Q(\data_to_serializer_reg_n_0_[8] ),
        .S(\mode_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[9] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\data_to_serializer[9]_i_1__1_n_0 ),
        .Q(\data_to_serializer_reg_n_0_[9] ),
        .R(1'b0));
  serializer10bit_0 serializer_inst
       (.CLK(CLK),
        .D({\data_to_serializer_reg_n_0_[9] ,\data_to_serializer_reg_n_0_[8] ,\data_to_serializer_reg_n_0_[7] ,\data_to_serializer_reg_n_0_[6] ,\data_to_serializer_reg_n_0_[4] ,\data_to_serializer_reg_n_0_[0] }),
        .ch(ch));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h98CCCC66)) 
    \total_disp[1]_i_1__0 
       (.I0(\total_disp_reg_n_0_[3] ),
        .I1(\total_disp_reg_n_0_[1] ),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\total_disp[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hE0F0F078)) 
    \total_disp[2]_i_1__0 
       (.I0(\total_disp_reg_n_0_[3] ),
        .I1(\total_disp_reg_n_0_[1] ),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\total_disp[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h55AAAAD5)) 
    \total_disp[3]_i_1__0 
       (.I0(\total_disp_reg_n_0_[3] ),
        .I1(\total_disp_reg_n_0_[1] ),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\total_disp[3]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_disp_reg[1] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\total_disp[1]_i_1__0_n_0 ),
        .Q(\total_disp_reg_n_0_[1] ),
        .R(\mode_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \total_disp_reg[2] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\total_disp[2]_i_1__0_n_0 ),
        .Q(\total_disp_reg_n_0_[2] ),
        .R(\mode_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \total_disp_reg[3] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\total_disp[3]_i_1__0_n_0 ),
        .Q(\total_disp_reg_n_0_[3] ),
        .R(\mode_reg[2] ));
endmodule

(* ORIG_REF_NAME = "tmds_encoder" *) 
module tmds_encoder__parameterized3
   (ch,
    CLK,
    Q,
    \mode_reg[2] ,
    clk_out1);
  output [0:0]ch;
  input CLK;
  input [1:0]Q;
  input \mode_reg[2] ;
  input clk_out1;

  wire CLK;
  wire [1:0]Q;
  wire [0:0]ch;
  wire clk_out1;
  wire \data_to_serializer[0]_i_1__0_n_0 ;
  wire \data_to_serializer[7]_i_1__0_n_0 ;
  wire \data_to_serializer[8]_i_1__1_n_0 ;
  wire \data_to_serializer[9]_i_1__0_n_0 ;
  wire \data_to_serializer_reg_n_0_[0] ;
  wire \data_to_serializer_reg_n_0_[4] ;
  wire \data_to_serializer_reg_n_0_[6] ;
  wire \data_to_serializer_reg_n_0_[7] ;
  wire \data_to_serializer_reg_n_0_[8] ;
  wire \data_to_serializer_reg_n_0_[9] ;
  wire \mode_reg[2] ;
  wire \total_disp[1]_i_1__1_n_0 ;
  wire \total_disp[2]_i_1__1_n_0 ;
  wire \total_disp[3]_i_1__1_n_0 ;
  wire \total_disp_reg_n_0_[1] ;
  wire \total_disp_reg_n_0_[2] ;
  wire \total_disp_reg_n_0_[3] ;

  LUT5 #(
    .INIT(32'h54FFFFAA)) 
    \data_to_serializer[0]_i_1__0 
       (.I0(\total_disp_reg_n_0_[3] ),
        .I1(\total_disp_reg_n_0_[1] ),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\data_to_serializer[0]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h540000AA)) 
    \data_to_serializer[7]_i_1__0 
       (.I0(\total_disp_reg_n_0_[3] ),
        .I1(\total_disp_reg_n_0_[1] ),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\data_to_serializer[7]_i_1__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_to_serializer[8]_i_1__1 
       (.I0(Q[1]),
        .O(\data_to_serializer[8]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hABFF00AA)) 
    \data_to_serializer[9]_i_1__0 
       (.I0(\total_disp_reg_n_0_[3] ),
        .I1(\total_disp_reg_n_0_[1] ),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\data_to_serializer[9]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[0] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\data_to_serializer[0]_i_1__0_n_0 ),
        .Q(\data_to_serializer_reg_n_0_[0] ),
        .R(\mode_reg[2] ));
  FDSE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[4] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\data_to_serializer[0]_i_1__0_n_0 ),
        .Q(\data_to_serializer_reg_n_0_[4] ),
        .S(\mode_reg[2] ));
  FDSE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[6] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\data_to_serializer[7]_i_1__0_n_0 ),
        .Q(\data_to_serializer_reg_n_0_[6] ),
        .S(\mode_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[7] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\data_to_serializer[7]_i_1__0_n_0 ),
        .Q(\data_to_serializer_reg_n_0_[7] ),
        .R(\mode_reg[2] ));
  FDSE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[8] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\data_to_serializer[8]_i_1__1_n_0 ),
        .Q(\data_to_serializer_reg_n_0_[8] ),
        .S(\mode_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \data_to_serializer_reg[9] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\data_to_serializer[9]_i_1__0_n_0 ),
        .Q(\data_to_serializer_reg_n_0_[9] ),
        .R(\mode_reg[2] ));
  serializer10bit serializer_inst
       (.CLK(CLK),
        .D({\data_to_serializer_reg_n_0_[9] ,\data_to_serializer_reg_n_0_[8] ,\data_to_serializer_reg_n_0_[7] ,\data_to_serializer_reg_n_0_[6] ,\data_to_serializer_reg_n_0_[4] ,\data_to_serializer_reg_n_0_[0] }),
        .ch(ch));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h98CCCC66)) 
    \total_disp[1]_i_1__1 
       (.I0(\total_disp_reg_n_0_[3] ),
        .I1(\total_disp_reg_n_0_[1] ),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\total_disp[1]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hE0F0F078)) 
    \total_disp[2]_i_1__1 
       (.I0(\total_disp_reg_n_0_[3] ),
        .I1(\total_disp_reg_n_0_[1] ),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\total_disp[2]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h55AAAAD5)) 
    \total_disp[3]_i_1__1 
       (.I0(\total_disp_reg_n_0_[3] ),
        .I1(\total_disp_reg_n_0_[1] ),
        .I2(\total_disp_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\total_disp[3]_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \total_disp_reg[1] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\total_disp[1]_i_1__1_n_0 ),
        .Q(\total_disp_reg_n_0_[1] ),
        .R(\mode_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \total_disp_reg[2] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\total_disp[2]_i_1__1_n_0 ),
        .Q(\total_disp_reg_n_0_[2] ),
        .R(\mode_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \total_disp_reg[3] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\total_disp[3]_i_1__1_n_0 ),
        .Q(\total_disp_reg_n_0_[3] ),
        .R(\mode_reg[2] ));
endmodule

module tmds_transmitter
   (ch,
    CLK,
    Q,
    \mode_reg[2] ,
    clk_out1,
    sel0);
  output [2:0]ch;
  input CLK;
  input [5:0]Q;
  input \mode_reg[2] ;
  input clk_out1;
  input [0:0]sel0;

  wire CLK;
  wire [5:0]Q;
  wire [2:0]ch;
  wire clk_out1;
  wire \mode_reg[2] ;
  wire [0:0]sel0;

  tmds_encoder tmds_enc0
       (.CLK(CLK),
        .Q(Q[5:4]),
        .ch(ch[0]),
        .clk_out1(clk_out1),
        .\mode_reg[2] (\mode_reg[2] ),
        .sel0(sel0));
  tmds_encoder__parameterized1 tmds_enc1
       (.CLK(CLK),
        .Q(Q[3:2]),
        .ch(ch[1]),
        .clk_out1(clk_out1),
        .\mode_reg[2] (\mode_reg[2] ));
  tmds_encoder__parameterized3 tmds_enc2
       (.CLK(CLK),
        .Q(Q[1:0]),
        .ch(ch[2]),
        .clk_out1(clk_out1),
        .\mode_reg[2] (\mode_reg[2] ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
