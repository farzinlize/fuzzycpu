`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:19:36 05/18/2015 
// Design Name: 
// Module Name:    alu_ctrl_module 
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
module alu_ctrl_module(
		 input 		[5:0] opcode,
		 input  		[5:0] func,
		 
		 output reg [4:0] res,
		 
		 input  				opsel
   );
	
	always @(*) begin
		if (opsel)
			case (func)
				6'b100000: res <= 0;		// add
				6'b100010: res <= 1;		// sub
				6'b100101: res <= 2;		// mul
				
				6'b000111: res <= 3;		// sl
				6'b000110: res <= 4;		// sr
				6'b110100: res <= 5;		// sla
				6'b110110: res <= 6;		// sra
				
				6'b000001: res <= 7;		// jr
				
				6'b000011: res <= 8;		// mov
				
				6'b111000: res <= 9;		// and
				6'b111001: res <= 10;	// or
				6'b111010: res <= 11;	// xor
				
				6'b110011: res <= 12;	// slt
			endcase
		else 
			case (opcode)
				6'b100011: res <= 13;	// addi
				6'b110001: res <= 14;	// subi
				6'b111000: res <= 15;	// muli
				
				6'b010001: res <= 16;	// lw
				6'b011001: res <= 17;	// sw
				
				6'b100000: res <= 18;	// beq
				6'b100010: res <= 19;	// brg
				6'b100101: res <= 20;	// brl
				6'b000111: res <= 21;	// bne
				6'b000110: res <= 22;	// brz
				
				6'b110100: res <= 23;	// jmp
				6'b111110: res <= 24;	// jal
				
				6'b001111: res <= 25;	// andi
				6'b001110: res <= 26;	// ori
				6'b001100: res <= 27;	// xori
				
				6'b001000: res <= 28;	// slti
			endcase
	end

endmodule
