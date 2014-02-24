`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:18 02/19/2014 
// Design Name: 
// Module Name:    mycpu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mycpu(
	input clk,
	input isAuto,
	input nextStage,
	input [4:0] index,
	output [7:0] b2d,
	output [7:0] leds,
	output [7:0] mAddr,
	output [2:0] stage,
	output [`WORD_SIZE-1:0] outResult
   );
//reg [31:0] result;
wire write;
//wire [`WORD_SIZE-1:0] mAddr;
wire [`WORD_SIZE-1:0] mDataIn;
wire [`WORD_SIZE-1:0] mDataOut;
initial
	begin
		
	end

MEMORY M0(.clk(clk),.write(write),
	.address(mAddr),
	.data_in(mDataIn),
	.data_out(mDataOut)
	);
	
STAGES stages(
	.clk(clk),.write(write),
	.isAuto(isAuto),
	.nextStage(nextStage),
	.ins_addr(mAddr),
	.data_in(mDataOut),
	.data_out(mDataIn),
	.b2ds(b2d),
	.leds(leds),
	.stageOut(stage),
	.outResult(outResult),
	.index(index)
);
//	//7∂Œ“Î¬Î∆˜
//	always @(*)
//	case(result)
//		0: b2d = 7'b0000001;
//		1: b2d = 7'b1001111;
//		2: b2d = 7'b0010010;
//		3: b2d = 7'b0000110;
//		4: b2d = 7'b1001100;
//		5: b2d = 7'b0100100;
//		6: b2d = 7'b0100000;
//		7: b2d = 7'b0001111;
//		8: b2d = 7'b0000000;
//		9: b2d = 7'b1000000;	
//		default: b2d = 7'b1111111;
//	endcase 

endmodule
