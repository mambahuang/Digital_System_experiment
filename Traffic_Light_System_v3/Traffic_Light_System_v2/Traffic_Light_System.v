module Traffic_Light_System(clk, rst, out_seven, out_row, out_col);

input clk, rst;
output [6:0] out_seven;
output [7:0] out_row, out_col;

wire clk_div_s, clk_div_m;
wire [1:0] out_state;
wire [3:0] count;

FrequencyDivider_m u_Frediv_m(.clk(clk), .reset(rst), .clock_div(clk_div_m));

FrequencyDivider_s u_Frediv_s(.clk(clk), .reset(rst), .clock_div(clk_div_s));

moore_machine u_moore(.clk_div(clk_div_s), .reset(rst), .count(count), .tmp(out_state));

SevenDisplay u_sevendisplay(.in(count), .out(out_seven), .state(out_state));

Dot_matrix_display u_matrix_display(.clk_div_m(clk_div_m), .state(out_state), .dot_row(out_row), .dot_col(out_col));

endmodule
