// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Mon May 28 18:08:09 2018
// Host        : DESKTOP-0KG3I12 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top clk_wiz_pre -prefix
//               clk_wiz_pre_ clk_wiz_pre_stub.v
// Design      : clk_wiz_pre
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_pre(clk_pre, reset, locked, clk_sys)
/* synthesis syn_black_box black_box_pad_pin="clk_pre,reset,locked,clk_sys" */;
  output clk_pre;
  input reset;
  output locked;
  input clk_sys;
endmodule
