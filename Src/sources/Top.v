//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
//Date        : Sun Dec  8 14:48:20 2019
//Host        : nextlab running 64-bit Ubuntu 18.04.3 LTS
//Command     : generate_target ZYNQ_System_wrapper.bd
//Design      : ZYNQ_System_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module TOP(AD1,
    AD2,
    ADCLK_N,
    ADCLK_P,
    DA_CLK,
    DA_DATA,
    DA_RESET,
    DA_SEL,
    DA_WRT,
    DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb);
  input [9:0]AD1;
  input [9:0]AD2;
  input ADCLK_N;
  input ADCLK_P;
  output DA_CLK;
  output [9:0]DA_DATA;
  output DA_RESET;
  output DA_SEL;
  output DA_WRT;
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;

  wire [9:0]AD1;
  wire [9:0]AD2;
  wire ADCLK_N;
  wire ADCLK_P;
  wire DA_CLK;
  wire [9:0]DA_DATA;
  wire DA_RESET;
  wire DA_SEL;
  wire DA_WRT;
  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire [19:0]adc_data;
  wire [19:0]dac_data;
  wire adc_clk;
 psk inst_psk(
     .clk(adc_clk),
     .rst_n(1),
     .shift_in(0),
     .wavein(adc_data[9:2]),
     .waveout(),
 
 
     // Ports for adc
     .ADC_CLK(adc_clk),
     .DAC_CLK()
     );
  ZYNQ_System ZYNQ_System_i
       (
        .adc_clk(adc_clk),
        .adc_data(adc_data),
        .dac_data(dac_data),
        .AD1(AD1),
        .AD2(AD2),
        .ADCLK_N(ADCLK_N),
        .ADCLK_P(ADCLK_P),
        .DA_CLK(DA_CLK),
        .DA_DATA(DA_DATA),
        .DA_RESET(DA_RESET),
        .DA_SEL(DA_SEL),
        .DA_WRT(DA_WRT),
        .DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb));
endmodule
