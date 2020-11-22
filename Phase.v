// Univeridad del Valle de Guatemala
// Proyecto final, Procesador
// Estephan Portales
// 19826

//Declaramos puertos
module phase(clk,reset,Q);
//COnfiguramos puertos
input wire clk;
input wire reset;
output wire Q;
//llamamos instancia del flip flop tipo D para hacer el tipo t
    Flipflopsinenable U1(clk, reset, ~Q, Q);

endmodule


// flip-flop tipo D
//Declaracion de puertos
module Flipflopsinenable(clk, reset, D, Q);

//configuracion de puertos
input wire clk,reset, D;
output reg Q;
//salida según señal del reloj
  always @(posedge clk or posedge reset)
    begin
      if (reset)
        Q <= 1'b0;
      else
        Q <= D;
    end
endmodule
