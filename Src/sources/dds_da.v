`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/06 15:57:58
// Design Name: 
// Module Name: dds_da
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


module dds_da(
	input	wire	clk,
	input	wire	rst,
	output reg [7:0] data_0,
	output reg [7:0] data_pi
    );

	wire [2:0] addr;
	wire [2:0] addr_pi;

	freg_ctr1 inst_freg_ctr1 (
		.clk(clk), 
		.rst(rst), 
		.addr(addr)
		);

	always @ (*) begin
		case(addr)
		3'd0  : begin data_0 = 8'd128; end
		3'd1  : begin data_0 = 8'd219; end
		3'd2  : begin data_0 = 8'd255; end
		3'd3  : begin data_0 = 8'd219; end
		3'd4  : begin data_0 = 8'd128; end
		3'd5  : begin data_0 = 8'd37; end
		3'd6  : begin data_0 = 8'd0;  end
		3'd7  : begin data_0 = 8'd37; end
		endcase
	end
	assign addr_pi = addr + 3'd4;
	always @ (*) begin
		case(addr_pi)
		3'd0  : begin data_pi = 8'd128; end
		3'd1  : begin data_pi = 8'd219; end
		3'd2  : begin data_pi = 8'd255; end
		3'd3  : begin data_pi = 8'd219; end
		3'd4  : begin data_pi = 8'd128; end
		3'd5  : begin data_pi = 8'd37; end
		3'd6  : begin data_pi = 8'd0;  end
		3'd7  : begin data_pi = 8'd37; end
		endcase
	end
endmodule
