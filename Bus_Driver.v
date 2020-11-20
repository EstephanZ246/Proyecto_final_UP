module Bus_driver1(input enabled, input [3:0] A, output [3:0] Y);

    assign Y = enabled ? A : 4'bz;

endmodule
