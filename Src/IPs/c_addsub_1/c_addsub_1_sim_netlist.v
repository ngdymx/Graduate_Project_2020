// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sun Jun 30 05:22:55 2019
// Host        : Beats running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/15195/Desktop/design3/design3/demo3/demo3.srcs/sources_1/ip/c_addsub_1/c_addsub_1_sim_netlist.v
// Design      : c_addsub_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub_1,c_addsub_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module c_addsub_1
   (A,
    B,
    CLK,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [7:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [7:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [8:0]S;

  wire [7:0]A;
  wire [7:0]B;
  wire CLK;
  wire [8:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_a_type = "1" *) 
  (* c_a_width = "8" *) 
  (* c_add_mode = "1" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "1" *) 
  (* c_b_value = "00000000" *) 
  (* c_b_width = "8" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "9" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_addsub_1_c_addsub_v12_0_11 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "1" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "1" *) 
(* C_A_WIDTH = "8" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "1" *) (* C_B_VALUE = "00000000" *) 
(* C_B_WIDTH = "8" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) 
(* C_OUT_WIDTH = "9" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_11" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module c_addsub_1_c_addsub_v12_0_11
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [7:0]A;
  input [7:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [8:0]S;

  wire \<const0> ;
  wire [7:0]A;
  wire [7:0]B;
  wire CLK;
  wire [8:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_a_type = "1" *) 
  (* c_a_width = "8" *) 
  (* c_add_mode = "1" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "1" *) 
  (* c_b_value = "00000000" *) 
  (* c_b_width = "8" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "9" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_addsub_1_c_addsub_v12_0_11_viv xst_addsub
       (.A(A),
        .ADD(1'b0),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_xst_addsub_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
iO2Bdkfy0dqqValMR4KhTWXpD0gDQF+kyoly3tZBTZTVs0CbWJ4Owhu4jxMCf8X2gbWR6iweF6Ks
B5dmLHZTDA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
dbcEbgyZfx3YLmYpvjegvD9sRQCV1qBv0GqFBvCakC3SMR/H82zqo5uv5MZldBGUVmNHnxF3Vejx
zSqxUKfTNc90CS6quuoQe0eeq3T5XSdgwbNtjPZKvJuJTmQKT96yB3CfQOz13fGjaLrn/8NBUBBh
I7OEoGGg7ADph9V3vRg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bD3a4YgAnaoJx9/hljj2C1rODcUhawTVE1gtdPkNj8/YjemaFM6/sF7Q0CXbDJ7a+OBrB5pUgj3O
Vesi4yVmFp+mGmFarftWat5KmZiP3RVWrXwdzMj+f8T7p+lE3iD4njqUxIUz0TsUaNvFeW0xVNNb
OwTEX04nyt5HrU82dltJCclpFxE6yrP9YvI7l328bphwnC63xxk8T3yXwCrvj3VrIYuDT2yMRxrB
TBCv/Fe2f07JQyV73J7+DGAeJG0B1dTHeu48auQT63g1HsYaUXREihEUKgZe70QlOqlPbrr6Quhx
2LXE8LSdCA+FbJ7LlQc/Sgasj3ZYjM5lhEKleQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GCfR7acMSeEtOw1DhZKkUXjh9Uw/vUar7CGDRG9rZcB9NFDtQTltJeuKjFg8eaeKH9HFBMryuX72
/tmzhtFaiSTjr2na4ncL2XV3QRXe7nQaiHdc7cKBcZDvdSSMzOSYcIxLunwLwQTLC7sCvINmlxO1
NXnYzJVL1xb9HP8QVnSYpo1p+gCXcRBZzrOjZjCUnl7F2t3ZZStSGjBEyXVLnV+ouU3+247oJAOa
kC7v+pOtG2ho4KclIg0MGijjPs+jyOFU+b5C+ufQp/zL9GiZ5waCjb/0Y1vkBc9jZKR7YRnv+ASG
ju1uP8oqEXR9742kXRnW4HkMKkCK1MLDgWYdqw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L+AGKmFZ1zoRJFd2cA+zxJhkgQ1R0aEjGQCGRFLNNhLHZXpzGDIjdSLjralBVRJ2rD6UcJutapF5
YaMoV9kphGGG2B07dxBuIimVjOxS3ZQJ7ru59ddfGBxUe9EHrv00Q5hTwoxig0lxqnmjSSnfsDeF
weTIqNnXkG5kqqezKC8a2FvUD5QWQBibhK69OAdmhhIOwZmpfvQKbEKgLX70BzcNlmLnttRL7G+q
XZ3fabZ42+JJHDLiIfveB3Gp2Lf2tzTH1u2xx5aEUr9154pnC9PWIwL3y3VBAT1oHR7ScdoGDOEy
HoYUiDibldOidIeKW0KrTeAIuBNmtM4R0R+RSA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
V5ClnklUs5Wo++EDemG/KeowZlAfqB8SUrvSxPQGrdIwGfUvoCajhuABAWdS/L/pQl7Eyz51aiuw
KzPMrWtQozAEITf1xzvzgKbWZqoi4PQD3rThywFsFq60u8DdvHYM/kEvit0cZVFvG8rAbtlseHLu
0vU1kbrNgxb3bxjOovg=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cRqAgScIUeXUwYGfCC0XDtpcc+mFNm3p8oTcFdtIU1nnlMagpBMqRm5ELc+m/Yw8jBwvcvt4tUFv
u/ypEEw+y12B+5Pr6SmnLJ+NVB3Q3Eyh4Q/d7p3jReIIsUxrlENpCTi4PVXMKr1B1Htzm8F8mXDq
y2UV+0SC+4yrBIntsdS0S8jPBERhfJhzNC5z38pPHANtM4wGGIUuKxIALLz1aq+2AjLbEgFHNrzw
2bJiDwRSTwrY4Yx2MSzYJk3O+cQBUe8nJDPx+aGEvDzQ4ZdJMNg2z+iaiE7OTaqK492Jb/1jvU0j
wlI+n35s2rrnc9QgfljdOJuueruPuYDi5vTTxA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
O9ynDHrhxISsBdqD8D6A37dRjN+Yp2sMFbox7AW9lIGVZ55mEzSrElxHpIeSA4QOgrgE0YyYFFl6
yprE5cCq0h1+A4wf+JghHXLBLJo7/Dal8BSKKhqoMiM14gSbvewHHhmSKovvTW3id4DoYWM1jHaz
cH/TdWlOAcRh3attH0P5/7crpZB7bP/tGw98i3VjFBD0EmsNO9bqHOsuXx5RQ4hQqKSBs9qDMv8+
9lUeiboM7mYisiO9t/lkNxNDsCtMMrp7Hgt8FO9VV8Jqdpz/VsK8J+2WZ15p9NcRY3xbU26nl7Nl
DRxo9kQez0G/s7ZroNCoxlvWuZ8rIioukc+4bg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hYgNIgFPNHNmejIUIyWymI4bC0MgiQdgewBrVsmwBwNj9nyd2Sc0Y5/Wme40jqYs/M0bz1M6r3NJ
HlRysvU8ZpG6L37IxgUPlgW2dVW/1gQ9r38BQgWHxCmXaSybfrUTjF0fDo1n2CaZJwUU0tH2ue7N
+g+DdrjK554caFbyj34iCAQgvI0PycYPcD2MEb45eMPUAtO8plza8CuAAKwzoTu0nrzjBaEAp/nO
A7w89Qdp1+dJaaRpIdT5QYt6WuWIuKVulyMJk+1pIkF7VSS72mJpJRLA7noy2UwzAIGxinq9eWjM
j9fUueR5fWAvcdY3iSvaAltGYkIUKZuYSj1eOg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8800)
`pragma protect data_block
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
2iMFVu03qRxF5ydkQlf0RKJZZq4nlw==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
