`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/19 11:21:13
// Design Name: 
// Module Name: judge
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


module judge(
	input clk,
	input rst,
	input [17:0] R,
	input [17:0] I,
	input clk_8192k,
	output reg[1:0] code_out,
	output data_en
    );

	wire [17:0] R_temp = (~R) + 1;
	wire [17:0] I_temp = (~I) + 1;

	reg [16:0] abs_R,abs_I;
	reg symble_R,symble_I;
//取绝对值，判断是0还是非零
	always @ (posedge clk) begin
		if(R[17] == 1) begin
			abs_R <= R_temp[16:0];
		end
		else begin
			abs_R <= R[16:0];
		end
	end
	always @ (posedge clk) begin
		if(I[17] == 1) begin
			abs_I <= I_temp[16:0];
		end
		else begin
			abs_I <= I[16:0];
		end
	end

//大于一个值时考虑符号位
	always @ (posedge clk) begin
		symble_I <= (abs_I > 1000)?I[17]:0;
		symble_R <= (abs_R > 1000)?R[17]:0;
	end

	wire Zero = (abs_R < 1000) && (abs_I < 1000);

	wire [1:0]flag = {symble_R,symble_I};

	reg [1:0] flag_r;
	always @ (posedge clk) begin
		flag_r <= flag;
	end

	wire diff = flag_r != flag;
//中间采样
	reg[6:0] counter;

	always @(posedge clk_8192k or posedge rst) begin
		if (rst) begin
			counter <= 0;
		end
		else if (diff) begin
			counter <= 0;
		end
		else begin
			counter <= counter + 1;
		end
	end
	reg T = 0;
	assign data_en = counter == 64;
	assign change = (last_flag != flag);
	reg [1:0]last_flag;
	always @ (posedge clk_8192k) begin
		if(data_en) begin
			if(Zero) begin
				code_out <= 2'b00;
			end
			else begin
				last_flag <= flag;
				if(change) begin
					T <= ~T;
					if(~T) begin
						code_out <= 2'b01;
					end
					else begin
						code_out <= 2'b10;
					end
				end
				else begin
					if(T) begin
						code_out <= 2'b01;
					end
					else begin
						code_out <= 2'b10;
					end
				end
			end
		end
	end


endmodule

