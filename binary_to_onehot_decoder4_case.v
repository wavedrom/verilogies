// Translates an $N$-bit binary index into a single active high output vector line.
module binary_to_onehot_decoder4_case (
  input [1:0] addr,
  output reg [3:0] line
);
always @*
  case (addr)
    2'b00:   line = 4'b0001;
    2'b01:   line = 4'b0010;
    2'b10:   line = 4'b0100;
    2'b11:   line = 4'b1000;
    default: line = 4'b0000; // unreachable with 2-state addr
  endcase

endmodule
