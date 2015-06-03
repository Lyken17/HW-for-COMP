`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:29:59 05/27/2015 
// Design Name: 
// Module Name:    single_ALU 
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
module single_ALU(
input [2:0]operation,
input [31:0] A,
input [31:0] B,
output reg [31:0] result,
output zero
);
wire [31:0] result_and,result_or,result_add,result_sub,result_nor,result_slt,result_xor,result_srl;
parameter one =32'h00000001,zero_0=32'h00000000;
assign result_and=A&B;
assign result_or=A|B;
assign result_add=A+B;
assign result_sub=A-B;
assign result_nor=~(A|B);
assign result_slt=(A<B)?one:zero_0;
assign result_xor=A^B;
assign result_srl=B>>1;


always @(*) begin
	case(operation)
		3'b000: result<=result_and;
		3'b001: result<=result_or;
		3'b010: result<=result_add;
		3'b110: result<=result_sub;
		3'b100: result<=result_nor;
		3'b111: result<=result_slt;
		3'b011: result<=result_xor;
		3'b101: result<=result_srl;
		default: result<=result_add;
	endcase
end

assign zero=(result==0)?1:0;
endmodule
