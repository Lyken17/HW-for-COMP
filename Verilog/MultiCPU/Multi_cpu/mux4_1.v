`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:37:01 06/03/2015 
// Design Name: 
// Module Name:    mux4_1 
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
module mux4_1(A,B,C,D,Ctrl,S
    );
parameter N=32;
input wire [N-1:0] A,B,C,D;
input wire [1:0] Ctrl;
output reg [N-1:0] S;
always@(*)
case(Ctrl)
	2'b00: S<=A;
	2'b01: S<=B;
	2'b10: S<=C;
	2'b11: S<=D;
endcase
endmodule
