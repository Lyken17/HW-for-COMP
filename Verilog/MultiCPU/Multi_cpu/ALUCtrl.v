`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:03:34 06/17/2015 
// Design Name: 
// Module Name:    ALUCtrl 
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
module ALUCtrl(func,ALUop,ctrl
    );
input [5:0] func;
input [1:0] ALUop;
output reg [1:0] ctrl;
always @(func,ALUop) begin
	if(ALUop!=2'b10)
		ctrl<=2'b00;
	else if(func==6'b100000)
		ctrl<=2'b00;
	else if(func==6'b100010)
		ctrl<=2'b01;
	else if(func==6'b100100)
		ctrl<=2'b10;
	else if(func==6'b100111)
		ctrl<=2'b11;
end

endmodule
