module contadorFPGA (
    input wire clk,      
    input wire reset,     
    input wire dec_btn, 
    output reg [6:0] seg,
	 output reg [6:0] seg_2

);

reg [3:0] BCD_count;
reg [3:0] BCD_count_2;
reg [5:0] count = 6'b000000;
reg [5:0] count_2 = 6'b000000;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 6'b000000;
    end else if (dec_btn) begin
        count <= count - 1;
    end else begin
        count <= count + 1;
    end
end

always @* begin
    if (count < 10) begin
        BCD_count = count;
    end else begin
        BCD_count = count % 10;
    end
end

always @* begin
    if (count < 10) begin
        BCD_count_2 = 0;
    end else begin
        BCD_count_2 = count/10;
    end
end


always @* begin
    case (BCD_count)
        4'b0000: seg = 7'b1000000; // 0
        4'b0001: seg = 7'b1111001; // 1
        4'b0010: seg = 7'b0100100; // 2
		  4'b0011: seg = 7'b0110000; // 3
        4'b0100: seg = 7'b0011001; // 4
        4'b0101: seg = 7'b0010010; // 5
        4'b0110: seg = 7'b0000010; // 6
        4'b0111: seg = 7'b1111000; // 7
        4'b1000: seg = 7'b0000000; // 8
        4'b1001: seg = 7'b0010000; // 9
        default: seg = 7'b1111111; // Off


    endcase
end
always @* begin
    case (BCD_count_2)
        4'b0000: seg_2 = 7'b1000000; // 0
        4'b0001: seg_2 = 7'b1111001; // 1
        4'b0010: seg_2 = 7'b0100100; // 2
        4'b0011: seg_2 = 7'b0110000; // 3
        4'b0100: seg_2 = 7'b0011001; // 4
        4'b0101: seg_2 = 7'b0010010; // 5
        4'b0110: seg_2 = 7'b0000010; // 6
        4'b0111: seg_2 = 7'b1111000; // 7
        4'b1000: seg_2 = 7'b0000000; // 8
        4'b1001: seg_2 = 7'b0010000; // 9
        default: seg_2 = 7'b1111111; // Off
    endcase

	 
end


endmodule
