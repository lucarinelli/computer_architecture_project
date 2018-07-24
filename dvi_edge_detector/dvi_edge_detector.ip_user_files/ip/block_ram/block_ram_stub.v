// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Wed Jul 18 20:01:58 2018
// Host        : SATANASSO running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /mnt/condivisione/BACKUPS/backup_polito/computer_architecture/project/dvi_edge_detector/dvi_edge_detector.srcs/sources_1/ip/block_ram/block_ram_stub.v
// Design      : block_ram
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.1" *)
module block_ram(clka, wea, addra, dina, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[15:0],dina[31:0],clkb,enb,addrb[14:0],doutb[63:0]" */;
  input clka;
  input [0:0]wea;
  input [15:0]addra;
  input [31:0]dina;
  input clkb;
  input enb;
  input [14:0]addrb;
  output [63:0]doutb;
endmodule
