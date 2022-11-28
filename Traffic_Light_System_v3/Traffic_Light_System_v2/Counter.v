module Counter(reset, count, clock_div);

input reset, clock_div;
output [3:0] count;

reg [3:0] count;

always @(posedge clock_div or negedge reset)
begin
	
	if(!reset)
		count <= 4'b1111;
	else
		count <= count - 4'b0001;
		
end

endmodule
