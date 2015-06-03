`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:07:09 05/28/2015 
// Design Name: 
// Module Name:    alu 
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
module alu(in_A,in_B,alu_ctl,res
    );
input [31:0] in_A,in_B;
input [1:0] alu_ctl;
output reg [31:0] res;
always @(alu_ctl or in_A or in_B)
	case(alu_ctl)
		2'b00 :res=in_A+in_B;
		2'b01 :res=in_A-in_B;
		2'b11 :res=in_A&in_B;
		2'b10 :res=~(in_A|in_B);
	endcase

endmodule
