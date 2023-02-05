`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:22:53 05/21/2015
// Design Name:   cpu_sc
// Module Name:   D:/Verilog Workspace/SingleCycleCPU/cpu_whole_test.v
// Project Name:  SingleCycleCPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu_sc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu_whole_test;

	// Inputs
	reg inp_clk;

	// Instantiate the Unit Under Test (UUT)
	cpu_sc uut (
		.inp_clk(inp_clk)
	);

	initial begin
		// Initialize Inputs
		inp_clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always begin inp_clk = ~inp_clk; #86; end
      
endmodule

