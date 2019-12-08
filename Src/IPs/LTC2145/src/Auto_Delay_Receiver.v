`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2019 01:33:28 PM
// Design Name: 
// Module Name: Auto_Delay_Receiver
// Project Name: Test_Demo
// Target Devices: xc7z010clg400-1
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


module Auto_Delay_Receiver
	#(
		parameter integer DATA_WIDTH = 28
	)(
	input reset_n,
	input clk_in_p,
	input clk_in_n,
	input [DATA_WIDTH - 1:0] data_in,
	output [DATA_WIDTH - 1:0] data_out,
	output data_out_en,
	output clk_out,
	output doubled_clk,
	output locked,
	output [DATA_WIDTH * 5 - 1 : 0] delay_val_out
    );

	wire clk_in;
	wire sample_clk;
	wire sample_clk_inv;
	wire ref_clk_200M;
	wire RDY;
	wire reset = ~reset_n;
	assign clk_out = sample_clk;
	IBUFDS #(
		.DIFF_TERM("FALSE"),       // Differential Termination
		.IBUF_LOW_PWR("FALSE"),     // Low power="TRUE", Highest performance="FALSE" 
		.IOSTANDARD("DEFAULT")     // Specify the input I/O standard
	) IBUFDS_inst (
		.O(clk_in),  // Buffer output
		.I(clk_in_p),  // Diff_p buffer input (connect directly to top-level port)
		.IB(clk_in_n) // Diff_n buffer input (connect directly to top-level port)
	);
	IDELAYCTRL IDELAYCTRL_inst (
		.RDY(RDY),       // 1-bit output: Ready output
		.REFCLK(ref_clk_200M), // 1-bit input: Reference clock input
		.RST(reset)        // 1-bit input: Active high reset input
	);
	clk_wiz_1 instance_name
	(
		// Clock out ports
		.sample_clk(sample_clk),     // output sample_clk
		.sample_clk_inv(sample_clk_inv),     // output sample_clk_inv
		.ref_clk_200M(ref_clk_200M),     // output ref_clk_200M
		.doubled_clk(doubled_clk),     // output doubled_clk
		// Status and control signals
		.resetn(reset_n), // input resetn
		.locked(locked),       // output locked
		// Clock in ports
		.clk_in1(clk_in)
	);      // input clk_in1

	wire [DATA_WIDTH * 5 - 1 : 0] delay_out;
	assign delay_val_out = delay_out;
	generate
		genvar i;
		for (i = 0; i < DATA_WIDTH;i = i + 1) begin
			Auto_Delay inst_Auto_Delay
			(
				.reset   (reset | (~RDY)),
			//	.ref_clk_200M (ref_clk_200M),
				.sample_clk     (sample_clk),
				.sample_clk_inv (sample_clk_inv),
				.data_in        (data_in[i]),
				.data_out       (data_out[i]),
				.delay_out		(delay_out[i * 5+:5])
			);

		end
	endgenerate
endmodule
