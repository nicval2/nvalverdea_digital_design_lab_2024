`timescale 1ns / 1ps

module top_tb;
  logic clk, reset;
  logic [31:0] WriteData, DataAdr;
  logic MemWrite;

  // Instantiate device to be tested
  top dut(clk, reset, WriteData, DataAdr, MemWrite);

  // Initialize test
  initial begin
    reset <= 1;
    #22;
    reset <= 0;
  end

  // Generate clock to sequence tests
  always begin
    clk <= 1;
    #5;
    clk <= 0;
    #5;
  end

  // Add additional test stimuli and monitoring here
  initial begin
    // Wait for reset to de-assert
    @(negedge reset);
    // Monitor signals
    $monitor("Time: %t | Address: %h | WriteData: %h | MemWrite: %b", $time, DataAdr, WriteData, MemWrite);
    // Add stimuli for testing
    // ...
    // Finish the simulation after a certain time or condition
    #1000;
    $finish;
  end
endmodule
