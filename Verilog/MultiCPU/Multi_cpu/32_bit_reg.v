`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:44:33 06/10/2015 
// Design Name: 
// Module Name:    32_bit_reg 
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
module 32_bit_reg(clk,data_in,data_out
    );
input clk;
output [31:0] data_out;
output [31:0] data_in;

always @(negedge clk)
	data_out<=data_in;

endmodule
