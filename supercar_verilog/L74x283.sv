// 4-bit binary full adder with fast carry
module L74x283
  (
    input [3:0] i_a,
    input [3:0] i_b,
    input i_cin,
    output [3:0] o_s,
    output o_cout
  );

  reg [4:0] r_sum;


  assign r_sum = i_a + i_b + i_cin;
  assign o_s = r_sum;
  assign o_cout = r_sum[4];

endmodule
