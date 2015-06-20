`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:02:42 06/10/2015 
// Design Name: 
// Module Name:    top 
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
module top(iclk,button,switch,anode,segment,led0,led1,led2,led3,led4,led7,led6
    );
input iclk;
input [3:0] button;
input [7:0] switch;
output reg[3:0] anode;
output reg[7:0] segment;
output led0,led1,led2,led3,led4,led7,led6;
wire MemRead,IRWrite,PCWrite,PCWriteCond,MemtoReg,RegWrite,RegDst,ALUSrcA,MemWrite,IorD;
wire [1:0] ALUop,ALUSrcB,PCSource;
wire zero,clk;
reg [15:0] display;
reg [3:0] code;
reg[31:0] count;
reg [31:0] clk_count;
wire [4:0] state;
wire [31:0] result;
wire [8:0] pc_in,pc_out;
wire [8:0] addr_in;
wire [31:0] R_data1,R_data2,R_data3,MemOut,instruction,MDR_out,wdata,ALUOut,AOut,BOut,ALUA,ALUB;
wire [5:0] opcode,func;
wire [4:0] rs,rt,rd,waddr,R_addr;
wire [16:0] addr;
reg [1:0] type;
reg [3:0] cycle;
wire [1:0]alu_ctrl;
wire [3:0] button_out;
assign R_addr = switch[4:0];
anti_jitter anti(iclk,button,button_out);
assign clk=switch[5]?count[26]:button_out[0];
CPUCtrl ctrl(clk,opcode,MemRead,IRWrite,PCWrite,ALUop,ALUSrcA,ALUSrcB,IorD,PCSource,MemtoReg,RegWrite,RegDst,MemWrite,PCWriteCond,state);

pc_reg pc_r(PCWrite,clk,pc_in,pc_out);
mux2_1 #(.N(9)) pc_or_addr(pc_out,result,IorD,addr_in);
Mem Memo(addr_in,R_data2,clk,MemWrite,MemOut);
IR instructionRegister(clk,IRWrite,MemOut,instruction);
reg_32_bit MDR(clk,MemOut,MDR_out);
assign opcode = instruction[31:26];
assign rs = instruction[25:21];
assign rt = instruction[20:16];
assign rd = instruction[15:11];
assign addr = instruction[15:0];
assign func = instruction[5:0];
assign led7=~switch[5];
assign led6=switch[5];
mux2_1 #(.N(5))w_addr(rt,rd,RegDst,waddr);

mux2_1 #(.N(32))w_data(result,MDR_out,MemtoReg,wdata);
RegFiles regFiles(clk,rst,rs,rt,R_addr,waddr,wdata,RegWrite,R_data1,R_data2,R_data3);
reg_32_bit A(clk,R_data1,AOut);
reg_32_bit B(clk,R_data2,BOut);

mux2_1 #(.N(32))aluasrc(pc_out,AOut,ALUSrcA,ALUA);
mux4_1 #(.N(32))alubsrc(BOut,4'b0001,addr,addr,ALUSrcB,ALUB);
wire [1:0] ctrl2;
ALUCtrl A_Ctrl(func,ALUop,ctrl2);
alu ALU_A(ALUA,ALUB,ctrl2,result,zero);
mux4_1 #(.N(9))pcchoose(result,ALUOut,addr,1'b0,PCSource,pc_in);
//
always@(posedge clk)
	clk_count<=clk_count+1;
always @(opcode) begin
	if(opcode==6'b000000)
		type<=0;
	else if(opcode==6'b000010)
		type<=2;
	else
		type<=1;
end
always @(state) begin
	if(state==0)
		cycle<=0;
	else if(state==1)
		cycle<=1;
	else if(state==9|state==8|state==6|state==2)
		cycle<=2;
	else if(state==7|state==3|state==5)
		cycle<=3;
	else if(state==4)
		cycle<=4;
end
assign led0 = state==0;
assign led1 = state==1;
assign led2 = state==9|state==8|state==6|state==2;
assign led3 = state==7|state==3|state==5;
assign led4 = state==4;
//display
always @(switch[7:6]) begin
	case(switch[7:6])
		2'b00:display<=R_data3[15:0];
		2'b01:display<=R_data3[31:16];
		2'b10:begin display[15:12]<=clk_count[3:0];display[11:8]<=type;display[7:4]<=cycle;display[3:0]<=pc_out;end
		//2'b10:display<=ALUA;
		2'b11:display<=ALUB;
	endcase
end
always @(posedge iclk)
	count<=count+1;
always @(count[17:16]) begin
	case(count[17:16])
		2'b00: begin anode = 4'b1110; code<=display[3:0]; end
		2'b01: begin anode = 4'b1101; code<=display[7:4]; end
		2'b10: begin anode = 4'b1011; code<=display[11:8]; end
		2'b11: begin anode = 4'b0111; code<=display[15:12]; end
	endcase
	case(code)
		4'b0000: segment<=8'b11000000;
		4'b0001: segment<=8'b11111001;
		4'b0010: segment<=8'b10100100;
		4'b0011: segment<=8'b10110000;
		4'b0100: segment<=8'b10011001;
		4'b0101: segment<=8'b10010010;
		4'b0110: segment<=8'b10000010;
		4'b0111: segment<=8'b11111000;
		4'b1000: segment<=8'b10000000;
		4'b1001: segment<=8'b10010000;
		4'b1010: segment<=8'b10001000;
		4'b1011: segment<=8'b10000011;
		4'b1100: segment<=8'b11000110;
		4'b1101: segment<=8'b10100001;
		4'b1110: segment<=8'b10000110;
		4'b1111: segment<=8'b10001110;
		default: segment<=8'b11111111;
	endcase
end
endmodule
