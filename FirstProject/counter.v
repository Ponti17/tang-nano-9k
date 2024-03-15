module top
(
    input clk,
    input btn1,
    output [5:0] led
);

localparam WAIT_TIME_SHORT = 2000000;
localparam WAIT_TIME = 13500000;
reg [5:0] ledCounter = 0;
reg [23:0] clockCounter = 0;

always @(posedge clk) begin
    clockCounter <= clockCounter + 1;
    if (clockCounter == WAIT_TIME) begin
        clockCounter <= 0;
        ledCounter <= ledCounter + 1;
    end

    if (!btn1) begin
        ledCounter <= 0;
    end
end

assign led = ~ledCounter;
endmodule