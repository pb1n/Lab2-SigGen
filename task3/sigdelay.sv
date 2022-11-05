module sigdelay #(
        parameter   A_WIDTH = 9,
                    D_WIDTH = 8
)(
    // interface signals
    input   logic               clk,
    input   logic               rst,
    input   logic               wr, // write enable
    input   logic               rd, // read enable
    input   logic [A_WIDTH-1:0] offset,   // address offset
    input   logic [D_WIDTH-1:0] mic_signal,   // incoming mic signal
    output  logic [D_WIDTH-1:0] delayed_signal   // outgoing mic signal
);

    logic   [A_WIDTH-1:0]       address1;    // interconnect wire
    logic   [A_WIDTH-1:0]       address2;    // interconnect wire

counter addrCounter1 (
    .clk (clk),
    .rst (rst),
    .en (1),
    .count (address1)
);

ram ramS(
    .clk (clk),
    .wr_en (wr),
    .rd_en (rd),
    .wr_addr (address1),
    .rd_addr (address2),
    .din (mic_signal),
    .dout (delayed_signal)
);

always_ff @(posedge clk)
    // output is synchronous
    address2 <= address1 + offset;

endmodule
