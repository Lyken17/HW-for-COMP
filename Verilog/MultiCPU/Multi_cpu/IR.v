`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:10:49 06/10/2015 
// Design Name: 
// Module Name:    IR 
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
module IR(clk,IRWrite,i_i,i_o
    );
input clk;
input IRWrite;
input [31:0]i_i;
output reg[31:0]i_o;
always @(negedge clk)
if(IRWrite==1)
	i_o<=i_i;
endmodule
