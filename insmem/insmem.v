module insmem (
    input  [31:0] address,
    output [31:0] instruction
);

parameter BIN = "instructions.bin";
parameter SIZE = 32;
reg [31:0] app [SIZE-1:0];

initial begin
    $readmemb(BIN, app);
end

assign instruction = app[address];

endmodule