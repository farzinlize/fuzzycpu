`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:13:19 05/17/2015 
// Design Name: 
// Module Name:    pc_module 
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
module pc_module(
		 input  [31:0] nxt_pc,
		 output [31:0] cur_pc,
		 
		 input clk
	);

	reg [31:0] pc;
	
	assign cur_pc = pc;
	
	initial begin
		pc = 0;
	end
	
	always @(negedge clk) begin
		pc <= nxt_pc;
	end

endmodule
