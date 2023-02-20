`define ZERO 0
`define R_HI 24
`define R_LO 25

module constants(
    // R-type codes
    output wire [4:0] opcode_rtype,
    // # arithmetic
    output wire [4:0] funct_add,
    output wire [4:0] funct_sub,
    output wire [4:0] funct_mul,
    output wire [4:0] funct_div,
    // # logical
    output wire [4:0] funct_and,
    output wire [4:0] funct_or,

    // I-type codes
    // # arithmetic
    output wire [4:0] opcode_iadd,
    output wire [4:0] opcode_isub,
    // # logical
    output wire [4:0] opcode_iand,
    output wire [4:0] opcode_ior,

    // J-type codes
);

// R-type instructions (register)
assign opcode_rtype = 5'b00000;

// functions
assign funct_add = 5'b10000;
assign funct_sub = 5'b11000;
assign funct_mul = 5'b10100;
assign funct_div = 5'b11100;
assign funct_and = 5'b01000;
assign funct_or  = 5'b01100;

// I-type instructions (immediate)
assign opcode_iadd = 5'b10000;
assign opcode_isub = 5'b11000;
assign opcode_iand = 5'b01000;
assign opcode_ior  = 5'b01100;

endmodule