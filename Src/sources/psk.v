`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/17 13:45:03
// Design Name: 
// Module Name: psk
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module psk(
	input clk,
	input rst_n,
	input shift_in,
	input [7:0] wavein,
	(*keep= "TRUE"*)output [7:0] waveout,


	// Ports for adc
	output ADC_CLK,
	output DAC_CLK
    );

	wire clk_40Mhz;
	wire clk_8_192Mhz;
	wire rst = ~rst_n;
	(*keep= "TRUE"*)wire [17:0] r;
	(*keep= "TRUE"*)wire [17:0] i;
	(*keep= "TRUE"*)wire [17:0] R;
	(*keep= "TRUE"*)wire [17:0] I;
	wire [7:0] data_0;
	wire [7:0] data_pi;
	wire locked;
	(*keep= "TRUE"*)wire [1:0] code_out;
	wire data_en;

	clk_wiz_0 inst_clk_wiz_0(
		.clk_out1(clk_40Mhz),
		.clk_out2(clk_8_192Mhz),
		.reset(rst),
		.locked(locked),
		.clk_in1(clk)
 		);

 	dds_da inst_dds_da(
		.clk(clk_40Mhz),
		.rst(rst),
		.data_0(data_0),
		.data_pi(data_pi)
    	); 

 	(*keep= "TRUE"*)reg [7:0] latch;

 	reg [8:0] delay1,delay2;
 	wire [8:0] cos = signed_cos;
 	wire [8:0] sin = delay2;
 	(*keep= "TRUE"*)wire  [8:0] wave; //有符号数
 	wire [8:0] signed_cos;
 	wire [7:0] bias;
	c_addsub_1 sub0 (
	  .A(data_0),      // input wire [7 : 0] A
	  .B(8'd127),      // input wire [7 : 0] B
	  .CLK(clk_40Mhz),  // input wire CLK
	  .S(signed_cos)      // output wire [7 : 0] S
	);

	c_addsub_1 sub1 (
	  .A(wavein),      // input wire [7 : 0] A
	  .B(bias),      // input wire [7 : 0] B
	  .CLK(clk_40Mhz),  // input wire CLK
	  .S(wave)      // output wire [7 : 0] S
	);
	always @(posedge clk_40Mhz) begin
		latch <= wavein;
		delay1 <= signed_cos;
		delay2 <= delay1;
	end
	vio_0 Bias (
		  .clk(clk_40Mhz),                // input wire clk
		  .probe_out0(bias)  // output wire [7 : 0] probe_out0
	);
 	mult_gen_0 your_instance_name1(
	    .CLK(clk_40Mhz),
	    .A(wave),
	    .B(cos),
	    .P(r)
  		);

 	mult_gen_0 your_instance_name2(
	    .CLK(clk_40Mhz),
	    .A(wave),
	    .B(sin),
	    .P(i)
  		);

 	lpf inst_lpf(
		.clk(clk_40Mhz),
		.rst(rst),
		.datain(r),
		.dataout(R)
    );

 	lpf inst_lpf1(
		.clk(clk_40Mhz),
		.rst(rst),
		.datain(i),
		.dataout(I)
    );
	ila_0 your_instance_name (
		.clk(clk), // input wire clk
		.probe0(latch),
		.probe1(wave),
		.probe2(r),
		.probe3(i),
		.probe4(R),
		.probe5(I),
		.probe6(code_out),
		.probe7(waveout)
	);
 	judge inst_judge(
		.clk(clk_40Mhz),
		.rst(rst),
		.R(R),
		.I(I),
		.clk_8192k(clk_8_192Mhz),
		.code_out(code_out),
		.data_en(data_en)
	    );
 	IHDB3 inst_IHDB3(
		.clk(clk_8_192Mhz),
		.rst(rst),
		.data_valid(data_en),
		.HDB3_in(code_out),
		.IHDB3_out(IHDB3_out)
	    );
 	demo_depeck8 inst_demo_depeck8(
		.clk(clk_8_192Mhz),
		.rst(rst),
		.shift(shift),
		.en(data_en),
		.dataout(waveout)
	    );

 	reg [15:0] shake_cancle;

 	always @ (posedge clk_8_192Mhz) begin
 		shake_cancle <= {shake_cancle[14:0],shift_in};
 	end
 	wire shift = shake_cancle == 16'hffff;

 	assign ADC_CLK = clk_40Mhz;
	assign DAC_CLK = clk_40Mhz;
endmodule
