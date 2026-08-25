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
    4'h0: seg_n = 7'b1000000; // 0
    4'h1: seg_n = 7'b1111001; // 1
    4'h2: seg_n = 7'b0100100; // 2
    4'h3: seg_n = 7'b0110000; // 3
    4'h4: seg_n = 7'b0011001; // 4
    4'h5: seg_n = 7'b0010010; // 5
    4'h6: seg_n = 7'b0000011; // 6 -- missing top bar 'a'
    4'h7: seg_n = 7'b1111000; // 7
    4'h8: seg_n = 7'b0000000; // 8
    4'h9: seg_n = 7'b0011000; // 9 -- missing bottom bar 'd'
    // Standard 7447 non-digit symbols for values 10 to 15:
    4'hA: seg_n = 7'b0100111; // ⊏ -- Mutilated C, Inverted 'c', Pseudo-Hex 'A'
    4'hB: seg_n = 7'b1100111; // ⊐ -- Mutilated J, Backward 'J' / Pseudo-Hex 'b'
    4'hC: seg_n = 7'b1011100; // ⊓ -- Mutilated H / Upper Hook / "nH" shape / Pseudo-Hex 'C'
    4'hD: seg_n = 7'b0010110; // ⊔ -- Mutilated U / Symmetric Open Cup / Pseudo-Hex 'd'
    4'hE: seg_n = 7'b0000111; // ⊦ -- Mutilated E / Cross Bar / T-hook / Pseudo-Hex 'E'
    4'hF: seg_n = 7'b1111111; // Blanking State / Overflow Output / Pseudo-Hex 'F'
    default: seg_n = 7'b111_1111;
endcase

endmodule
