// 6 port hex inverter
module L74x04
  (
    // Gate 1
    input i_g1,
    output o_g1,

    // Gate 2
    input i_g2,
    output o_g2,
    
    // Gate 3
    input i_g3,
    output o_g3,
    
    // Gate 4
    input i_g4,
    output o_g4,
    
    // Gate 5
    input i_g5,
    output o_g5,
    
    // Gate 6
    input i_g6,
    output o_g6
  );

  assign o_g1 = ~i_g1;
  assign o_g2 = ~i_g2;
  assign o_g3 = ~i_g3;
  assign o_g4 = ~i_g4;
  assign o_g5 = ~i_g5;
  assign o_g6 = ~i_g6;

endmodule
