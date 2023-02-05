`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:17:34 05/13/2015 
// Design Name: 
// Module Name:    registerfile 
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
module registerfile(
		input  	  [4:0] addr_1,
		input  	  [4:0] addr_2,
		output     [31:0] val_1,
		output     [31:0] val_2,
		
		input  	  	  	   wr_enb,
		input  	  [4:0]  wr_addr,
		input  	  [31:0] wr_data,
		
		input  clk
	);

	reg [31:0] regs [31:0];
	
	initial begin
		regs[0] <= 0;
		regs[1] <= 9;
		regs[2] <= -3;
		regs[3] <= 0;
	end
	
	assign val_1 = regs[addr_1];
	assign val_2 = regs[addr_2];

	always @(posedge clk) begin
		if (wr_enb) begin
			regs[wr_addr] <= wr_data;
		end
	end
/*
	always @(negedge clk) begin
		val_1 <= regs[addr_1];
		val_2 <= regs[addr_2];
	end */

endmodule
