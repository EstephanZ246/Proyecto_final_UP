/*module Fetch(input clk, reset, enabled, input [7:0] D, output reg[3:0]Q1,Q2);

    always @ (posedge clk, posedge reset)
    begin
        if (reset)
            Q1 <= 4'b0000;
        //   Q2 <= 4'b0000;
        else if (enabled)
            Q1 <= D[7:4];
          //  Q2 <= D[3:0];
    end
endmodule
*/

module Fetch(input wire clk,
             input wire reset,
             input wire enable,
             input wire [7:0] D,
             output wire [3:0] instr,
             output wire [3:0] oprnd);

  FFD1 U1(clk, reset, enable, D[7], instr[3]);
  FFD1 U2(clk, reset, enable, D[6], instr[2]);
  FFD1 U3(clk, reset, enable, D[5], instr[1]);
  FFD1 U4(clk, reset, enable, D[4], instr[0]);

  FFD1 U5(clk, reset, enable, D[3], oprnd[3]);
  FFD1 U6(clk, reset, enable, D[2], oprnd[2]);
  FFD1 U7(clk, reset, enable, D[1], oprnd[1]);
  FFD1 U8(clk, reset, enable, D[0], oprnd[0]);

endmodule
module FFD1(input wire clk,
           input wire reset,
           input wire enable,
           input wire D,
           output reg Q);

  always @(posedge clk or posedge reset)
    begin
      if (reset) Q <= 1'b0;
      else if (enable) Q <= D;
      else Q <= Q;
    end

endmodule
