// 4-to-16 line decoder/demultiplexer
module L74x154
  (
    input [3:0] i_address,
    input i_n_en0,
    input i_n_en1,
    output [15:0] o_selection
  );

  assign o_selection = (i_n_en0 || i_n_en1) ? 16'hFFFF : ~(1'b1 << i_address);

endmodule
