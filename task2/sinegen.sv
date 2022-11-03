module sinegen #(
    parameter   A_WIDTH = 8,
                D_WIDTH = 8
)(
    input   logic               clk,
    input   logic               rst,
    input   logic               en,
    input   logic [A_WIDTH-1:0] shift,
    output  logic [D_WIDTH-1:0] dout1,
    output  logic [D_WIDTH-1:0] dout2
);

    logic   [A_WIDTH-1:0]       address;

counter addrCounter (
    .clk(clk),
    .rst(rst),
    .en(en),
    .incr(2),
    .count(address)
);

rom2ports sineRom (
    .clk(clk),
    .addr1(address),
    .addr2(address+shift),
    .dout1(dout1),
    .dout2(dout2)
);

endmodule