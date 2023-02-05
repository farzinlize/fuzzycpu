`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:00:54 05/18/2015
// Design Name:   alu_module
// Module Name:   D:/Verilog Workspace/SingleCycleCPU/alu_test.v
// Project Name:  SingleCycleCPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_test;

	// Inputs
	reg [31:0] num1;
	reg [31:0] num2;
	reg [5:0] alu_ctrl;

	// Outputs
	wire [31:0] res;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	alu_module uut (
		.num1(num1), 
		.num2(num2), 
		.res(res), 
		.alu_ctrl(alu_ctrl), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		num1 = 0;
		num2 = 0;
		alu_ctrl = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		num1 = -9;
		num2 = 3;
		
		alu_ctrl = 9;
		#69;
		
		alu_ctrl = 10;
		#69;
		
		alu_ctrl = 11;
		#69;
		
		alu_ctrl = 12;
		#69;
		
		alu_ctrl = 4;
		#69;
		
		alu_ctrl = 5;
		#69;
		
		alu_ctrl = 6;
		#69;
        
		// Add stimulus here

	end
      
endmodule

