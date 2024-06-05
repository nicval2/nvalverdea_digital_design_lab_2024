`timescale 1ns / 1ps

module top_tb;

  // Testbench signals
  logic clk, reset, btn;
  logic [1:0] num;
  logic [6:0] segs;
  logic vgaclk;
  logic hsync, vsync;
  logic sync_b, blank_b;
  logic [7:0] r, g, b;
  logic [31:0] PC, Instr, ReadData;
  logic [31:0] ram_data_b;
  logic [31:0] WriteData, DataAdr;
  logic MemWrite;

  // Instantiate the top module
  top uut(
    .clk(clk),
    .reset(reset),
    .btn(btn),
    .num(num),
    .segs(segs),
    .vgaclk(vgaclk),
    .hsync(hsync),
    .vsync(vsync),
    .sync_b(sync_b),
    .blank_b(blank_b),
    .r(r),
    .g(g),
    .b(b)
  );

  // Clock generator
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Generate a clock with a period of 10ns (100MHz)
  end

  // Test sequence
 initial begin
    // Initialize inputs
    reset = 1;
    btn = 1;
    num = 2'b00;

    // Reset the system
    #20 reset = 0; // Assert reset (active high)
	 
	 // Set a number to test the display segments
    num = 2'b11; // Example number to be displayed

    // Simulate button press
    #10 btn = 0; // Press the button
    #20 btn = 1; // Release the button after enough time for the clock to capture the event


    // Wait for some time and observe the outputs
    #80;

    // Monitor signals at every clock cycle after reset deassertion
    forever begin
      @(posedge clk) begin
        $display("Time: %t | PC: %h | Instr: %h | MemWrite: %b | ALUResult: %h | WriteData: %h | ReadData: %h | Segments: %b",
                 $time, uut.PC, uut.Instr, uut.MemWrite, uut.DataAdr, uut.WriteData, uut.ReadData, segs);
      end
    end
  end

  // Finish the simulation after a certain time or condition
  initial begin
    #4000;
    $finish;
  end

endmodule