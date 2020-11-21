module  decode(/* Entradas*/
               C_flag,
               Z_flag,
               Phase,
               Instr,
               /*Salidas*/
               IncPC,
               LoadPC,
               LoadA,
               LoadFlags,
               S,
               CsRAM,
               WeRAM,
               OeALU,
               OeIN,
               OeOprnd,
               LoadOut
               );

input wire C_flag,Z_flag,Phase;
input wire [3:0] Instr;

output wire IncPC,LoadPC,LoadA,LoadFlags,CsRAM,WeRAM,OeALU,OeIN,OeOprnd,LoadOut;
output wire [2:0] S;
wire [6:0] Entradas;
reg [12:0] Salidas;

assign Entradas = {Instr,C_flag,Z_flag,Phase};

always @(Entradas)
casez(Entradas)
7'b??????0: Salidas <= 13'b1000000001000;//any
7'b00001?1: Salidas <= 13'b0100000001000;//JC
7'b00000?1: Salidas <= 13'b1000000001000;//JC
7'b00011?1: Salidas <= 13'b1000000001000;//JNC
7'b00010?1: Salidas <= 13'b0100000001000;//JNC
7'b0010??1: Salidas <= 13'b0001001000010;//CMPI
7'b0011??1: Salidas <= 13'b1001001100000;//CMPM
7'b0100??1: Salidas <= 13'b0011010000010;//LIT
7'b0101??1: Salidas <= 13'b0011010000100;//IN
7'b0110??1: Salidas <= 13'b1011010100000;//LD
7'b0111??1: Salidas <= 13'b1000000111000;//ST
7'b1000?11: Salidas <= 13'b0100000001000;//JZ
7'b1000?01: Salidas <= 13'b1000000001000;//JZ
7'b1001?11: Salidas <= 13'b1000000001000;//JNZ
7'b1001?01: Salidas <= 13'b0100000001000;//JNZ
7'b1010??1: Salidas <= 13'b0011011000010;//ADDI
7'b1011??1: Salidas <= 13'b1011011100000;//ADDM
7'b1100??1: Salidas <= 13'b0100000001000;//JMP
7'b1101??1: Salidas <= 13'b0000000001001;//OUT
7'b1110??1: Salidas <= 13'b0011100000010;//NANI
7'b1111??1: Salidas <= 13'b1011100100000;//NANDM
default: Salidas <= 13'b0000000000000;
endcase

assign  IncPC =  Salidas[12];
assign  LoadPC =  Salidas[11];
assign  LoadA =  Salidas[10];
assign  LoadFlags =  Salidas[9];
assign  S =  Salidas[8:6];
assign  CsRAM =  Salidas[5];
assign  WeRAM =  Salidas[4];
assign  OeALU =  Salidas[3];
assign  OeIN =  Salidas[2];
assign  OeOprnd =  Salidas[1];
assign  LoadOut=  Salidas[0];

endmodule
