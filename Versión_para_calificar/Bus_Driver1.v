// Univeridad del Valle de Guatemala
// Proyecto final, Procesador
// Estephan Portales
// 19826


// este módulo deja pasar los datos mediante un enable, no depende del reloj
module Bus_driver2(enabled,A, Y);


input enabled;
input [3:0] A;
output [3:0] Y;

// si el enable está arribla deja pasar los datos.
    assign Y = enabled ? A : 4'bz;

endmodule
