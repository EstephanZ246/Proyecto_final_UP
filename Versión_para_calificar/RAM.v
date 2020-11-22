// Univeridad del Valle de Guatemala
// Proyecto final, Procesador
// Estephan Portales
// 19826

module RAM(chips,enableRW,oprnd,program_byte,data,address);


input wire chips;
input wire enableRW;
input wire [3:0] oprnd;
input wire [7:0] program_byte;
input wire [3:0] data;
output wire [11:0] address;
// Concatenamos el address_RAM para que el counter lo pueda usar
    assign address = {oprnd, program_byte};

    reg [3:0] data_out;
    reg [3:0] mem [0:4095];

// Intrucciones y valores provenientes de los enables, oprnd y program_byte para volver a cargar al Program_counter
    assign data = (chips  &&  !enableRW) ? data_out : 4'bz;

    always @ (address or chips or enableRW)
        begin
            if (chips &&  !enableRW)
             data_out = mem[address];
        end

    always @ (address or data or chips or enableRW)
        begin
            if ( chips && enableRW )
           mem[address] = data;
        end


endmodule
