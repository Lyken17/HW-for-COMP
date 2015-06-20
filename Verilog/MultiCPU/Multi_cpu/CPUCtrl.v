`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:41:38 06/03/2015 
// Design Name: 
// Module Name:    CPUCtrl 
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
module CPUCtrl(clk,opcode,MemRead,IRWrite,PCWrite,ALUOp,
ALUSrcA,ALUSrcB,IorD,PCSource,MemtoReg,RegWrite,RegDst,MemWrite,PCWriteCond,state
    );
input clk;
input [5:0] opcode;
output wire MemRead,IRWrite,PCWrite,ALUSrcA,IorD,PCWriteCond,MemWrite,MemtoReg,RegWrite,RegDst;
output wire [1:0] PCSource,ALUSrcB,ALUOp;
output reg [4:0]state=0;

always @(posedge clk) begin
	if(state == 0)
		state<=1;
	else if(state == 1) begin
		if (opcode == 6'b000010)
			state<=9;
		else if (opcode == 6'b000100) 
			state<=8;
		else if (opcode == 6'b000000)
			state<=6;
		else
			state<=2;
	end
	else if (state == 2&&opcode == 6'b 100011)
		state<=3;
	else if (state == 2&&opcode == 6'b 101011)
		state<=5;
	else if (state==3)
		state<=4;
	else if (state==6)
		state<=7;
	else
		state<=0;
end
assign MemRead = state==3 | state ==0;
assign IRWrite = state==0;
assign PCWrite = state==0 | state ==9;
assign ALUOp[0] = state ==8;
assign ALUOp[1] = state ==6|state==7;
assign ALUSrcA = state==8|state==6|state==2|state==3|state==7;
assign ALUSrcB[0] = state ==0|state==1|state==3;
assign ALUSrcB[1] = state ==1|state==2|state==3;
assign IorD = state==5|state==3;
assign PCSource[0] = state ==8;
assign PCSource[1] = state ==9;
assign RegDst = state==7;
assign RegWrite = state==4|state==7;
assign MemtoReg = state==4;
assign MemWrite = state==5;
assign PCWriteCond = state==8; 
endmodule
