// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Wed Jun 13 21:53:18 2018
// Host        : DESKTOP-0KG3I12 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/rinel/Desktop/computer_architecture_project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
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
