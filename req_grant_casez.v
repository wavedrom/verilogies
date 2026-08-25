// Fixed-Priority Request Grant Generator (casez)
// Generates an isolated single-hot grant mask
// based on relative request line position.
module req_grant_casez(
  input      [3:0] req,
  output reg [3:0] grant
);

always @*
  casez (req)
      4'b???1: grant = 4'b0001; // Bit 0 highest priority
      4'b??10: grant = 4'b0010;
      4'b?100: grant = 4'b0100;
      4'b1000: grant = 4'b1000;
      default: grant = 4'b0000;
  endcase

endmodule
