`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:04:50 05/21/2015 
// Design Name: 
// Module Name:    mux_3_1_5 
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
module mux_3_1_5(
		 input  		[4:0] n0,
		 input  		[4:0] n1,
		 input  		[4:0] n2,
		 output reg [4:0] res,
		 input  		[1:0] sel
   );

	always @(n0 or n1 or n2 or sel) begin
		case (sel)
			0: res <= n0;
			1: res <= n1;
			2: res <= n2;
		endcase
	end

endmodule
