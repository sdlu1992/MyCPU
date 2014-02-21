`timescale 1ns / 1ps
`define WORD_SIZE 32
`define MEM_SIZE 256
`define TYPE_R 6'b000000
`define TYPE_ADDI 6'b001000
`define TYPE_ANDI 6'b001100
`define TYPE_ORI 6'b001101
`define TYPE_LW 6'b100011
`define TYPE_SW 6'b101011
`define TYPE_BEQ 6'b000100
`define TYPE_BNQ 6'b000101
`define TYPE_J 6'b000010
`define FUNC_ADD 6'b100000
`define FUNC_SUB 6'b100010
`define FUNC_AND 6'b100100
`define FUNC_OR 6'b100101
`define FUNC_SLT 6'b101010
`define FUNC_SLL 6'b000000
`define FUNC_SRL 6'b000010
`define FUNC_SRA 6'b000011
`define GET_OP 31:26
`define GET_FUNC 5:0
`define GET_RS 25:21
`define GET_RT 20:16
`define GET_RD 15:11
`define GET_SA 10:6
`define GET_IMM 15:0
`define GET_ADDR 25:0

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:39:40 02/19/2014 
// Design Name: 
// Module Name:    constant 
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
module constant(
    );


endmodule
