`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:40:25 05/17/2015 
// Design Name: 
// Module Name:    mux_3_1 
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
module mux_2_1(
    input n0,
    input n1,
    output res,
    input sel
   );

	assign res = sel == 0 ? n0 : n1;

endmodule
