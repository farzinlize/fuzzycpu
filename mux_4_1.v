`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:41:53 05/17/2015 
// Design Name: 
// Module Name:    mux_41 
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
module mux_4_1(
    input 		[31:0] n0,
    input 		[31:0] n1,
    input 		[31:0] n2,
    input 		[31:0] n3,
    output reg [31:0] res,
    input 		[1:0]  sel
   );
	
	always @(n0 or n1 or n2 or n3 or sel) begin
		
		case(sel)
			0: res <= n0;
			1: res <= n1;
			2: res <= n2;
			3: res <= n3;
		endcase
		
	end

endmodule
