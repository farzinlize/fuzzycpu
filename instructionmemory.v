`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:23:15 05/13/2015 
// Design Name: 
// Module Name:    instructionmemory 
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
module instructionmemory(
		input  [31:0] address,
		output [31:0] val
	);

	reg [31:0] insts [5:0];
	
	initial begin
		$readmemb("D:\\insts.bin", insts);		
	end

	assign val = insts[address];
	
endmodule
