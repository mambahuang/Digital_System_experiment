module Counter(reset, Up_Down, count, clock_div);

input reset, Up_Down, clock_div;
output [3:0] count;

reg [3:0] count;

always @(posedge clock_div or negedge reset)
begin
	
	if(!reset)
		count = 4'b0;
	else
		begin
			if(Up_Down)
				begin
					if(count == 4'b1111)
						count = 4'b0000;
					else
						count = count + 4'b0001;
				end
			else
				begin
					if(count == 4'b0000)
						count = 4'b1111;
					else
						count = count - 4'b0001;
				end
		end
end

endmodule

