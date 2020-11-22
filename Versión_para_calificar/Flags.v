// Univeridad del Valle de Guatemala
// Proyecto final, Procesador
// Estephan Portales
// 19826


module Flags(input wire clk, reset, enable, input wire C,Z, output wire Q1,Q2);

  FFD U1(clk, reset, enable, C, Q1);
  FFD U2(clk, reset, enable, Z, Q2);

endmodule

// Flip-Flop complemento
module FFD(clk,reset,enable,D,Q);
// Configurar los puertos
input wire clk;
input wire reset;
input wire enable;
input wire D;
output reg Q;
// Salida según la señal del reloj y resetear cuando se desee
  always @(posedge clk or posedge reset)
    begin
      if (reset) Q <= 1'b0;
      else if (enable) Q <= D;
      else Q <= Q;
    end

endmodule
