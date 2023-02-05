`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:34 05/13/2015 
// Design Name: 
// Module Name:    datamemory 
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
module datamemory(
		input  [31:0] addr,
		output [31:0] val,

		input 		 wr_enb,
		input [31:0] wr_data,

		input clk
	);

	reg [31:0] datas [4:0];
	
	initial begin
		$readmemb("datas.bin", datas);
	end
	
	assign val = datas[addr];
	
	always @(posedge clk) begin
		if (wr_enb)
			datas[addr] <= wr_data;
	end
	
endmodule
