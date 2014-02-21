////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.28xd
//  \   \         Application: netgen
//  /   /         Filename: mycpu_synthesis.v
// /___/   /\     Timestamp: Thu Feb 20 16:10:54 2014
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim mycpu.ngc mycpu_synthesis.v 
// Device	: xc3s100e-5-cp132
// Input file	: mycpu.ngc
// Output file	: C:\Xilinx\MyCPU\netgen\synthesis\mycpu_synthesis.v
// # of Modules	: 1
// Design Name	: mycpu
// Xilinx        : C:\Xilinx\14.2\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module mycpu (
  clk, point, isAuto, b2d
);
  input clk;
  output point;
  input isAuto;
  output [7 : 0] b2d;
  wire b2d_0_OBUF_8;
  wire b2d_1_OBUF_9;
  GND   XST_GND (
    .G(b2d_1_OBUF_9)
  );
  VCC   XST_VCC (
    .P(b2d_0_OBUF_8)
  );
  OBUF   b2d_7_OBUF (
    .I(b2d_1_OBUF_9),
    .O(b2d[7])
  );
  OBUF   b2d_6_OBUF (
    .I(b2d_1_OBUF_9),
    .O(b2d[6])
  );
  OBUF   b2d_5_OBUF (
    .I(b2d_1_OBUF_9),
    .O(b2d[5])
  );
  OBUF   b2d_4_OBUF (
    .I(b2d_1_OBUF_9),
    .O(b2d[4])
  );
  OBUF   b2d_3_OBUF (
    .I(b2d_1_OBUF_9),
    .O(b2d[3])
  );
  OBUF   b2d_2_OBUF (
    .I(b2d_1_OBUF_9),
    .O(b2d[2])
  );
  OBUF   b2d_1_OBUF (
    .I(b2d_1_OBUF_9),
    .O(b2d[1])
  );
  OBUF   b2d_0_OBUF (
    .I(b2d_0_OBUF_8),
    .O(b2d[0])
  );
endmodule


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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
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

