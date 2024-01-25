// 4-input 2 NAND gates
module L74x21
  (
    // Gate 1
    input [3:0] i_g1,
    output o_g1,

    // Gate 2
    input [3:0] i_g2,
    output o_g2
  );

  assign o_g1 = &i_g1;
  assign o_g2 = &i_g2;
endmodule
