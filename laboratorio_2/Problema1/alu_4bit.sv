module alu_4bit(
    input logic [3:0] a,
    input logic [3:0] b,
    input logic [3:0] op,
    input logic start,
    output logic [6:0] s1,
    output logic [6:0] s2,
	 output logic NFlag,
    output logic ZFlag,
    output logic CFlag,
	 output logic VFlag
);
    logic [3:0] result;
	 logic add_CFlag, add_VFlag, add_ZFlag;
	 logic sub_CFlag, sub_VFlag, sub_ZFlag, sub_NFlag;
	 logic mul_VFlag, mul_ZFlag;
    wire [3:0] add_result;
    wire [3:0] sub_result;
    wire [3:0] mul_result;
	 
    wire [3:0] digit_1, digit_2;

    adder_4bit adder (a, b, add_result[3:0], add_CFlag, add_VFlag, add_ZFlag);
    subtractor_4bit subtractor (a, b, sub_result[3:0], sub_CFlag, sub_VFlag, sub_ZFlag, sub_NFlag);
    multiplier_4bit multiplier (a, b, mul_result[3:0], mul_VFlag, mul_ZFlag);
	 
	 DigitExtractor extractor(.input_number(result), .digit_1(digit_1), .digit_2(digit_2));
    segmentOutput segment1(.digit(digit_1), .seg(s1));
    segmentOutput segment2(.digit(digit_2), .seg(s2));

always_comb begin
    if (start) begin
        case (op)
            4'b0000: begin
                result = add_result;
                NFlag = 1'b0;
                ZFlag = add_ZFlag;
                CFlag = add_CFlag;
                VFlag = add_VFlag;
            end
            4'b0001: begin
                result = sub_result;
                NFlag = sub_NFlag;
                ZFlag = sub_ZFlag;
                CFlag = sub_CFlag;
                VFlag = sub_VFlag;
            end
            4'b0010: begin
                result = mul_result;
                NFlag = 1'b0;
                ZFlag = mul_ZFlag;
                CFlag = 1'b0;
                VFlag = mul_VFlag;
            end
            default: begin
                result = 4'b0000;
                NFlag = 1'b0;
                ZFlag = 1'b0;
                CFlag = 1'b0;
                VFlag = 1'b0;
            end
        endcase
    end else begin
        result = 4'b0000;
        NFlag = 1'b0;
        ZFlag = 1'b0;
        CFlag = 1'b0;
        VFlag = 1'b0;
    end
end
endmodule