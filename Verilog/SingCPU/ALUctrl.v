`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:31:44 05/27/2015 
// Design Name: 
// Module Name:    ALUctrl 
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
module ALUctrl(input [1:0] ALUop,input [5:0] func,output reg [2:0] ctrl
    );
always @(*) begin
	if(ALUop==2'b00)
		ctrl<=3'b010;
	else if(ALUop==2'b01)
		ctrl<=3'b110;
	else if(ALUop==2'b10)
		ctrl<=3'b010;
end
endmodule
