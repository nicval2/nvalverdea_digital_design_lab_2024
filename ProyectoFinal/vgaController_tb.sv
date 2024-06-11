`timescale 1ns / 1ps

module vgaController_tb;

    // Inputs
    logic vgaclk;
    logic clk;
     
    // Instantiate PLL module to generate vgaclk
    pll vgapll (.inclk0(clk), .c0(vgaclk));
    
    // Outputs
    logic hsync, vsync, sync_b, blank_b;
    logic [9:0] x, y;

    // Instantiate the module under test
    vgaController dut (
        .vgaclk(vgaclk),
        .hsync(hsync),
        .vsync(vsync),
        .sync_b(sync_b),
        .blank_b(blank_b),
        .x(x),
        .y(y)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Monitor signals
    initial begin
        // Initialize inputs
        clk = 0;

        // Run simulation for some time
        repeat (10000) begin
            #10; // Wait for some time (one clock period)

            // Print outputs
            $display("x = %d, y = %d, hsync = %b, vsync = %b, sync_b = %b, blank_b = %b", x, y, hsync, vsync, sync_b, blank_b);
        end

        // Finish simulation
        $finish;
    end

endmodule
