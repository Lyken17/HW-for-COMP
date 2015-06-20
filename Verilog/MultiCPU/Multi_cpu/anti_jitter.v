`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:11:11 06/10/2015 
// Design Name: 
// Module Name:    anti_jitter 
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
module anti_jitter(input wire clk,
input [3:0] button,
output reg [3:0] button_out
    );
reg [31:0] counter;
reg [3:0] btn_temp;
always @(posedge clk) begin
	btn_temp<=button;
	if(btn_temp!=button) counter<=32'h00000000;
	else if(counter<100000) counter<=counter+1;
	else 
		button_out<=button;
end
endmodule