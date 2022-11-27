module Full_Adder(a, b, c_in, sum, carry);

input a, b;
input c_in;
output sum, carry;

wire w1, w2, w3;

Half_adder u_adder(.a(a), .b(b), .sum(w1), .carry(w2));
Half_adder u_adder2(.a(w1), .b(c_in), .sum(sum), .carry(w3));
or (carry, w2, w3);

endmodule
