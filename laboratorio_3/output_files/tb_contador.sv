`timescale 1ns/1ps

module tb_contador;
    // Inputs
    reg right;
    reg left;
    reg up;
    reg down;
    reg clk;

    // Outputs
    wire [4:0] position;

    // Instantiate the Unit Under Test (UUT)
    contador uut (
        .right(right),
        .left(left),
        .up(up),
        .down(down),
        .clk(clk),
        .position(position)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Initialize Inputs
    initial begin
        // Initialize inputs
        right = 0;
        left = 0;
        up = 0;
        down = 0;

        // Wait for global reset
        #100;

        // Test sequence
        #10 right = 1; #10 right = 0; // Move right
        #20 left = 1; #10 left = 0;  // Move left
        #30 up = 1; #10 up = 0;     // Move up
        #40 down = 1; #10 down = 0; // Move down

        #100; // Wait to observe final outputs
    end

    // Monitor outputs
    initial begin
        $monitor("At time %t, position = %b (%0d, %0d)", $time, position, position[4:3], position[2:0]);
    end

endmodule
