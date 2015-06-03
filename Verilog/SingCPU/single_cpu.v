`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:05:13 05/27/2015 
// Design Name: 
// Module Name:    single_cpu 
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
module single_cpu(input iclk,input [7:0] switch,input [3:0] button,
output led0,led1,led2,led3,led4,output reg [3:0] anode,output reg [7:0] segment
    );
wire clk;
wire mem_clk;
BUFG jh(clk,iclk);
wire [8:0]pc,next,pc_plus_4;
wire [3:0] button_out;
anti anti_jitter(clk,button[3:0],button_out[3:0]);
single_pc #(.N(9)) pc_reg(button_out[0],button_out[1],pc,next);
single_pc_plus_4 #(.N(9)) pc_4(next,pc_plus_4);
wire [31:0] instruction;
wire [5:0] opcode;
wire [4:0] rd,rs,rt;
wire [15:0] data;
wire [4:0] addr;
InstructionMem m(next,button_out[0],instruction);
assign opcode = instruction[31:26];
assign rd = instruction[15:11];
assign rs = instruction[25:21];
assign rt = instruction[20:16];
assign data = instruction[15:0];
assign addr = switch[4:0];
reg [15:0] count=0;
always @(posedge button_out[0])
	count<=count+1;
wire [1:0] ALUop;
wire RegDst,RegWrite,Branch,Jump,MemtoReg,MemRead,MemWrite,ALUsrc;
single_ctrl ctrl(opcode,ALUop,RegDst,RegWrite,Branch,Jump,MemtoReg,MemRead,MemWrite,ALUsrc,button_out[1]);
wire [31:0] R_data;
wire [4:0]w_addr;
wire [31:0] w_data;
wire [31:0] Rdata1,Rdata2;
single_mux #(.N(5)) cRegDst(rt,rd,RegDst,w_addr);
single_gpr RegFile(button_out[0],button_out[1],rs,rt,addr,w_addr,w_data,RegWrite,Rdata1,Rdata2,R_data); //hai you yi bu fen mei xie  
wire [31:0] extend_data;
single_signext ext(data,extend_data);
wire [31:0]data2;
single_mux #(.N(32)) cALUsrc(Rdata2,extend_data,ALUsrc,data2);
wire [5:0] func;
assign func = instruction[5:0];
wire [2:0] ALU_ctrl;
ALUctrl c(ALUop,func,ALU_ctrl);
wire [31:0] result;
wire zero;
single_ALU alu(ALU_ctrl,Rdata1,data2,result,zero);
wire [31:0] mem_out;
Memory m2(result,~button_out[0],Rdata2,mem_out,MemWrite);
single_mux #(.N(32)) cMemtoReg(result,mem_out,MemtoReg,w_data); 
wire isBranch;
assign isBranch = zero&Branch;
wire [8:0] t_branch;
single_add branch(pc_plus_4,extend_data,t_branch);
wire [8:0] pc_temp2;
single_mux #(.N(9)) cbranch(pc_plus_4,t_branch,isBranch,pc_temp2);
wire [25:0] j;
assign j = instruction[25:0];
single_mux #(.N(9)) jump(pc_temp2,j,Jump,pc);


//display
assign led0 = (opcode==6'b000000)?1:0;
assign led1 = (opcode==6'b100011)?1:0;
assign led2 = (opcode==6'b101011)?1:0;
assign led3 = (opcode==6'b000100)?1:0;
assign led4 = (opcode==6'b000010)?1:0;
reg [15:0] display;
always @(*) begin
	case(switch[7:6])
		2'b00: display<=R_data[15:0];
		2'b01: display<=R_data[31:16];
		2'b10: display<=pc;
		2'b11: display<=count;
	endcase
end
reg [31:0]cnt;
reg [3:0] code;
always @(posedge clk) begin	
	cnt<=cnt+1;
	case(cnt[15:14])
		2'b00: begin
			anode<=4'b1110;
			code<=display[3:0];
		end
		2'b01: begin
			anode<=4'b1101;
			code<=display[7:4];
		end
		2'b10: begin
			anode<=4'b1011;
			code<=display[11:8];
		end
		2'b11: begin
			anode<=4'b0111;
			code<=display[15:12];
		end
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
