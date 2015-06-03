`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:21:26 05/20/2015 
// Design Name: 
// Module Name:    single_add 
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
module single_add(i_op1,i_op2,o_out
    );
input [31:0] i_op1,i_op2;
output [31:0] o_out;
assign o_out=i_op1+i_op2;

endmodule
