`define TimeExpire 32'd2500

module FrequencyDivider_m(reset, clk, clock_div); 

output clock_div;
input  clk, reset;

reg [31:0] count_t;
reg clock_div;

always @(posedge clk or negedge reset)
begin

	if(!reset)
		begin
			count_t <= 32'd0;
			clock_div <= 1'b0;
		end
	else
		begin
			if(count_t == `TimeExpire)
				begin 
					count_t <= 32'd0;
					clock_div <= ~clock_div;
				end
			else
				begin
					count_t <= count_t + 32'd1;
				end
		end

end

endmodule
