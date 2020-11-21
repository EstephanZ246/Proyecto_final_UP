//módulo en prueba

module Flags(input wire clk, reset, enable, input wire C,Z, output wire Q1,Q2);
/*
    always @ (posedge clk, posedge reset)
        if (reset)
            Q1 <= 1'b0;
          //  Q2 <= 1'b0;
        else if (enabled)
            Q1 <= C;
        //    Q2 <= Z;

endmodule
*/

  FFD U1(clk, reset, enable, C, Q1);
  FFD U2(clk, reset, enable, Z, Q2);

endmodule
module FFD(input wire clk,
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
