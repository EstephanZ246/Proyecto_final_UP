// Univeridad del Valle de Guatemala
// Proyecto final, Procesador
// Estephan Portales
// 19826

module uP(clock,reset,pushbuttons,phase,c_flag,z_flag,instr,oprnd,accu,data_bus,FF_out,program_byte,PC,address_RAM );

//Señales para el testbench
input wire clock, reset;
input wire [3:0] pushbuttons;
input wire phase, c_flag, z_flag;
output [3:0] instr, oprnd, accu, data_bus, FF_out;
output [7:0] program_byte;
output [11:0] PC, address_RAM;
output [3:0] Salida_ALU;

// Estas son las salidas para los módulos, para poder controlarlos, corresponden al decode
wire IncPC,LoadPC,LoadA,LoadFlags;
wire [2:0] S;
wire csRAM,weRAM,oeALU,oeIN,oeOprnd,LoadOut;
wire C,Z;
wire [3:0] Salida_ALU;


//Intancias de todos los módulos del procesador para poder ser usados por el testbench
Program_counter m1(clock,reset,IncPC,LoadPC,address_RAM,PC);
Rom  m2(PC,program_byte);
Fetch m3(clock,reset,~phase,program_byte,instr,oprnd);
Flags m4(clock,reset,LoadFlags,C,Z,c_flag,z_flag);
phase m5(clock,reset,phase);
Bus_driver1 m6(oeOprnd,oprnd,data_bus);
RAM m7(csRAM,weRAM,oprnd,program_byte,data_bus,address_RAM);
Outputs m8(clock,reset,LoadOut,data_bus,FF_out);
Accumator m9(clock,reset,LoadA,Salida_ALU,accu);
Alu m10(accu,data_bus,S,C,Z,Salida_ALU);
Bus_driver2 m11(oeALU,Salida_ALU,data_bus);
Inputs m12(oeIN,pushbuttons,data_bus);
decode m13(c_flag,z_flag,phase,instr,IncPC,LoadPC,LoadA,LoadFlags,S,csRAM,weRAM,oeALU,oeIN,oeOprnd,LoadOut);
endmodule
