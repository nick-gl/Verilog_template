`timescale 1ns/1ps
`default_nettype none

module tb;

  // Testbench signals
  reg [7:0] ui_in;
  reg [7:0] uio_in;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;
  reg ena;
  reg clk;
  reg rst_n;

  // Instantiate the DUT
  tt_um_counter dut (
    .ui_in(ui_in),
    .uo_out(uo_out),
    .uio_in(uio_in),
    .uio_out(uio_out),
    .uio_oe(uio_oe),
    .ena(ena),
    .clk(clk),
    .rst_n(rst_n)
  );

  // Clock generation: 10ns period
  initial clk = 0;
  always #5 clk = ~clk;

  // Stimulus
  initial begin
    // Initialize signals
    ui_in = 8'd0;
    uio_in = 8'd0;
    ena    = 1'b1;
    rst_n  = 1'b0;  // Assert reset
    #12 rst_n = 1'b1;  // Deassert reset
    #200 $finish;   // End simulation after 20 cycles
  end

  // Optional: VCD dump for GTKWave
//  initial begin
  //  $dumpfile("tt_um_counter.vcd");
   // $dumpvars(0, tb_tt_um_counter);
  //end

endmodule
