`timescale 1ns / 1ps

module top_tb;

  // Testbench signals
  logic clk, reset;
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
    // Reset the system
    reset = 1;
    #20; // Hold reset for 20ns
    reset = 0;

    // Monitor signals at every clock cycle after reset deassertion
    forever begin
      @(posedge clk) begin
$display("Time: %t | PC: %h | Instr: %h | MemWrite: %b | ALUResult: %h | WriteData: %h | ReadData: %h",
         $time, uut.arm_inst.PC, uut.arm_inst.Instr, uut.arm_inst.MemWrite, uut.arm_inst.ALUResult, uut.arm_inst.WriteData, uut.arm_inst.ReadData);
      end
    end
  end

  // Finish the simulation after a certain time or condition
  initial begin
    #1000;
    $finish;
  end

endmodule