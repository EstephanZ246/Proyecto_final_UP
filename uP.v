module uP(clock,reset,pushbuttons,phase,c_flag,z_flag,instr,oprnd,accu,data_bus,FF_out,program_byte,PC,address_RAM );

input wire clock, reset;
input wire [3:0] pushbuttons;
input wire phase, c_flag, z_flag;
output [3:0] instr, oprnd, accu, data_bus, FF_out;
output [7:0] program_byte;
output [11:0] PC, address_RAM;
output [3:0] Salida_ALU;
//salidas wire
wire IncPC,LoadPC,LoadA,LoadFlags;
wire [2:0] S;
wire csRAM,weRAM,oeALU,oeIN,oeOprnd,LoadOut;
wire C,Z;
wire [3:0] Salida_ALU;
//assign address_RAM ={oprnd,program_byte};
//Revisar
/*
enableds de
- Program_counter
-Fetch
- C,Z
- bus drivers
*/

//falta LoadA
Program_counter m1(clock,reset,IncPC,LoadPC,address_RAM,PC);
Rom  m2(PC,program_byte);
Fetch m3(clock,reset,~phase,program_byte,instr,oprnd);
Flags m4(clock,reset,LoadFlags,C,Z,c_flag,z_flag);
phase m5(clock,reset,phase);
Bus_driver1 m6(oeOprnd,oprnd,data_bus);//enabled
RAM m7(csRAM,weRAM,oprnd,program_byte,data_bus,address_RAM);
Outputs m8(clock,reset,LoadOut,data_bus,FF_out);
Accumator m9(clock,reset,LoadA,Salida_ALU,accu);// salida de la alu
//Alu m10(data_bus,accu,data_bus,C,Z,Salida_ALU);//cantidad de bits de entrada 3 o 4? e Instruccion
Alu m10(accu,data_bus,S,C,Z,Salida_ALU);//cantidad de bits de entrada 3 o 4? e Instruccion
Bus_driver2 m11(oeALU,Salida_ALU,data_bus);
Inputs m12(oeIN,pushbuttons,data_bus);

decode m13(c_flag,z_flag,phase,instr,IncPC,LoadPC,LoadA,LoadFlags,S,csRAM,weRAM,oeALU,oeIN,oeOprnd,LoadOut);


endmodule
