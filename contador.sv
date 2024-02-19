module contador #(parameter N = 8) (
    input wire clk,
    input wire reset,
    output reg [N-1:0] cont 
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        cont <= 0;
    end else begin
        cont <= cont + 1;
    end
end

endmodule
