module Dot_matrix_controller(clk, rst, out_row, out_col);

input clk, rst;
output [7:0] out_row, out_col;

wire clk_div;

FrequencyDivider u_FreqDiv(.clk(clk), .rst(rst), .clock_div(clk_div));

Dot_matrix_display u_display(.clk_div(clk_div), .rst(rst), .dot_row(out_row), .dot_col(out_col));

endmodule
