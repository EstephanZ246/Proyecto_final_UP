// Univeridad del Valle de Guatemala
// Proyecto final, Procesador
// Estephan Portales
// 19826


// Este módulo depende del estado de su enable, cuando este está arriba deja pasar los datos en la entrada

// Declaramos puertos
module Inputs(enabled, A, Y);
//Configuramos puertos


input enabled;
input [3:0] A;
output [3:0] Y;
// salida según enable
    assign Y = enabled ? A : 4'bz;

endmodule
