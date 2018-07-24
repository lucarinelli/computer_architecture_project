// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Fri Jul 20 19:01:28 2018
// Host        : SATANASSO running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/ip/clk_wiz/clk_wiz_stub.v
// Design      : clk_wiz
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz(memoryClock, referenceClock, reset, locked, 
  systemClock)
/* synthesis syn_black_box black_box_pad_pin="memoryClock,referenceClock,reset,locked,systemClock" */;
  output memoryClock;
  output referenceClock;
  input reset;
  output locked;
  input systemClock;
endmodule
