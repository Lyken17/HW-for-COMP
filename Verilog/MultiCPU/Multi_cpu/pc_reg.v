`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:15:20 06/10/2015 
// Design Name: 
// Module Name:    pc_reg 
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
module pc_reg(PCWrite,clk,pc_in,pc_out
    );
input PCWrite;
input clk;
output reg[8:0] pc_out;
input [8:0] pc_in;
always @(posedge clk)
if(PCWrite)
	pc_out<=pc_in;
endmodule
