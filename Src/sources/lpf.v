`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/18 14:17:04
// Design Name: 
// Module Name: lpf
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


module lpf(
	input clk,
	input rst,
	input [17:0] datain,
	output [17:0] dataout
    );

	reg [17:0]q0;
	reg [17:0]q1;
	reg [17:0]q2;
	reg [17:0]q3;
	reg [17:0]q4;
	reg [17:0]q5;
	reg [17:0]q6;

	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			q0 <= 0;
			q1 <= 0;
			q2 <= 0;
			q3 <= 0;
			q4 <= 0;
			q5 <= 0;
			q6 <= 0;
		end
		else begin
			q0 <= datain;
			q1 <= q0;
			q2 <= q1;
			q3 <= q2;
			q4 <= q3;
			q5 <= q4;
			q6 <= q5;
		end
	end

	wire [17:0] sum11;
	wire [17:0] sum12;
	wire [17:0] sum13;
	wire [17:0] sum14;
	wire [17:0] sum21;
	wire [17:0] sum22;
	wire [17:0] sum3;
	c_addsub_0 your_instance_name1 (
	  .A(datain),      // input wire [17 : 0] A
	  .B(q0),      // input wire [17 : 0] B
	  .CLK(clk),  // input wire CLK
	  .S(sum11)      // output wire [17 : 0] S
	);
	c_addsub_0 your_instance_name2 (
	  .A(q1),      // input wire [17 : 0] A
	  .B(q2),      // input wire [17 : 0] B
	  .CLK(clk),  // input wire CLK
	  .S(sum12)      // output wire [17 : 0] S
	);
	c_addsub_0 your_instance_name3 (
	  .A(q3),      // input wire [17 : 0] A
	  .B(q4),      // input wire [17 : 0] B
	  .CLK(clk),  // input wire CLK
	  .S(sum13)      // output wire [17 : 0] S
	);
	c_addsub_0 your_instance_name4 (
	  .A(q5),      // input wire [17 : 0] A
	  .B(q6),      // input wire [17 : 0] B
	  .CLK(clk),  // input wire CLK
	  .S(sum14)      // output wire [17 : 0] S
	);

	c_addsub_0 your_instance_name5 (
	  .A(sum11),      // input wire [17 : 0] A
	  .B(sum12),      // input wire [17 : 0] B
	  .CLK(clk),  // input wire CLK
	  .S(sum21)      // output wire [17 : 0] S
	);
	c_addsub_0 your_instance_name6 (
	  .A(sum13),      // input wire [17 : 0] A
	  .B(sum14),      // input wire [17 : 0] B
	  .CLK(clk),  // input wire CLK
	  .S(sum22)      // output wire [17 : 0] S
	);

	c_addsub_0 your_instance_name7 (
	  .A(sum22),      // input wire [17 : 0] A
	  .B(sum21),      // input wire [17 : 0] B
	  .CLK(clk),  // input wire CLK
	  .S(sum3)      // output wire [17 : 0] S
	);
	
	assign dataout = sum3;
endmodule
