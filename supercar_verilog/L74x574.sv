// Octal 3 state non inverting D flip-flop
module L74x574 #(parameter INITIAL_VALUE = 8'h00)
  (
    input [7:0] i_data,
    input i_n_oe,
    input i_clk,
    inout [7:0] o_q
  );

  reg [7:0] r_data = INITIAL_VALUE;

  always @(posedge i_clk)
  begin
    r_data <= i_data;
  end

  assign o_q = i_n_oe ? 8'bZ : r_data;

endmodule
