`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:25:55 02/20/2014 
// Design Name: 
// Module Name:    MEMORY 
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
module MEMORY(
	input clk,write,
	input [7:0] address,
	input [`WORD_SIZE-1:0] data_in,
	output [`WORD_SIZE-1:0] data_out
);
reg [`WORD_SIZE-1:0] memory[`MEM_SIZE-1:0];
reg [7:0] addr;
initial
	begin
		
//		memory[0]=32'b000000_00000_00001_00010_00000_100000;
		memory[0]=32'b101011_00000_00001_0000000000001111;//sw
		memory[1]=32'b100011_00000_01111_0000000000001010;//lw
		memory[2]=32'b100011_00000_01111_0000000000001111;//lw
//		memory[0]=8'h00010
//		memory[1]=8'h22222222;
//		memory[2]=8'h33333333;
		memory[3]=8'h44444444;
		memory[4]=8'h55555555;
		memory[5]=8'h66666666;
		memory[6]=8'h77777777;
		memory[7]=8'h88888888;
		memory[8]=8'h99999999;
		memory[10]=8'hffffffff;
		memory[11]=8'hffffffff;
		memory[16]=8'h11111111;
	end
assign data_out = memory[address];
always @(posedge clk)
	begin
	addr[7:0] = address[7:0];
//	addr = addr +1;
	if(write)
		memory[address] = data_in;
	end
	
endmodule

