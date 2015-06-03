module adder_1_bit(
    input wire a,
    input wire b,
    input wire ci,
    output wire s,
    output wire co
);
    and (c1, a, b), (c2, b, ci), (c3, a, ci);
    xor (s1, a, b), (s, s1, ci);
    or (co, c1, c2, c3);

endmodule



