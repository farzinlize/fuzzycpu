module regfile(
    //addresses and data buses
    input  [4:0]  addr_one,
    input  [4:0]  addr_two,
    input  [4:0]  addr_write,
    input  [31:0] data_write,
    output [31:0] data_one,
    output [31:0] data_two,

    //clock and write enable signals
    input clk, we
);

reg [31:0] registers [31:0];

assign data_one = registers[addr_one];
assign data_two = registers[addr_two];

always@(posedge clk) begin
    if(we) registers[addr_write] <= data_write;
end

endmodule