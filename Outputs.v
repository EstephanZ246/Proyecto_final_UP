// Univeridad del Valle de Guatemala
// Proyecto final, Procesador
// Estephan Portales
// 19826

// Este es tipo flip-flop tipo D el cual según la salida del reloj deja pasar los datos de la entrada a la salida.

// Declaramos puertos
module Outputs(clk, reset, enabled,D,Q);

//Configuramos puertos
input clk, reset, enabled;
input [3:0] D;
output reg [3:0] Q;
//Salida según señal del reloj y reset
    always @ (posedge clk, posedge reset)
        if (reset)
            Q <= 4'b0000;
        else if (enabled)
            Q <= D;

endmodule
