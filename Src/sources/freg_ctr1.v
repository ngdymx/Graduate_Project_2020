`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/06 16:21:06
// Design Name: 
// Module Name: freg_ctr1
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


module freg_ctr1(
	input	wire	clk,
	input	wire	rst,
	output	wire	[2:0]	addr
    );
	
	reg [2:0] count;

	assign addr = count;
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			count <= 0;
		end
		else begin
			count <= count + 1;
		end
	end
endmodule