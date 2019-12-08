`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/16 12:03:30
// Design Name: 
// Module Name: LTC2145_Simple
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


module LTC2145_Simple#
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 5,
		parameter integer DATA_WIDTH = 20
	)(
	//LTC2145 ports
	input ADCLK_P,
	input ADCLK_N,
	input [9:0] AD1,
	input [9:0] AD2,

	//Stream OUT ports
	input ADC_AXIS_ACLK,
	input ADC_AXIS_ARESETN,
	output ADC_AXIS_TVALID,
	output [31:0] ADC_AXIS_TDATA,
	input ADC_AXIS_TREADY,
	output ADC_AXIS_TLAST,
	output [3:0] ADC_AXIS_TKEEP,
 	//Bare output
 	(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 adc_clk CLK" *)
     (* X_INTERFACE_PARAMETER = "FREQ_HZ 125000000" *)
 	output adc_clk,
 	output reg [19:0] adc_data,
      (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 dac_clk CLK" *)
      (* X_INTERFACE_PARAMETER = "FREQ_HZ 125000000" *)
 	output dac_clk,
 	output locked,
 	
	output [DATA_WIDTH * 5 - 1 : 0] delay_val_out,
 	
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


	wire [1:0] mode = slv_reg0[9:8];
	wire srst = slv_reg0[24];
	wire enable = slv_reg0[0];
	wire [15:0] MAX_counter = slv_reg1[15:0];
	wire AXIS_RST = srst & (~ADC_AXIS_ARESETN);
	
	wire [15:0] CH1_DATA = {6'b00,AD1_l};
	//wire [15:0] CH2_DATA = {2'b00,AD2};
	wire [15:0] CH2_DATA = {6'b00,AD2_l};
	wire [9:0] AD1_l,AD2_l;
	always @ (posedge adc_clk) begin
		case(mode)
		CH1: begin adc_data <= {AD1_l,AD1_l}; end
		CH2: begin adc_data <= {AD2_l,AD2_l}; end
		DUAL: begin adc_data <= {AD2_l,AD1_l}; end
		default: begin adc_data <= MODE_CH1_DATA; end
		endcase
	end

	reg [15:0] CH1_LAST_DATA;
	reg [15:0] CH2_LAST_DATA;

	always @ (posedge adc_clk) begin
		CH1_LAST_DATA <= CH1_DATA;
		CH2_LAST_DATA <= CH2_DATA;
	end

//	always @(posedge adc_clk) begin
//		AD1_l <= AD1;
//		AD2_l <= AD2;
//	end
	 Auto_Delay_Receiver #(
	 	.DATA_WIDTH(DATA_WIDTH)
	 ) inst_Auto_Delay_Receiver (
	 	.reset_n     (S_AXI_ARESETN),
	 	.clk_in_p    (ADCLK_P),
	 	.clk_in_n    (ADCLK_N),
	 	.data_in     ({AD2,AD1}),
	 	.data_out    ({AD2_l,AD1_l}),
	 	.data_out_en (),
	 	.clk_out     (adc_clk),
	 	.doubled_clk (dac_clk),
	 	.locked      (locked),
	 	.delay_val_out(delay_val_out)
	 );

	wire [31:0] MODE_CH1_DATA = {CH1_DATA,CH1_LAST_DATA};
	wire [31:0] MODE_CH2_DATA = {CH2_DATA,CH2_LAST_DATA};
	wire [31:0] MODE_DUAL_DATA = {CH2_DATA,CH1_DATA};
	reg [31:0] din;
	wire empty;
	reg [15:0] AXIS_counter;
	wire AXIS_active = ADC_AXIS_TVALID & ADC_AXIS_TREADY;
	always @ (posedge adc_clk) begin
		case(mode)
		CH1: begin din <= MODE_CH1_DATA; end
		CH2: begin din <= MODE_CH2_DATA; end
		DUAL: begin din <= MODE_DUAL_DATA; end
		default: begin din <= MODE_CH1_DATA; end
		endcase
	end

	fifo_generator_0 U_async_fifo_LTC2145 (
		.rst(AXIS_RST),        // input wire rst
		.wr_clk(adc_clk),  // input wire wr_clk
		.rd_clk(ADC_AXIS_ACLK),  // input wire rd_clk
		.din(din),        // input wire [31 : 0] din
		.wr_en(enable),    // input wire wr_en
		.rd_en(AXIS_active),    // input wire rd_en
		.dout(ADC_AXIS_TDATA),      // output wire [31 : 0] dout
		.full(),      // output wire full
		.empty(empty)    // output wire empty
	);
	assign ADC_AXIS_TVALID = (~empty) & enable;

	always @(posedge ADC_AXIS_ACLK or posedge AXIS_RST) begin
		if (AXIS_RST) begin
			// reset
			AXIS_counter <= 0;
		end
		else if (AXIS_active) begin
			if(AXIS_counter < (MAX_counter - 1)) begin
				AXIS_counter <= AXIS_counter + 1;
			end
			else begin
				AXIS_counter <= 0;
			end
		end
	end
	assign ADC_AXIS_TLAST = AXIS_counter == (MAX_counter - 1);
	assign ADC_AXIS_TKEEP = 4'b1111;
endmodule
