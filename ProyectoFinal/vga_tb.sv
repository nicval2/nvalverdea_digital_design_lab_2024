`timescale 1ns / 1ps

module vga_tb();

    // Testbench signals
    reg clk;
    wire vgaclk;
    wire hsync, vsync;
    wire sync_b, blank_b;
    wire [7:0] r, g, b;
    wire [8:0] address;
    reg [31:0] data;

    // Memory array to hold the MIF data
    reg [31:0] memory [0:255];

    // Initialize memory with MIF data
    initial begin
        memory[0] = 32'h2A000000;
        memory[1] = 32'h00000002;
        // ... (initialize all memory locations with the provided MIF data)
        memory[255] = 32'h61756775;
    end

    // Instantiate the VGA module
    vga vga_inst(
        .clk(clk),
        .vgaclk(vgaclk),
        .hsync(hsync),
        .vsync(vsync),
        .sync_b(sync_b),
        .blank_b(blank_b),
        .r(r),
        .g(g),
        .b(b),
        .address(address),
        .data(data)
    );

    // Simulate the system clock
    initial clk = 0;
    always #10 clk = ~clk; // 50MHz clock for system

    // Provide data from memory based on the address
    always @(address) begin
        data = memory[address];
    end

    // Display the output for verification
    initial begin
        $monitor("Time: %t, HSync: %b, VSync: %b, Address: %h, Data: %h, R: %h, G: %h, B: %h",
                 $time, hsync, vsync, address, data, r, g, b);
    end

    // Run the simulation for a certain period
    initial begin
        #1000000; // Run for enough time to see the output
        $finish;
    end

endmodule