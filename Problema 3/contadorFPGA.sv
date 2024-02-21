module contadorFPGA (
    input wire clk,      
    input wire reset,     
    input wire dec_btn, 
    output reg [13:0] seg
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

always @(*) begin
    case(count)
        6'b000000: begin
            seg[6:0] = 7'b1111110; 
            seg[13:7] = 7'b1111110; 
        end
        6'b000001: begin
            seg[6:0] = 7'b0110000; 
            seg[13:7] = 7'b1111110; 
        end
        6'b000010: begin
            seg[6:0] = 7'b1101101; 
            seg[13:7] = 7'b1111110; 
        end
        6'b000011: begin
            seg[6:0] = 7'b1111001;
            seg[13:7] = 7'b1111110;
        end
        6'b000100: begin
            seg[6:0] = 7'b0110011;
            seg[13:7] = 7'b1111110; 
        end
        6'b000101: begin
            seg[6:0] = 7'b1011011; 
            seg[13:7] = 7'b1111110;
        end
        6'b000110: begin
            seg[6:0] = 7'b1011111;
            seg[13:7] = 7'b1111110;
        end
        6'b000111: begin
            seg[6:0] = 7'b1110000;
            seg[13:7] = 7'b1111110;
        end
        6'b001000: begin
            seg[6:0] = 7'b1111111;
            seg[13:7] = 7'b1111110;
        end
        6'b001001: begin
            seg[6:0] = 7'b1111011;
            seg[13:7] = 7'b1111110;
        end
        6'b001010: begin
            seg[6:0] = 7'b1110111;
            seg[13:7] = 7'b0110000;
        end
        6'b001011: begin
            seg[6:0] = 7'b0110000;
            seg[13:7] = 7'b0110000;
        end
        6'b001100: begin
            seg[6:0] = 7'b1101101;
            seg[13:7] = 7'b0110000;
        end
        6'b001101: begin
            seg[6:0] = 7'b1111001;
            seg[13:7] = 7'b0110000;
        end
        6'b001110: begin
            seg[6:0] = 7'b0110011;
            seg[13:7] = 7'b0110000;
        end
        6'b001111: begin
            seg[6:0] = 7'b1011011;
            seg[13:7] = 7'b0110000;
        end
        6'b010000: begin
            seg[6:0] = 7'b1011111; 
            seg[13:7] = 7'b0110000; 
        end
        6'b010001: begin
            seg[6:0] = 7'b1110000; 
            seg[13:7] = 7'b0110000; 
        end
        6'b010010: begin
            seg[6:0] = 7'b1111111; 
            seg[13:7] = 7'b0110000;
        end
        6'b010011: begin
            seg[6:0] = 7'b1111011; 
            seg[13:7] = 7'b0110000; 
        end
        6'b010100: begin
            seg[6:0] = 7'b1110111;
            seg[13:7] = 7'b1101101; 
        end
        6'b010101: begin
            seg[6:0] = 7'b0110000; 
            seg[13:7] = 7'b1101101; 
        end
        6'b010110: begin
            seg[6:0] = 7'b1101101; 
            seg[13:7] = 7'b1101101;
        end
        6'b010111: begin
            seg[6:0] = 7'b1111001;
            seg[13:7] = 7'b1101101; 
        end
        6'b011000: begin
            seg[6:0] = 7'b0110011; 
            seg[13:7] = 7'b1101101; 
        end
        6'b011001: begin
            seg[6:0] = 7'b1011011; 
            seg[13:7] = 7'b1101101; 
        end
        6'b011010: begin
            seg[6:0] = 7'b1011111; 
            seg[13:7] = 7'b1101101; 
        end
        6'b011011: begin
            seg[6:0] = 7'b1110000;
            seg[13:7] = 7'b1101101;
        end
        6'b011100: begin
            seg[6:0] = 7'b1111111; 
            seg[13:7] = 7'b1101101; 
        end
        6'b011101: begin
            seg[6:0] = 7'b1111011; 
            seg[13:7] = 7'b1101101; 
        end
        6'b011110: begin
            seg[6:0] = 7'b1110111; 
            seg[13:7] = 7'b1011111; 
        end
        6'b011111: begin
            seg[6:0] = 7'b0110000; 
            seg[13:7] = 7'b1011111; 
        end
        6'b100000: begin
            seg[6:0] = 7'b1101101; 
            seg[13:7] = 7'b1011111; 
        end
        6'b100001: begin
            seg[6:0] = 7'b1111001; 
            seg[13:7] = 7'b1011111; 
        end
        6'b100010: begin
            seg[6:0] = 7'b0110011; 
            seg[13:7] = 7'b1011111;
        end
        6'b100011: begin
            seg[6:0] = 7'b1011011; 
            seg[13:7] = 7'b1011111; 
        end
        6'b100100: begin
            seg[6:0] = 7'b1011111;
            seg[13:7] = 7'b1011111; 
        end
        6'b100101: begin
            seg[6:0] = 7'b1110000; 
            seg[13:7] = 7'b1011111;
        end
        6'b100110: begin
            seg[6:0] = 7'b1111111; 
            seg[13:7] = 7'b1011111; 
        end
        6'b100111: begin
            seg[6:0] = 7'b1111011; 
            seg[13:7] = 7'b1011111; 
        end
        6'b101000: begin
            seg[6:0] = 7'b1110111; 
            seg[13:7] = 7'b1011110; 
        end
        6'b101001: begin
            seg[6:0] = 7'b0110000; 
            seg[13:7] = 7'b1011110; 
        end
        6'b101010: begin
            seg[6:0] = 7'b1101101; 
            seg[13:7] = 7'b1011110; 
        end
        6'b101011: begin
            seg[6:0] = 7'b1111001;
            seg[13:7] = 7'b1011110; 
        end
        6'b101100: begin
            seg[6:0] = 7'b0110011; 
            seg[13:7] = 7'b1011110; 
        end
        6'b101101: begin
            seg[6:0] = 7'b1011011; 
            seg[13:7] = 7'b1011110; 
        end
        6'b101110: begin
            seg[6:0] = 7'b1011111;
            seg[13:7] = 7'b1011110;
        end
        6'b101111: begin
            seg[6:0] = 7'b1110000;
            seg[13:7] = 7'b1011110; 
        end
        6'b110000: begin
            seg[6:0] = 7'b1111111; 
            seg[13:7] = 7'b1011110;
        end
        6'b110001: begin
            seg[6:0] = 7'b1111011; 
            seg[13:7] = 7'b1011110; 
        end
        6'b110010: begin
            seg[6:0] = 7'b1110111; 
            seg[13:7] = 7'b1011101;
        end
        6'b110011: begin
            seg[6:0] = 7'b0110000;
            seg[13:7] = 7'b1011101;
        end
        6'b110100: begin
            seg[6:0] = 7'b1101101;
            seg[13:7] = 7'b1011101;
        end
        6'b110101: begin
            seg[6:0] = 7'b1111001;
            seg[13:7] = 7'b1011101; 
        end
        6'b110110: begin
            seg[6:0] = 7'b0110011;
            seg[13:7] = 7'b1011101;
        end
        6'b110111: begin
            seg[6:0] = 7'b1011011;
            seg[13:7] = 7'b1011101;
        end
        6'b111000: begin
            seg[6:0] = 7'b1011111; 
            seg[13:7] = 7'b1011101; 
        end
        6'b111001: begin
            seg[6:0] = 7'b1110000; 
            seg[13:7] = 7'b1011101;
        end
        6'b111010: begin
            seg[6:0] = 7'b1111111; 
            seg[13:7] = 7'b1011101; 
        end
        6'b111011: begin
            seg[6:0] = 7'b1111011; 
            seg[13:7] = 7'b1011101; 
        end
        6'b111100: begin
            seg[6:0] = 7'b1110111; 
            seg[13:7] = 7'b1011011; 
        end
        6'b111101: begin
            seg[6:0] = 7'b0110000; 
            seg[13:7] = 7'b1011011; 
        end
        6'b111110: begin
            seg[6:0] = 7'b1101101; 
            seg[13:7] = 7'b1011011; 
        end
        6'b111111: begin
            seg[6:0] = 7'b1111001; 
            seg[13:7] = 7'b1011011; 
        end
        default: begin
            seg[6:0] = 7'b0000000; 
            seg[13:7] = 7'b0000000; 
        end
    endcase
end

endmodule
