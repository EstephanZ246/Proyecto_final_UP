// Univeridad del Valle de Guatemala
// Proyecto final, Procesador
// Estephan Portales
// 19826

//Declaracion de puertos
module Program_counter(clk, reset, enabled, load,loadData,outValue);

//Configuracion de puertos
input clk, reset, enabled, load;
input [11:0] loadData;
output reg [11:0] outValue;
// salida de 12 bits según la señal del reloj
    always @ (posedge clk, posedge reset) begin
        if (reset)
            outValue <= 12'b0;
        else if (load)
            outValue <= loadData;
        else if (enabled)
            outValue <= outValue + 1;
    end

endmodule
