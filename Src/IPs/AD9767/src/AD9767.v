`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/16 13:59:36
// Design Name: 
// Module Name: AD9767
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


module AD9767#
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 5
	)(
	//AD9767 Ports
	output [13:0] DA_DATA,
	output DA_WRT,
	output DA_CLK,
	output DA_RESET,
	output DA_SEL,

	//
	input adc_clk,
	input [27:0]adc_data,
	input dac_clk,
	input locked,

	//Stream In Ports
	input DAC_AXIS_ACLK,
	input DAC_AXIS_ARESETN,
	input [31:0] DAC_AXIS_TDATA,
	input DAC_AXIS_TVALID,
	output DAC_AXIS_TREADY,

	//Configure AXI LITE Ports
	// Global Clock Signal
	input wire  S_AXI_ACLK,
	// Global Reset Signal. This Signal is Active LOW
	input wire  S_AXI_ARESETN,
	// Write address (issued by master, acceped by Slave)
	input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
	// Write channel Protection type. This signal indicates the
		// privilege and security level of the transaction, and whether
		// the transaction is a data access or an instruction access.
	input wire [2 : 0] S_AXI_AWPROT,
	// Write address valid. This signal indicates that the master signaling
		// valid write address and control information.
	input wire  S_AXI_AWVALID,
	// Write address ready. This signal indicates that the slave is ready
		// to accept an address and associated control signals.
	output wire  S_AXI_AWREADY,
	// Write data (issued by master, acceped by Slave) 
	input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
	// Write strobes. This signal indicates which byte lanes hold
		// valid data. There is one write strobe bit for each eight
		// bits of the write data bus.    
	input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
	// Write valid. This signal indicates that valid write
		// data and strobes are available.
	input wire  S_AXI_WVALID,
	// Write ready. This signal indicates that the slave
		// can accept the write data.
	output wire  S_AXI_WREADY,
	// Write response. This signal indicates the status
		// of the write transaction.
	output wire [1 : 0] S_AXI_BRESP,
	// Write response valid. This signal indicates that the channel
		// is signaling a valid write response.
	output wire  S_AXI_BVALID,
	// Response ready. This signal indicates that the master
		// can accept a write response.
	input wire  S_AXI_BREADY,
	// Read address (issued by master, acceped by Slave)
	input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
	// Protection type. This signal indicates the privilege
		// and security level of the transaction, and whether the
		// transaction is a data access or an instruction access.
	input wire [2 : 0] S_AXI_ARPROT,
	// Read address valid. This signal indicates that the channel
		// is signaling valid read address and control information.
	input wire  S_AXI_ARVALID,
	// Read address ready. This signal indicates that the slave is
		// ready to accept an address and associated control signals.
	output wire  S_AXI_ARREADY,
	// Read data (issued by slave)
	output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
	// Read response. This signal indicates the status of the
		// read transfer.
	output wire [1 : 0] S_AXI_RRESP,
	// Read valid. This signal indicates that the channel is
		// signaling the required read data.
	output wire  S_AXI_RVALID,
	// Read ready. This signal indicates that the master can
		// accept the read data and response information.
	input wire  S_AXI_RREADY
    );
	// Users to add ports here
	wire [C_S_AXI_DATA_WIDTH-1:0]	slv_reg0; 
	wire [C_S_AXI_DATA_WIDTH-1:0]	slv_reg1;
	wire [C_S_AXI_DATA_WIDTH-1:0]	slv_reg2;
	wire [C_S_AXI_DATA_WIDTH-1:0]	slv_reg3;
	wire [C_S_AXI_DATA_WIDTH-1:0]	slv_reg4;
	wire [C_S_AXI_DATA_WIDTH-1:0]	slv_reg5;
	localparam CH1 = 2'b00;
	localparam CH2 = 2'b01;
	localparam DUAL = 2'b10;	
	localparam SIMPLE = 2'b11;
	AXI_LITE #(
		.C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
	) inst_AXI_LITE (
		.slv_reg0      (slv_reg0),
		.slv_reg1      (slv_reg1),
		.slv_reg2      (slv_reg2),
		.slv_reg3      (slv_reg3),
		.slv_reg4      (slv_reg4),
		.slv_reg5      (slv_reg5),
		.slv_wire0     (slv_reg0),
		.slv_wire1     (slv_reg1),
		.slv_wire2     (slv_reg2),
		.slv_wire3     (slv_reg3),
		.slv_wire4     (slv_reg4),
		.slv_wire5     (slv_reg5),
		.S_AXI_ACLK    (S_AXI_ACLK),
		.S_AXI_ARESETN (S_AXI_ARESETN),
		.S_AXI_AWADDR  (S_AXI_AWADDR),
		.S_AXI_AWPROT  (S_AXI_AWPROT),
		.S_AXI_AWVALID (S_AXI_AWVALID),
		.S_AXI_AWREADY (S_AXI_AWREADY),
		.S_AXI_WDATA   (S_AXI_WDATA),
		.S_AXI_WSTRB   (S_AXI_WSTRB),
		.S_AXI_WVALID  (S_AXI_WVALID),
		.S_AXI_WREADY  (S_AXI_WREADY),
		.S_AXI_BRESP   (S_AXI_BRESP),
		.S_AXI_BVALID  (S_AXI_BVALID),
		.S_AXI_BREADY  (S_AXI_BREADY),
		.S_AXI_ARADDR  (S_AXI_ARADDR),
		.S_AXI_ARPROT  (S_AXI_ARPROT),
		.S_AXI_ARVALID (S_AXI_ARVALID),
		.S_AXI_ARREADY (S_AXI_ARREADY),
		.S_AXI_RDATA   (S_AXI_RDATA),
		.S_AXI_RRESP   (S_AXI_RRESP),
		.S_AXI_RVALID  (S_AXI_RVALID),
		.S_AXI_RREADY  (S_AXI_RREADY)
	);

	wire [1:0] mode = slv_reg0[1:0];
	reg S;
	wire full;
	wire wr_clk;
	wire data_switch = slv_reg0[8:8];
	wire [31:0] din = DAC_AXIS_TDATA;
	//wire [31:0] din = data_switch?({2'b00,14'd8191,2'b00,14'd8191}):(DAC_AXIS_TDATA);
	wire [31:0] dout;
	assign DAC_AXIS_TREADY = ~full;
	wire wr_en = (DAC_AXIS_TVALID & data_switch) & DAC_AXIS_TREADY;

	// BUFGMUX BUFGMUX_inst (
	// 	.O(DA_CLK),   // 1-bit output: Clock output
	// 	.I0(adc_clk), // 1-bit input: Clock input (S=0)
	// 	.I1(dac_clk), // 1-bit input: Clock input (S=1)
	// 	.S(S)    // 1-bit input: Clock select
	// );
	wire empty;
	fifo_generator_0 U_async_fifo_AD9767 (									
		.srst(~DAC_AXIS_ARESETN),        // input wire rst									
		.clk(adc_clk), 								
		.din(din),        // input wire [31 : 0] din									
		.wr_en(wr_en),    // input wire wr_en									
		.rd_en(~empty),    // input wire rd_en									
		.dout(dout),      // output wire [31 : 0] dout									
		.full(full),      // output wire full									
		.empty(empty)    // output wire empty									
	);
	always @ (*) begin
		case(mode)
		CH1: begin S = 0; end
		CH2: begin S = 0; end
		DUAL: begin S = 1; end
		SIMPLE: begin S = 1; end
		endcase
	end

	// reg rd_en_125_div_2;

	// always @(posedge adc_clk) begin
	// 	rd_en_125_div_2 <= ~rd_en_125_div_2;
	// end


	reg [13:0] dac_data_a,dac_data_b;

	always @(posedge adc_clk) begin
		case(mode)
		CH1: begin
			dac_data_b <= dout[13:0];
			dac_data_a <= dout[13:0];
		end
		CH2:begin
			dac_data_a <= dout[29:16];
			dac_data_b <= dout[29:16];
		end
		DUAL:begin
			dac_data_b <= adc_data[27:14];
			dac_data_a <= adc_data[13:0];
		end
		SIMPLE:begin
			dac_data_b <= dout[29:16];
			dac_data_a <= dout[13:0];
		end
		endcase
	end

	assign DA_RESET = ~locked;
	wire clk_p = mode[1]?0:~adc_clk;
	wire clk_n = mode[1]?1:~adc_clk;
	wire sel_p = mode[1]?1:(~mode[0]);
	wire sel_n = mode[1]?0:(~mode[0]);

	ODDR #(
		.DDR_CLK_EDGE("SAME_EDGE"), // "OPPOSITE_EDGE" or "SAME_EDGE" 
		.INIT(1'b0),    // Initial value of Q: 1'b0 or 1'b1
		.SRTYPE("SYNC") // Set/Reset type: "SYNC" or "ASYNC" 
	) ODDR_DAC_CLK (
		.Q(DA_CLK),   // 1-bit DDR output
		.C(dac_clk),   // 1-bit clock input
		.CE(1), // 1-bit clock enable input
		.D1(0), // 1-bit data input (positive edge)
		.D2(1), // 1-bit data input (negative edge)
		.R(0),   // 1-bit reset
		.S(0)    // 1-bit set
	);
	ODDR #(
		.DDR_CLK_EDGE("SAME_EDGE"), // "OPPOSITE_EDGE" or "SAME_EDGE" 
		.INIT(1'b0),    // Initial value of Q: 1'b0 or 1'b1
		.SRTYPE("SYNC") // Set/Reset type: "SYNC" or "ASYNC" 
	) ODDR_DAC_SEL (
		.Q(DA_SEL),   // 1-bit DDR output
		.C(adc_clk),   // 1-bit clock input
		.CE(1), // 1-bit clock enable input
		.D1(sel_p), // 1-bit data input (positive edge)
		.D2(sel_n), // 1-bit data input (negative edge)
		.R(0),   // 1-bit reset
		.S(0)    // 1-bit set
	);
	ODDR #(
		.DDR_CLK_EDGE("SAME_EDGE"), // "OPPOSITE_EDGE" or "SAME_EDGE" 
		.INIT(1'b0),    // Initial value of Q: 1'b0 or 1'b1
		.SRTYPE("SYNC") // Set/Reset type: "SYNC" or "ASYNC" 
	) ODDR_DAC_WRT (
		.Q(DA_WRT),   // 1-bit DDR output
		.C(dac_clk),   // 1-bit clock input
		.CE(1), // 1-bit clock enable input
		.D1(clk_p), // 1-bit data input (positive edge)
		.D2(clk_n), // 1-bit data input (negative edge)
		.R(0),   // 1-bit reset
		.S(0)    // 1-bit set
	);
	genvar j;
	generate
    for(j = 0; j < 14; j = j + 1)
    begin : DAC_DAT
      ODDR  #(
		.DDR_CLK_EDGE("SAME_EDGE"), // "OPPOSITE_EDGE" or "SAME_EDGE" 
		.INIT(1'b0),    // Initial value of Q: 1'b0 or 1'b1
		.SRTYPE("SYNC") // Set/Reset type: "SYNC" or "ASYNC" 
		)ODDR_DATA(
        .Q(DA_DATA[j]),
        .D1(dac_data_a[j]),
        .D2(dac_data_b[j]),
        .C(adc_clk),
        .CE(1'b1),
        .R(1'b0),
        .S(1'b0)
      );
    end
  endgenerate
endmodule

