// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Mon Jul  9 23:20:56 2018
// Host        : SATANASSO running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub -rename_top clk_wiz_0 -prefix
//               clk_wiz_0_ clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(RefClk200, MemClk, reset, locked, sysclk)
/* synthesis syn_black_box black_box_pad_pin="RefClk200,MemClk,reset,locked,sysclk" */;
  output RefClk200;
  output MemClk;
  input reset;
  output locked;
  input sysclk;
endmodule
