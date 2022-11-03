module sigdelay #(
    parameter   A_WIDTH = 8,
                D_WIDTH = 8
)(
    input   logic [D_WIDTH-1:0] mic_signal,
    input   logic               clk,
    input   logic               rst,
    input   logic               en,
    input   logic               wr,
    input   logic               wd,
    input   logic [A_WIDTH-1:0] offset,
    output  logic [D_WIDTH-1:0] delayed_signal
);

    logic   [A_WIDTH-1:0]       address;

counter addrCounter (
    .clk(clk),
    .rst(rst),
    .en(en),
    .incr(1),
    .count(address)
);

ram2ports audioRam (
    .clk(clk),
    .wr_enable(wr),
    .rd_enable(rd),
    .wr_addr(address),
    .rd_addr(address-offset),
    .din(mic_signal),
    .dout(delayed_signal)
);

endmodule
