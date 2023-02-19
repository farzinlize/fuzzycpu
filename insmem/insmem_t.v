`timescale 1ns/1ps
`include "insmem.v"

module testbench;

integer i;
reg [31:0] a;
wire [31:0] o;

insmem #(.SIZE(1024)) uut(.address(a), .instruction(o));

initial begin
    $dumpfile("insmem_t.vcd");
    $dumpvars;

    #10;
    for (i = 0; i<50; i=i+1) begin
        a=i;#10;
    end
    #100;
    $finish;
end

endmodule