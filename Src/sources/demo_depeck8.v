`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/21 13:47:43
// Design Name: 
// Module Name: demo_depeck8
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


module demo_depeck8(
	input clk,
	input rst,
	input en,
	input shift,
	input datain,
	output [7:0] dataout
    );
	
	reg shift_r;
	reg [7:0] qdemo;
	always @ (posedge clk) begin
		shift_r <= shift;
	end

	wire shift_flag = (~shift_r) & shift;
	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			qdemo <= 0;
		end
		else if(shift_flag) begin
			qdemo <= {qdemo[6:0],qdemo[7]};
		end
		else if (en) begin
			qdemo <= {qdemo[6:0],datain};
		end
	end

	assign dataout = qdemo[7:0];
endmodule
