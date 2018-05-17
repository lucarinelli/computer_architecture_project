// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Sun May 13 17:18:39 2018
// Host        : SATANASSO running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/hdmi_out_test/hdmi_out_test.srcs/sources_1/ip/clk_wiz_hdmi/clk_wiz_hdmi_stub.v
// Design      : clk_wiz_hdmi
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_hdmi(clk_out1, clk_out2, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,clk_out2,reset,locked,clk_in1" */;
  output clk_out1;
  output clk_out2;
  input reset;
  output locked;
  input clk_in1;
endmodule
