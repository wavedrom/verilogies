// One-Hot Index Selector (case (1'b1))
// Scans individual bit positions in a one-hot vector to
// produce a binary encoded output.
module priority_encoder4_casez (
    input [3:0] req,
    output reg valid,
    output reg [1:0] code
);

always @*
  casez (1'b1)
    req[3]:  begin valid = 1'b1; code = 2'b11; end
    req[2]:  begin valid = 1'b1; code = 2'b10; end
    req[1]:  begin valid = 1'b1; code = 2'b01; end
    req[0]:  begin valid = 1'b1; code = 2'b00; end
    default: begin valid = 1'b0; code = 2'b00; end
  endcase

endmodule
