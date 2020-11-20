module Fetch(input clk, reset, enabled, input [7:0] D, output reg [7:4] Q1,output reg[3:0]Q2);

    always @ (posedge clk, posedge reset)
        if (reset)
            Q1 <= 4'b0000;
            Q2 <= 4'b0000;
        else if (enabled)
            Q1 <= D[7:4];
            Q2 <= D[3:0];
endmodule
