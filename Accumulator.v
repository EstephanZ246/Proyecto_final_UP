module Accumator (input clk, reset, enable, input [3:0] D, output reg [3:0] Q);

    always @ (posedge clk, posedge reset)
        if (reset)
            Q <= 4'b0000;
        else if (enable)
            Q <= D;

endmodule
