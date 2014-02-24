`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:43:36 02/20/2014
// Design Name:   mycpu
// Module Name:   C:/Xilinx/MyCPU/test.v
// Project Name:  MyCPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mycpu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk;
	reg isAuto;

	// Outputs
//	wire [7:0] b2d;
	wire [7:0] leds;
	wire point;
	reg write;
	wire [7:0] mAddr;
	reg nextStage;
	wire [2:0] stage;
	wire [`WORD_SIZE-1:0] outResult;
	// Instantiate the Unit Under Test (UUT)
	mycpu uut (
		.clk(clk), 
		.isAuto(isAuto),
		.nextStage(nextStage),
//		.b2d(b2d), 
		.leds(leds),
		.mAddr(mAddr),
		.stage(stage),
		.outResult(outResult)
	);
	
	initial begin
		// Initialize Inputs
		clk = 0;
		isAuto = 1;
		nextStage = 1;
		write = 0;
		// Wait 100 ns for global reset to finish
		
       
		// Add stimulus here

	end
      always begin
			#1 clk=~clk;
		end 
endmodule

