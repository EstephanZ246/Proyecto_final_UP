// Univeridad del Valle de Guatemala
// Proyecto final, Procesador
// Estephan Portales
// 19826

module Accumator (input clk, reset, enable, input [3:0] D, output reg [3:0] Q);
// Configuración para poder dejar pasar los datos según el estado del enable
// Si el reset se activa de vuelve 0000 la salida, pero si el enable esta arriba
//los datos de D los traslada a Q
    always @ (posedge clk, posedge reset)
        if (reset)
            Q <= 4'b0000;
        else if (enable)
            Q <= D;

endmodule
