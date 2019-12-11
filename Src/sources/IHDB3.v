`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 09:03:09
// Design Name: 
// Module Name: IHDB3
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


module IHDB3(
	input clk,
	input rst,
    input data_valid,
	input [1:0] HDB3_in,
	output  IHDB3_out
    );
    
	wire [1:0] checkv_out;

	check_v inst_check_v(
    	.clk(clk),
    	.rst(rst),
        .valid(data_valid),
    	.hdb3_in(HDB3_in),
    	.checkv_out(IHDB3_out)
    );

endmodule
