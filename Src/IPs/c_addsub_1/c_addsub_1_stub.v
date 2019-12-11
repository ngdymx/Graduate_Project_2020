// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sun Jun 30 05:22:55 2019
// Host        : Beats running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/15195/Desktop/design3/design3/demo3/demo3.srcs/sources_1/ip/c_addsub_1/c_addsub_1_stub.v
// Design      : c_addsub_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *)
module c_addsub_1(A, B, CLK, S)
/* synthesis syn_black_box black_box_pad_pin="A[7:0],B[7:0],CLK,S[8:0]" */;
  input [7:0]A;
  input [7:0]B;
  input CLK;
  output [8:0]S;
endmodule
