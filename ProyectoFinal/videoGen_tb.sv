`timescale 1ns / 1ps

module videoGen_tb;

    // Inputs
    logic vgaclk;
	 logic clk;
	 
	 pll vgapll(.inclk0(clk), .c0(vgaclk));

    
    // Outputs
    logic [9:0] x, y;
    logic [8:0] address;
    logic [31:0] data;
	 
	     // Memory array to hold the MIF data
    reg [31:0] memory [0:255];

    // Initialize memory with MIF data
    initial begin
        memory[0] = 32'h2A000000;
        memory[1] = 32'h00000002;
        memory[2] = 32'h4C6F7265;
        memory[3] = 32'h69707375;
        memory[4] = 32'h646F6C6F;
        memory[5] = 32'h73697400;
        memory[6] = 32'h616D6574;
        memory[7] = 32'h636F6E73;
        // Initialize remaining memory locations with appropriate data
        // ...
        memory[255] = 32'h61756775;
    end

    // Instantiate the module under test
    videoGen dut (
        .x(x),
        .y(y),
        .r(),
        .g(),
        .b(),
        .address(address),
        .data(data)
    );

    // Instantiate the VGA controller to drive inputs
    vgaController vga_ctrl (
        .vgaclk(vgaclk),
        .hsync(),
        .vsync(),
        .sync_b(),
        .blank_b(),
        .x(x),
        .y(y)
    );

    // Clock generation
    always #5 clk = ~clk;
	 
	     // Provide data from memory based on the address
    always @(posedge clk) begin
        data <= memory[address];
    end

    initial begin
        // Initialize inputs
        x = 0;
        y = 0;

        // Apply clock and simulate VGA display
        repeat (100000) begin
            #1 clk = 0;
            #1 clk = 1;
				
				// Print x and y values
            $display("x = %d, y = %d", x, y);
        end

        // Finish simulation
        $finish;
    end

endmodule
