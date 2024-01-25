module SuperCar
  (
    input i_clk,
    output [15:0] o_selection
  );

  wire [3:0] w_sum_result;
  wire [7:0] w_led_address;
  wire [7:0] w_addend;
  wire w_neg_addend;
  wire w_addend_clk;

  wire w_u5_g2_out;
  wire w_u6_g1_out;
  wire w_u6_g2_out;
  wire w_u6_g3_out;

  wire [3:0] w_inverted_led_address;

  L74x283 U1 (
            .i_a(w_led_address[3:0]),
            .i_b(w_addend[3:0]),
            .i_cin(1'b0),
            .o_s(w_sum_result),
            .o_cout() // Left disconnected
          );

  L74x574 U2 (
            .i_data({4'h0, w_sum_result}),
            .i_clk(i_clk),
            .i_n_oe(1'b0),
            .o_q(w_led_address)
          );

  L74x154 U3 (
            .i_address(w_led_address[3:0]), // Only the 4 least significant bits are considered
            .i_n_en0(1'b0),
            .i_n_en1(1'b0),
            .o_selection(o_selection)
          );

  L74x574 #(.INITIAL_VALUE(8'hFF)) U4 (
            .i_data({4'h0, w_neg_addend, w_neg_addend, w_neg_addend, 1'b1}),
            .i_clk(w_addend_clk),
            .i_n_oe(1'b0),
            .o_q(w_addend)
          );

  L74x21 U5 (
           .i_g1(w_led_address[3:0]),
           .o_g1(w_neg_addend),
           .i_g2(w_inverted_led_address),
           .o_g2(w_u5_g2_out)
         );

  L74x02 U6 (
           .i_g1({w_neg_addend, w_u5_g2_out}),
           .o_g1(w_u6_g1_out),
           .i_g2({w_u6_g1_out, w_u6_g1_out}),
           .o_g2(w_u6_g2_out),
           .i_g3({w_u6_g2_out, w_u6_g2_out}),
           .o_g3(w_u6_g3_out),
           .i_g4({w_u6_g3_out, w_u6_g3_out}),
           .o_g4(w_addend_clk)
         );

  L74x04 U7 (
           .i_g1(w_led_address[0]),
           .o_g1(w_inverted_led_address[0]),
           .i_g2(w_led_address[1]),
           .o_g2(w_inverted_led_address[1]),
           .i_g3(w_led_address[2]),
           .o_g3(w_inverted_led_address[2]),
           .i_g4(w_led_address[3]),
           .o_g4(w_inverted_led_address[3]),
           .i_g5(1'b0),
           .o_g5(),
           .i_g6(1'b0),
           .o_g6()
         );

endmodule
