// Univeridad del Valle de Guatemala
// Proyecto final, Procesador
// Estephan Portales
// 19826


// Este es un flip-flop tipo D, pero la salida la dividimos es el operand e instructions

// Declaramos entradas y salidas
module Fetch(clk,reset,enable, D,instr,oprnd);
// Configuramos los puertos
input wire clk;
input wire reset;
input wire enable;
input wire [7:0] D;
output wire [3:0] instr;
output wire [3:0] oprnd;
// INSTANCIAS para el flip-flop tipo D
  FFD1 U1(clk, reset, enable, D[7], instr[3]);
  FFD1 U2(clk, reset, enable, D[6], instr[2]);
  FFD1 U3(clk, reset, enable, D[5], instr[1]);
  FFD1 U4(clk, reset, enable, D[4], instr[0]);

  FFD1 U5(clk, reset, enable, D[3], oprnd[3]);
  FFD1 U6(clk, reset, enable, D[2], oprnd[2]);
  FFD1 U7(clk, reset, enable, D[1], oprnd[1]);
  FFD1 U8(clk, reset, enable, D[0], oprnd[0]);

endmodule
//Un flip flop tipo D para complementar el Fetch
module FFD1(clk,reset,enable,D,Q);
// Configuramos los puertos
input wire clk;
input wire reset;
input wire enable;
input wire D;
output reg Q;
// Salida según el valor de reloj y un reset para volver el valor de salida 0
  always @(posedge clk or posedge reset)
    begin
      if (reset) Q <= 1'b0;
      else if (enable) Q <= D;
      else Q <= Q;
    end

endmodule
