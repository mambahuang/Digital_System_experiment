module sequential_circuit(out, clk, reset, Up_Down);

input clk, reset, Up_Down;

wire clock_div;
wire [3:0] count;

output [6:0] out;

FrequencyDivider u_FreqDiv(.clk(clk), .reset(reset), .clock_div(clock_div));

Counter u_counter(.clock_div(clock_div),.Up_Down(Up_Down), .reset(reset), .count(count));

SevenDisplay u_display(.in(count), .out(out));

endmodule
