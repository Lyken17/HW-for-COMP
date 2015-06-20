`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:01:23 06/10/2015 
// Design Name: 
// Module Name:    RegFiles 
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
module RegFiles(clk,rst,i_addr1,i_addr2,
i_addr3,i_wreg,i_wdata,i_wen,o_op1,o_op2,o_op3
    );
input clk,rst,i_wen;
input [4:0] i_addr1,i_addr2,i_addr3,i_wreg;
input [31:0] i_wdata;
output wire [31:0] o_op1,o_op2,o_op3;
reg [31:0] mem [31:0];
assign o_op1 = mem[i_addr1];
assign o_op2 = mem[i_addr2];
assign o_op3 = mem[i_addr3];
always @(posedge clk or posedge rst)
	if(rst == 1'b1) mem[0] = {32{1'b0}};
	else if (i_wen)
		mem[i_wreg] = (i_wreg =={5{1'b0}})?{32{1'b0}}:i_wdata;

endmodule
