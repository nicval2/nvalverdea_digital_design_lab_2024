module clockDivider(
    input wire refclk,       // 100 MHz reference clock input
    input wire rst,          // Reset input
    output reg clk_VGA,      // 25 MHz VGA clock output
    output reg clk_Processor // 5 MHz Processor clock output
);
    reg [2:0] counter_25MHz;  // Counter for 25 MHz clock
    reg [4:0] counter_5MHz;   // Counter for 5 MHz clock

    always @(posedge refclk or posedge rst) begin
        if (rst) begin
            counter_25MHz <= 0;
            clk_VGA <= 0;
        end else if (counter_25MHz == 1) begin
            clk_VGA <= ~clk_VGA;
            counter_25MHz <= 0;
        end else begin
            counter_25MHz <= counter_25MHz + 1;
        end
    end

    always @(posedge refclk or posedge rst) begin
        if (rst) begin
            counter_5MHz <= 0;
            clk_Processor <= 0;
        end else if (counter_5MHz == 9) begin
            clk_Processor <= ~clk_Processor;
            counter_5MHz <= 0;
        end else begin
            counter_5MHz <= counter_5MHz + 1;
        end
    end
endmodule
