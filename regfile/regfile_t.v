`timescale 1ns/1ns
`include "regfile.v"

module testbench;

reg [4:0] addr_1;
reg [4:0] addr_2;
reg [4:0] addr_w;
wire [31:0] data_1;
wire [31:0] data_2;
reg [31:0] data_w;
reg clk, we;

//instance of unit under test (UUT)
regfile uut(
.addr_one(addr_1),
.addr_two(addr_2),
.addr_write(addr_w),
.data_write(data_w),
.data_one(data_1),
.data_two(data_2),
.clk(clk),
.we(we)
);

initial begin
    $dumpfile("regfile.vcd");
    $dumpvars;

    clk=0;we=0;
    addr_1=0;addr_2=0;addr_w=0;data_w=0;#10;
    data_w=5;  addr_w=0;we=1; #5; clk=1; #5; clk=0;
    data_w=25; addr_w=1;we=1; #5; clk=1; #5; clk=0;
    data_w=35; addr_w=2;we=1; #5; clk=1; #5; clk=0;
    data_w=65; addr_w=3;we=1; #5; clk=1; #5; clk=0;
    we=0;#10;
    addr_1=1;addr_2=2;#10;
    addr_1=3;addr_2=4;#10;
    addr_1=5;addr_2=6;#10;

    $finish;
end

endmodule