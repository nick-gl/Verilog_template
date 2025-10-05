
module tt_um_counter (
    input  wire [7:0] ui_in,                                                                                            input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
  reg [7:0] count;
  always @(posedge clk) begin
   if (!rst_n)
        count <=8'b0;
   else
     count <= count + 1;
  end

  assign uo_out = count;

  assign uio_out = 0;
  assign uio_oe = 0;
  // List all unused inputs to prevent warnings
   wire _unused = &{ena, ui_in, uio_in, 1'b0};

endmodule
