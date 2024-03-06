module subtractor_4bit(
    input logic [3:0] a,
    input logic [3:0] b,
    output logic [3:0] diff,
    output logic carry_out,
    output logic overflow,
    output logic zero,
    output logic negative
);

    logic [3:0] temp_diff;

    function automatic void subtract(input logic [3:0] x, input logic [3:0] y, output logic [3:0] result, output logic cout, output logic ovf, output logic zer);
        logic [4:0] borrow;
        borrow[0] = 1'b0;
        borrow[1] = ~x[0] & y[0] | ~x[0] & borrow[0] | y[0] & borrow[0];
        borrow[2] = ~x[1] & y[1] | ~x[1] & borrow[1] | y[1] & borrow[1];
        borrow[3] = ~x[2] & y[2] | ~x[2] & borrow[2] | y[2] & borrow[2];
        borrow[4] = ~x[3] & y[3] | ~x[3] & borrow[3] | y[3] & borrow[3];
        result[0] = x[0] ^ y[0] ^ borrow[0];
        result[1] = x[1] ^ y[1] ^ borrow[1];
        result[2] = x[2] ^ y[2] ^ borrow[2];
        result[3] = x[3] ^ y[3] ^ borrow[3];
        cout = (x[3] & y[3] & ~result[3]) | (~x[3] & ~y[3] & result[3]);
        ovf = borrow[4];
        zer = (result == 4'b0);
    endfunction

    always_comb begin
        if (a >= b) begin
            subtract(a, b, temp_diff, carry_out, overflow, zero);
				negative = 1'b0;
        end else begin
            subtract(b, a, temp_diff, carry_out, overflow, zero);
				negative = 1'b1;
        end
        diff = temp_diff;
    end

endmodule