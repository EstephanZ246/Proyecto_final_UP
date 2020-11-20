//módulo en prueba

module Flags(input clk, reset, enabled, input C,Z, output reg [1:0] Q);

    always @ (posedge clk, posedge reset)
        if (reset)
            Q <= 2'b00;
        else if (enabled)
            Q <= {C,Z};

endmodule
