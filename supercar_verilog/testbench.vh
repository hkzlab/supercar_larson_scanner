module Testbench_SuperCar();
  reg r_clk = 1'b0; // This will be used as clock
  wire [15:0] w_selection;
  integer i;

  // Use this always block to generate a clock
  // by inverting this register every time unit,
  // so a full clock cycle takes 2 time units
  always #1 r_clk <= !r_clk;

  SuperCar UUT (
    .i_clk(r_clk),
    .o_selection(w_selection)
  );

  initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars;

    for(i = 0; i < 64; i = i + 1)
    begin
      @(posedge r_clk);
    end

    $display("Test Complete");
    $finish();
  end
endmodule
