`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:28:26 05/17/2015 
// Design Name: 
// Module Name:    alu_module 
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
module alu_module(
		 input  signed     [31:0] num1,
		 input  signed     [31:0] num2,
		 output reg        [31:0] res,
		 
		 input             [4:0]  alu_ctrl,
		 
		 output reg               zero
    );
	 
	always @(num1 or num2 or alu_ctrl) begin
	
		case (alu_ctrl)
			 0: res <= num1 + num2;
			 1: res <= num1 - num2;
			 2: res <= num1 * num2;
		 	
			 3: res <= num1 << num2;
			 4: res <= num1 >> num2;
			 5: res <= num1 <<< num2;
			 6: res <= num1 >>> num2;
			
			 7: res <= num1 + num2;
			 
			 8: res <= num1;
			 
			 9: res <= num1 & num2;
			10: res <= num1 | num2;
			11: res <= num1 ^ num2;
			
			12: res <= num1 < num2 ? 1 : 0;
			
			13: res <= num1 + num2;
			14: res <= num1 - num2;
			15: res <= num1 * num2;
			
			16: res <= num1 + num2;
			17: res <= num1 + num2;
			
			18: zero <= num1 == num2 ? 1 : 0;
			19: zero <= num1 >  num2 ? 1 : 0;
			20: zero <= num1 <  num2 ? 1 : 0;
			21: zero <= num1 != num2 ? 1 : 0;
			22: zero <= num1 == 0    ? 1 : 0;
			
			23: res <= num1 + num2;
			24: res <= num1 + num2;
			
			25: res <= num1 & num2;
			26: res <= num1 | num2;
			27: res <= num1 ^ num2;
			
			28: res <= num1 < num2 ? 1 : 0;
		endcase
		
	end
endmodule
