 // Univeridad del Valle de Guatemala
// Proyecto final, Procesador
// Estephan Portales
// 19826


module Alu(input [3:0] A, B,
           input [3:0] F,
           output C, Z,
           output [3:0] S);
//variable en donde se guarda la salida
    reg [4:0] regS;
// Operaciones del la ALU
    always @ (A, B, F)
        case (F)
            3'b000: regS = A;
            3'b001: regS = A - B;
            3'b010: regS = B;
            3'b011: regS = A + B;
            3'b100: regS = {1'b0, ~(A & B)};
            default: regS = 5'b10101;
        endcase
// Salidas a los puertos de la ALU
    assign S = regS[3:0];
    assign C = regS[4];
    assign Z = ~(regS[3] | regS[2] | regS[1] | regS[0]);

endmodule
