// binary-coded decimal to 7-segment display decoder
module bcd_7seg_case (
    input      [3:0] bcd,    // BCD data input
    output reg [6:0] seg_n   // Segment outputs [g, f, e, d, c, b, a] (active LOW)
);

always @*
  // Standard 7447 decoding truth table (0 = Segment ON, 1 = Segment OFF)
  // Segment bit mapping: {g, f, e, d, c, b, a}
  //   ==a==
  //  f     b
  //   ==g==
  //  e     c
  //   ==d==
  case (bcd)
    4'h0: seg_n = 7'b100_0000; // 0
    4'h1: seg_n = 7'b111_1001; // 1
    4'h2: seg_n = 7'b010_0100; // 2
    4'h3: seg_n = 7'b011_0000; // 3
    4'h4: seg_n = 7'b001_1001; // 4
    4'h5: seg_n = 7'b001_0010; // 5
    4'h6: seg_n = 7'b000_0000; // 6 (includes top segment 'a' per 7447 spec)
    4'h7: seg_n = 7'b111_0000; // 7
    4'h8: seg_n = 7'b000_0000; // 8
    4'h9: seg_n = 7'b001_0000; // 9
    // Standard 7447 non-digit symbols for values 10 to 15:
    4'hA: seg_n = 7'b000_1000; // [
    4'hB: seg_n = 7'b000_0011; // ]
    4'hC: seg_n = 7'b001_1100; // u
    4'hD: seg_n = 7'b010_0001; //
    4'hE: seg_n = 7'b000_0110; //
    4'hF: seg_n = 7'b111_1111; // Blank
    default: seg_n = 7'b111_1111;
endcase

endmodule
