module phase(input wire clk,
            input wire reset,
            output wire Q);

    Flipflopsinenable U1(clk, reset, ~Q, Q);

endmodule


module Flipflopsinenable(input wire clk, reset, D, output reg Q);

  always @(posedge clk or posedge reset)
    begin
      if (reset)
        Q <= 1'b0;
      else
        Q <= D;
    end
endmodule
