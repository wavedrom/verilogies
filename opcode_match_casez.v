// Instruction Opcode Mask Matching (casez)
// Filters instructions by masking donor/register fields (?)
// and matching fixed opcode or function fields.
module opcode_match_casez(
  input [31:0] instr,
  output reg [2:0] inst_type
);

localparam INST_ADD = 3'd0;
localparam INST_SUB = 3'd1;
localparam INST_LOAD = 3'd2;
localparam INST_UNK = 3'd3;

always @*
  casez (instr)
      32'b0000000_?????_?????_000_?????_0110011: inst_type = INST_ADD;
      32'b0100000_?????_?????_000_?????_0110011: inst_type = INST_SUB;
      32'b???????_?????_?????_???_?????_0000011: inst_type = INST_LOAD;
      default:                                   inst_type = INST_UNK;
  endcase

endmodule
