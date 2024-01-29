// Quadruple 2-input xor gates
module L74x86
  (
    // Gate 1
    input [1:0] i_g1,
    output o_g1,

    // Gate 2
    input [1:0] i_g2,
    output o_g2,
    
    // Gate 3
    input [1:0] i_g3,
    output o_g3,
    
    // Gate 4
    input [1:0] i_g4,
    output o_g4
  );

  assign o_g1 = ^i_g1;
  assign o_g2 = ^i_g2;
  assign o_g3 = ^i_g3;
  assign o_g4 = ^i_g4;

endmodule
