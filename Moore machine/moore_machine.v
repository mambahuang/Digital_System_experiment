module moore_machine(In, clock_div, reset, tmp);

input In, clock_div, reset;
output [3:0] tmp;

reg [2:0] state, nextstate;
reg [3:0] tmp; // output data

parameter s0 = 3'b000,
			 s1 = 3'b001,
			 s2 = 3'b010,
			 s3 = 3'b011,
			 s4 = 3'b100,
			 s5 = 3'b101;

always @(posedge clock_div or negedge reset)
	begin
		if(!reset)
			state <= s0;
		else
			state <= nextstate;
	end


always @(In or state)
	begin
		case(state)
			s0: begin
				if(In == 0)
					nextstate = s1;
				else
					nextstate = s3;
				 end
			s1: begin
				if(In == 0)
					nextstate = s2;
				else
					nextstate = s5;
				 end
			s2: begin
				if(In == 0)
					nextstate = s3;
				else
					nextstate = s0;
				 end
			s3: begin
				if(In == 0)
					nextstate = s4;
				else
					nextstate = s1;
				 end
			s4: begin
				if(In == 0)
					nextstate = s5;
				else
					nextstate = s2;
				 end
			s5: begin
				if(In == 0)
					nextstate = s0;
				else
					nextstate = s4;
				 end
		endcase
	end


always @(state)
	begin 
		case(state)
			s0: tmp = 4'b0000;
			s1: tmp = 4'b0001;
			s2: tmp = 4'b0010;
			s3: tmp = 4'b0011;
			s4: tmp = 4'b0100;
			s5: tmp = 4'b0101;
		endcase
	end


endmodule
