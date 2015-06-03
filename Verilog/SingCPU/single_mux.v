`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:08:14 05/20/2015 
// Design Name: 
// Module Name:    single_mux 
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
module single_mux(A,B,Ctrl,S);
parameter N=1;
input wire [N-1:0] A,B;
input wire Ctrl;
output wire [N-1:0] S;
assign S=(Ctrl ==1'b0) ? A:B;

endmodule
