module  decode(clock,reset,pushbuttons,phase,c_flag,z_flag
               instr,oprnd,accu,data_bus,FF_out,program_byte,PC,address_RAM);
// LLamo a todos los módulos

// entradas reg

reg clock, reset;
reg [3:0] pushbuttons;
wire phase, c_flag, z_flag;
wire [3:0] instr, oprnd, accu, data_bus, FF_out;
wire [7:0] program_byte;
wire [11:0] PC, address_RAM;

//NO declarados
output wire IncPC,LoadPC,LoadA,LoadFlags,S2,S1,S0,csRAM,WeRAM,oeALU,oeIN,oeOprnd,LoadOut;
///////////////////////////////////////


//salidas wire

//Revisar
/*
enableds de
- Program_counter
-Fetch
- C,Z
- bus drivers
*/
Instruccion = {S2,S1,S0}

Program_counter m1(clock,reset,IncPC,loadPC,address_RAM,PC);
Rom  m2(PC,program_byte);
Fetch m3(clock,reset,LoadA,program_byte,instr,oprnd);//verificar código, supongo que el fetch es LoadA
Flags m4(clock,reset,LoadFlags,C,Z,c_flag,z_flag);
//phase m5
Bus_driver1 m6(enabled_Bus_driver1,oprnd,data_bus);//enabled
//RAM m7
Outputs m8(clock,reset,LoadOut,data_bus,FF_out);
Accumator m9(clock,reset,enabled_Accumulator,Salida_ALU,accu);// salida de la alu
Alu m10(data_bus,accu,Instruccion,C,Z,Salida_ALU);//cantidad de bits de entrada 3 o 4? e Instruccion
Bus_driver2 m11(enabled_Bus_driver2,Salida_ALU,data_bus);
Inputs m12(enabled_Inputs,pushbuttons,data_bus);

always @(posedge clock, posedge reset);
  initial begin
      case()
        begin
      endcase
  end






endmodule
