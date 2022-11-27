module Add_full(sum, c_out, a, b, c_in);

input a,b,c_in;
output sum, c_out;
wire w1, w2, w3;

xor (w1,a,b);
and (w2,a,b);
xor (sum,w1,c_in);
and (w3,w1,c_in);
or (c_out,w2,w3);

endmodule
