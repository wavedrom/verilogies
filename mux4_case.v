// Multi-Input Multiplexer
// Routes one of several input signals to an output based on an explicit select signal index.
module mux4_case (
  input [1:0] sel,
  input [31:0] in0, in1, in2, in3,
  output reg [31:0] out
);

always @*
  case (sel)
    2'b00:   out = in0;
    2'b01:   out = in1;
    2'b10:   out = in2;
    2'b11:   out = in3;
    default: out = '0; // ureachable with 2-state simulation
  endcase

endmodule
