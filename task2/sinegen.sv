module sinegen #(
        parameter   A_WIDTH = 8,
                    D_WIDTH = 8
)(
    // interface signals
    input   logic               clk,
    input   logic               rst,
    input   logic               en,
    input   logic [D_WIDTH-1:0] incr1,   // increment for addr counter
    input   logic [D_WIDTH-1:0] incr2,   // increment for addr counter
    output  logic [D_WIDTH-1:0] dout1,    // output data
    output  logic [D_WIDTH-1:0] dout2    // output data
);

    logic   [A_WIDTH-1:0]       address1;    // interconnect wire
    logic   [A_WIDTH-1:0]       address2;    // interconnect wire

counter addrCounter1 (
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (incr1),
    .count (address1)
);

rom sineRom (
    .clk (clk),
    .addr1 (address1),
    .addr2 (address2),
    .dout1 (dout1),
    .dout2 (dout2)
);

always_ff @(posedge clk)
    // output is synchronous
    address2 <= address1 + incr2;

endmodule
