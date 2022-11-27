module moore_machine(clk_div, count, reset, tmp);

input reset, clk_div;
output [1:0] tmp;
output [3:0] count;

reg [1:0] state, nextstate;
reg [3:0] count;
reg [1:0] tmp; // output data

parameter s0 = 2'b00,
			 s1 = 2'b01,
			 s2 = 2'b10;

always @(posedge clk_div or negedge reset)
	begin
		if(!reset)
			begin
				state <= s0;
				count <= 4'b1111;
			end
		else
			if(count == 4'b0000)
				begin
					state <= nextstate;
					count <= count - 4'b0001;
				end
			else
				case(state)
				
					s0: count <= count - 4'b0001;
						 
					s1: begin
							 if(count == 4'b1011)
								count <= 4'b0000;
							 else
								count <= count - 4'b0001;
						 end
						 
					s2: begin
							 if(count == 4'b0110)
								count <= 4'b0000;
							 else
								count <= count - 4'b0001;
						 end
						 
				endcase
	end


always @(count)
	begin
		case(state)
			s0: begin
				if(count == 4'b0000)
					nextstate = s1;
				else
					tmp = 2'b00;
				 end
			s1: begin
				if(count == 4'b0000)
					nextstate = s2;
				else
					tmp = 2'b01;
				 end
			s2: begin
				if(count == 4'b0000)
					nextstate = s0;
				else
					tmp = 2'b10;
				 end
		endcase
	end

endmodule
