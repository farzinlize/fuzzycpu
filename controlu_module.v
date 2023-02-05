`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:34:52 05/17/2015 
// Design Name: 
// Module Name:    controlu_module 
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
module controlu_module(
		input  	  [5:0]  opcode,
		input      [5:0]  func,
		input 				zero,
		output reg  		cu_mem_write,
		output reg        cu_reg_write,
		output reg [1:0]  cu_pc_src,
		output reg [1:0]  cu_reg_dst,
		output reg [1:0]  cu_b_src,
		output reg [1:0]  cu_wb_src,
		output reg        cu_op_sel,
		output reg        cu_ext_sel,
		output 				cu_cont
	);
	
	reg [11:0] signals;
	
	assign cu_cont = (opcode != 0) || (func != 0);
	
	always @(*) begin
	
		if (opcode == 0)
			case (func)
				6'b100000: signals = 12'b010100101110;
				6'b100010: signals = 12'b010100101110;
				6'b100101: signals = 12'b010100101110;
				
				6'b000111: signals = 12'b010110101110;
				6'b000110: signals = 12'b010110101110;
				6'b110100: signals = 12'b010110101110;
				6'b110110: signals = 12'b010110101110;
				
				6'b000001: signals = 12'b010110100100;
				
				6'b000011: signals = 12'b010110011110;
				
				6'b111000: signals = 12'b010100101110;
				6'b111001: signals = 12'b010100101110;
				6'b111010: signals = 12'b010100101110;
				
				6'b110011: signals = 12'b010100101110;
			endcase
		else
			case (opcode)
			
				6'b100011: signals = 12'b100101011110;
				6'b110001: signals = 12'b100101011110;
				6'b111000: signals = 12'b100101011110;
				
				6'b010001: signals = 12'b100001011110;
				6'b011001: signals = 12'b100001011101;
				
				6'b100000: signals = 12'b100000000000;
				6'b100010: signals = 12'b100000000000;
				6'b100101: signals = 12'b100000000000;
				6'b100111: signals = 12'b100000000000;
				6'b100110: signals = 12'b100000000000;
				
				6'b110100: signals = 12'b000000001000;
				6'b111110: signals = 12'b001000001010;
				
				6'b001111: signals = 12'b100101101110;
				6'b001110: signals = 12'b100101101110;
				6'b001100: signals = 12'b100101101110;
				
				6'b001000: signals = 12'b100101101110;
			
			endcase
		
		if (opcode == 6'b100000 || opcode == 6'b100010 || opcode == 6'b100101 || opcode == 6'b000111 || opcode == 6'b000110)
			if (zero)
				cu_pc_src <= 2'b00;
			else
				cu_pc_src <= 2'b11;
		else
			cu_pc_src    <= {signals[3], signals[2]}; 
		
		cu_mem_write <= signals[0];
		cu_reg_write <= signals[1];
		cu_reg_dst   <= {signals[5], signals[4]};
		cu_b_src     <= {signals[7], signals[6]};
		cu_wb_src    <= {signals[9], signals[8]};
		cu_op_sel    <= signals[10];
		cu_ext_sel   <= signals[11];
	
	end


endmodule
