// Priority Encoder (casez with Wildcards)
// Evaluates bit patterns top-to-bottom using ? wildcards,
// building priority logic without deeply nested if-else chains.
module priority_encoder4_casez (
    input [3:0] req,
    output reg valid,
    output reg [1:0] code
);

always @*
  casez (req)
    4'b1???: begin valid = 1'b1; code = 2'b11; end
    4'b01??: begin valid = 1'b1; code = 2'b10; end
    4'b001?: begin valid = 1'b1; code = 2'b01; end
    4'b0001: begin valid = 1'b1; code = 2'b00; end
    default: begin valid = 1'b0; code = 2'b00; end
  endcase

endmodule
