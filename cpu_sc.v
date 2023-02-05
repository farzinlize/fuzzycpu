`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:33:28 05/17/2015 
// Design Name: 
// Module Name:    cpu_sc 
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
module cpu_sc(
		input inp_clk
   );

	alu_module cpu_alu (
    .num1    (regf_val1), 
    .num2    (alu_num2), 
    .res     (alu_res), 
    .alu_ctrl(alu_ctrl_line), 
    .zero    (alu_zero)
   );
	
	datamemory cpu_datam (
    .addr   (alu_res), 
    .val    (datam_res), 
    .wr_enb (cu_mem_write), 
    .wr_data(regf_val2), 
    .clk    (clk)
   );
	
	instructionmemory cpu_instm (
    .address(pc_curr), 
    .val    (instm_inst)
   );
	
	pc_module cpu_pc (
    .nxt_pc(pc_next), 
    .cur_pc(pc_curr), 
    .clk   (clk)
   );
	
	registerfile cpu_regf (
    .addr_1 (instm_inst[25:21]), 
    .addr_2 (instm_inst[20:16]), 
    .val_1  (regf_val1), 
    .val_2  (regf_val2), 
    .wr_enb (cu_reg_write), 
    .wr_addr(regf_wr_addr), 
    .wr_data(regf_wr_data), 
    .clk    (clk)
   );
	
	mux_4_1 pc_src_mux (
    .n0 (pc_curr_p4 + imm_extended), 
    .n1 (regf_val1), 
    .n2 ({pc_curr_p4[31:28], instm_inst[25:0], 2'b00}), 
	 .n3 (pc_curr_p4),
    .res(pc_next), 
    .sel(cu_pc_src)
   );
	
	mux_3_1_5 regf_wraddr_mux (
    .n0 (5'd31), 
    .n1 (instm_inst[20:16]), 
    .n2 (instm_inst[15:11]), 
    .res(regf_wr_addr), 
    .sel(cu_reg_dst)
   );
	
	mux_3_1 alu_num2_mux (
    .n0 (regf_val2), 
    .n1 (imm_extended), 
	 .n2 ({27'd0, instm_inst[10:6]}),		//shamt
    .res(alu_num2), 
    .sel(cu_b_src)
   );
	
	mux_3_1 regf_wb_mux (
    .n0 (datam_res), 
    .n1 (alu_res), 
    .n2 (pc_curr_p4), 
    .res(regf_wr_data), 
    .sel(cu_wb_src)
   );
	
	alu_ctrl_module alu_ctrl (
    .opcode(instm_inst[31:26]), 
    .func  (instm_inst[5:0]), 
    .res   (alu_ctrl_line), 
    .opsel (cu_op_sel)
   );
	
	imm_ext imm_extend (
    .inp(instm_inst[15:0]), 
    .res(imm_extended), 
    .sel(cu_ext_sel)
   );
	
	controlu_module cpu_ctrlu (
    .opcode(instm_inst[31:26]), 
    .func(instm_inst[5:0]), 
	 .zero(alu_zero),
    .cu_mem_write(cu_mem_write), 
    .cu_reg_write(cu_reg_write), 
    .cu_pc_src(cu_pc_src), 
    .cu_reg_dst(cu_reg_dst), 
    .cu_b_src(cu_b_src), 
    .cu_wb_src(cu_wb_src), 
    .cu_op_sel(cu_op_sel), 
    .cu_ext_sel(cu_ext_sel),
	 .cu_cont(cu_cont)
   );
	
	wire cu_cont;
	wire clk;
	assign clk = inp_clk && cu_cont;
	
	wire [31:0] pc_next;
	wire [31:0] pc_curr;
	wire [31:0] pc_curr_p4;
	
	assign pc_curr_p4 = pc_curr + 1;
	
	wire [31:0] instm_inst;
	
	wire [31:0] regf_val1;
	wire [31:0] regf_val2;
	wire        regf_wr_enb;
	wire [4:0]  regf_wr_addr;
	wire [31:0] regf_wr_data;
	
	wire [31:0] alu_res;
	wire [31:0] alu_num2;
	wire        alu_zero;
	wire [4:0]  alu_ctrl_line;
	
	wire [31:0] datam_res;
	
	wire [31:0] imm_extended;
	
	wire        cu_mem_write;
	wire        cu_reg_write;
	wire [1:0]  cu_pc_src;
	wire [1:0]  cu_reg_dst;
	wire [1:0]  cu_b_src;
	wire [1:0]  cu_wb_src;
	wire        cu_op_sel;
	wire        cu_ext_sel;
	
endmodule
