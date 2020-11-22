// Univeridad del Valle de Guatemala
// Proyecto final, Procesador
// Estephan Portales
// 19826

//Declaracion de puertos
module Rom(address,data);
//Configuracion de puertos
input [11:0] address;
output [7:0] data;
// Variable que guarda memoria
    reg [7:0] memory [0:4096];
// Leemos memoria
    initial
        $readmemh("memory.list", memory);

    assign data = memory[address];

endmodule
