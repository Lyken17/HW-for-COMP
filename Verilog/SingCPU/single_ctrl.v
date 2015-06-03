`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:03 05/20/2015 
// Design Name: 
// Module Name:    single_ctrl 
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
module single_ctrl(OP,ALUop,RegDst,RegWrite,Branch,Jump,MemtoReg,MemRead,MemWrite,ALUsrc,rst
    );
input wire rst;
input [5:0] OP;
output wire [1:0] ALUop;
output RegDst,RegWrite,ALUsrc,Branch,Jump;
output MemtoReg,MemRead,MemWrite;
wire R,LW,SW,BEQ,J;
assign R = ~OP[0]&~OP[1]&~OP[2]&~OP[3]&~OP[4]&~OP[5];
assign LW = OP[0]&OP[1]&~OP[2]&~OP[3]&~OP[4]&OP[5];
assign SW = OP[0]&OP[1]&~OP[2]&OP[3]&~OP[4]&OP[5];
assign BEQ = ~OP[0]&~OP[1]&OP[2]&~OP[3]&~OP[4]&~OP[5];
assign J=~OP[0]&OP[1]&~OP[2]&~OP[3]&~OP[4]&~OP[5];

assign ALUop = ~rst&{R,BEQ};
assign RegDst = ~rst&R;
assign RegWrite = ~rst&(R|LW);
assign Branch = ~rst&BEQ;
assign ALUsrc = ~rst&(LW|SW);
assign MemtoReg = ~rst&LW;
assign MemRead = ~rst&LW;
assign MemWrite = ~rst&SW;
assign Jump=~rst&J;
endmodule

