`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:53:56 02/20/2014 
// Design Name: 
// Module Name:    STAGES 
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
module STAGES(
	input clk,
	output write,
	input isAuto,
	input nextStage,
	output [7:0] ins_addr,
	input [`WORD_SIZE-1:0] data_in,
	output [`WORD_SIZE-1:0] data_out,
//	output [7:0] b2d,
//	output [7:0] leds,
	output [2:0] stageOut,
	output [`WORD_SIZE-1:0] outResult
    );

reg test ;
reg [7:0] pc;
//reg [7:0] pc_back;
reg [7:0] addr;
reg [2:0] stage;
reg [2:0] stageAuto;
reg [2:0] stageHM;
reg [1:0] mWrite;
reg [`WORD_SIZE-1:0] ins;
reg [`WORD_SIZE-1:0] dataOut;
reg [`WORD_SIZE-1:0] cRegs[16:0];
reg [4:0] rs;
reg [4:0] rt;
reg [4:0] rd;
reg [4:0] sa;
reg [`WORD_SIZE-1:0] immResult;
reg [`GET_ADDR] address;

//assign leds[7:0] = data_in[7:0];
assign ins_addr[7:0] = addr[7:0];
assign write = mWrite;
assign stageOut[2:0] = stageAuto[2:0];
assign outResult = cRegs[15];
assign data_out[15:0] = dataOut[15:0];
initial begin
pc = 8'h00;
//pc_back = 8'h00;
addr = 8'h00;
stage = 0;
stageHM = 0;
stageAuto = 0;
mWrite = 0;

ins = data_in; 
cRegs[0] = 1;
cRegs[1] = 5;
cRegs[2] = 2;
cRegs[3] = 3;
cRegs[4] = 4;
cRegs[5] = 5;
cRegs[6] = 6;
cRegs[7] = 7;
cRegs[8] = 8;
cRegs[9] = 9;
cRegs[10] = 10;
cRegs[11] = 11;
cRegs[15] = 14;
cRegs[16] = 9;
end

//ins_addr[`WORD_SIZE-1:0] = 8'h00000000;

//因为reg只能在一个always里被赋值，所以要如此处理
always @(stageAuto or stageHM)
begin
	stage = (isAuto==1)?stageAuto:stageHM;
end

always @(posedge clk)
begin
	//if(isAuto) begin
		stageAuto = (stageAuto==4)?1:(stageAuto + 1);
//	end
end

always @(posedge nextStage)
begin
	stageHM = (stageHM==4)?1:(stageHM + 1);
end

always @(stage)
begin
	if(stage == 1) begin
		mWrite = 0;
		addr = pc;
		ins = data_in;
		pc = pc + 1;
	end
	if(stage == 2) begin
		case(ins[`GET_OP])
		`TYPE_R: begin
			rt = ins[`GET_RT];
			rd = ins[`GET_RD];
			case(ins[`GET_FUNC])
			`FUNC_ADD,`FUNC_SUB,`FUNC_AND,`FUNC_OR,`FUNC_SLT:
			begin
				rs = ins[`GET_RS];	
			end
			`FUNC_SLL,`FUNC_SRL,`FUNC_SRA:
			begin
				sa = ins[`GET_SA];
			end
			endcase
		end
		
		`TYPE_I:begin
			rs = ins[`GET_RS];
			rt = ins[`GET_RT];
			immResult[`GET_IMM] = ins[`GET_IMM];
		end
		
		`TYPE_J:begin
			address = ins[`GET_ADDR];
		end
		endcase
	end
	if(stage == 3) begin
		case(ins[`GET_OP])
		`TYPE_R: begin
			case(ins[`GET_FUNC])
			`FUNC_ADD:begin
				cRegs[rd] = cRegs[rs] + cRegs[rt];
			end
			`FUNC_SUB:begin
				cRegs[rd] = cRegs[rs] - cRegs[rt];
			end
			`FUNC_AND:begin
				cRegs[rd] = cRegs[rs] & cRegs[rt];
			end
			`FUNC_OR:begin
				cRegs[rd] = cRegs[rs] | cRegs[rt];
			end
			`FUNC_SLT:begin
				if(cRegs[rs]<cRegs[rt])
					cRegs[rd] = 1;
				else
					cRegs[rd] = 0;
			end
			endcase
		end
//		`TYPE_ADDI: begin
//			
//			immResult[`WORD_SIZE-1:16] = (immResult[15] == 1)?4'hffff:4'h0000;
//			cRegs[rt] = cRegs[rs] + immResult;
//		end
//		`TYPE_ANDI: begin
//			
//			immResult[`WORD_SIZE-1:16] = 4'h0000;
//			cRegs[rt] = cRegs[rs] & immResult;
//		end
//		`TYPE_ORI: begin
//			
//			immResult[`WORD_SIZE-1:16] = 4'h0000;
//			cRegs[rt] = cRegs[rs] | immResult;
//		end
		`TYPE_LW: begin
			immResult[`WORD_SIZE-1:16] = (immResult[15] == 1)?4'hffff:4'h0000;
//			pc_back = pc;
			addr = cRegs[rs][7:0] + immResult[7:0];
			
		end
		`TYPE_SW: begin
			immResult[`WORD_SIZE-1:16] = (immResult[15] == 1)?4'hffff:4'h0000;
//			pc_back = pc;
			addr = cRegs[rs][7:0] + immResult[7:0];
			dataOut = cRegs[rt];
			
			mWrite = 1;
		end
//		`TYPE_BEQ: begin
//		end
//		`TYPE_BNE: begin
//		end
		endcase
	end
	if(stage == 4) begin
	case(ins[`GET_OP])
	`TYPE_LW: begin
		cRegs[rt] = data_in;
//		pc = pc_back;
	end
	`TYPE_SW: begin
		cRegs[15] = cRegs[rt];
		//mWrite = 0;
//		pc = pc_back;
	end
	endcase
	end
end
endmodule