module Counter(reset, Up_Down, count, clock_div);

input reset, Up_Down, clock_div;
output [3:0] count;

reg [3:0] count;

always @(posedge clock_div or negedge reset)
begin
	
	if(!reset)
		count <= 4'b0000;
	else
		begin
			if(Up_Down)
				
				count <= count + 4'b0001;

			else

				count <= count - 4'b0001;
		end
end

endmodule
