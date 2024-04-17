module clock_divider(
    input logic clk,
    input logic reset,
    output logic tick  // Pulso cada segundo
);
    localparam int COUNT_MAX = 50_000_000;  // Ajusta según tu frecuencia de reloj, ej. 50 MHz
    int count = 0;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            tick <= 0;
        end else if (count >= COUNT_MAX - 1) begin
            tick <= 1;
            count <= 0;
        end else begin
            tick <= 0;
            count <= count + 1;
        end
    end
endmodule
