`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:50:35 06/10/2015 
// Design Name: 
// Module Name:    reg_32_bit 
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
module reg_32_bit(clk,data_in,data_out
    );
input clk;
output reg [31:0] data_out;
input [31:0] data_in;

always @(posedge clk)
	data_out<=data_in;

endmodule

