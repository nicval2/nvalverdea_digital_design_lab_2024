module contadorFPGA (
    input wire clk,      
    input wire reset,     
    input wire dec_btn,   
    output wire [6:0] seg
);

reg [5:0] count = 6'b000000;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 6'b000000;
    end else if (dec_btn) begin
        count <= count - 1;
    end else begin
        count <= count + 1;
    end
end

assign seg = count;

endmodule


