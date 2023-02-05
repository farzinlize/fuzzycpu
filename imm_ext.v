`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:10:26 05/18/2015 
// Design Name: 
// Module Name:    imm_ext 
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
module imm_ext(
		 input  		[15:0] inp,
		 output reg [31:0] res,
		 input 	      	 sel
	);

	always @(*) begin
		if (sel)
			res <= {{16{inp[15]}}, inp};
	end
	
endmodule
