`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2019 02:13:12 PM
// Design Name: 
// Module Name: Auto_Delay
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


module Auto_Delay(
	input reset,
	//input ref_clk_200M,
	input sample_clk,
	input sample_clk_inv,
	input data_in,
	output data_out,
	output [4:0]delay_out
    );
    assign data_out = data_in;
    assign delay_out = 0;
// 	(* IODELAY_GROUP = 1 *) 
// 	wire data_delayed;
// 	wire CE;
// 	wire INC;
// 	wire LD;
// 	wire [4:0] CNTVALUEOUT;
// 	assign delay_out = CNTVALUEOUT;
//	wire lowest = (~INC) & (CNTVALUEOUT == 0);
//	wire highest = (INC) & (CNTVALUEOUT == 31);
//	wire [4:0] load_val = 5'b10000;//(CNTVALUEOUT == 0)?(31):0;
// 	IDELAYE2 #(
//		.CINVCTRL_SEL("FALSE"),          // Enable dynamic clock inversion (FALSE, TRUE)
//		.DELAY_SRC("DATAIN"),           // Delay input (IDATAIN, DATAIN)
//		.HIGH_PERFORMANCE_MODE("TRUE"), // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//		.IDELAY_TYPE("VAR_LOAD"),           // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//		.IDELAY_VALUE(0),                // Input delay tap setting (0-31)
//		.PIPE_SEL("FALSE"),              // Select pipelined mode, FALSE, TRUE
//		.REFCLK_FREQUENCY(200.0),        // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
//		.SIGNAL_PATTERN("DATA")          // DATA, CLOCK input signal
//	)
//	IDELAYE2_inst (
//		.CNTVALUEOUT(CNTVALUEOUT), // 5-bit output: Counter value output
//		.DATAOUT(data_delayed),         // 1-bit output: Delayed data output
//		.C(sample_clk),                     // 1-bit input: Clock input
//		.CE(CE & (~lowest) & (~highest)),                   // 1-bit input: Active high enable increment/decrement input
//		.CINVCTRL(1'b0),       // 1-bit input: Dynamic clock inversion input
//		.CNTVALUEIN(load_val),   // 5-bit input: Counter value input
//		.DATAIN(data_in),           // 1-bit input: Internal delay data input
//		.IDATAIN(1'b0),         // 1-bit input: Data input from the I/O
//		.INC(INC),                 // 1-bit input: Increment / Decrement tap delay input
//		.LD(LD),                   // 1-bit input: Load IDELAY_VALUE input
//		.LDPIPEEN(0),       // 1-bit input: Enable PIPELINE register to load data input
//		.REGRST(reset)            // 1-bit input: Active-high reset tap-delay input
//	);
//	//control delay system
//	reg active_inv;
//	reg inversed;

//	always @ (posedge sample_clk or posedge reset) begin
//		if(reset) begin
//			active_inv <= 0;
//			inversed <= 1;
//		end
//		else if(CE & (lowest | highest) & (inversed)) begin
//			active_inv <= (~active_inv);
//			inversed <= 0;
//		end
//	end


//	assign CE = (sample_latch_1 ^ sample_latch_2);
//	assign INC = active_inv?sample_latch_1 ^ sample_inv_latch_2 : sample_latch_1 ^~ sample_inv_latch_2;
//	assign LD = (lowest | highest) & CE;


//	reg sample_latch_2;
//	reg sample_inv_latch_2;
//	//latch data
//	always @ (posedge sample_clk) begin
//		sample_latch_1 <= data_delayed;
//		sample_latch_2 <= sample_latch_1;
//	end
//	always @ (posedge sample_clk_inv) begin
//		sample_inv_latch_1 <= data_delayed;
//		sample_inv_latch_2 <= sample_inv_latch_1;
//	end
//	(* ASYNC_REG = "TRUE" *) reg sample_latch_1,async_reg,sample_inv_latch_1,async_reg_inv;
//	always @(sample_clk) begin
//		async_reg <= sample_latch_1;
//		async_reg_inv <= sample_inv_latch_1;
//	end
//	assign data_out = active_inv?async_reg_inv:async_reg;
endmodule
