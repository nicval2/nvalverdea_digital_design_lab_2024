module alu_4bit(
    input logic [1:0] a,
    input logic [1:0] b,
    input logic [1:0] op,
    input logic start,
    output logic [6:0] s1
);
    logic [7:0] result;
    wire [2:0] add_result;
    wire [2:0] sub_result;
    wire [3:0] mul_result;
	 
    wire [0:0] digit_1;

    adder_4bit adder (a, b, add_result[2:0]);
    subtractor_4bit subtractor (a, b, sub_result[2:0]);
    multiplier_4bit multiplier (a, b, mul_result[3:0]);
	 
	 DigitExtractor extractor(.input_number(result), .digit_1(digit_1));
    segmentOutput segment1(.digit(digit_1), .seg(s1));

    always_comb begin
    if (start) begin
        case (op)
            2'b00: result <= add_result[2] ? add_result[1:0] : {3'b0, add_result[1:0]}; // Zero-extend add_result to 8 bits only if it's 4 bits
            2'b01: result <= {2'b0, sub_result[1:0]}; 
            2'b10: result <= mul_result;
            default: result <= 8'b00000000;
        endcase
    end else begin
        result <= 8'b00000000;
    end
end

endmodule