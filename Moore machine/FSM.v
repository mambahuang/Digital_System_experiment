module FSM(clock, reset, In, out);

input clock, reset, In;
output [6:0] out;

wire clock_div;
wire [3:0] tmp;

FrequencyDivider u_FreqDiv(.clk(clock), .reset(reset), .clock_div(clock_div));

moore_machine u_moore_machine(.clock_div(clock_div), .reset(reset), .In(In), .tmp(tmp));

SevenDisplay u_display(.in(tmp), .out(out));

endmodule
