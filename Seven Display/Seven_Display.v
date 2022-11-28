module Seven_Display(in,out);

input [3:0] in;
output [7:0] out;

reg [7:0] out;

always @(in)
begin

	case(in)
		4'b0000: out = 7'b1000000;
		4'b0001: out = 7'b1111001;
		4'b0010: out = 7'b0100100;
		4'b0011: out = 7'b1111000;
		4'b0100: out = 7'b0010000;
		4'b0101: out = 7'b0000011;
		4'b0110: out = 7'b0000011;
		4'b0111: out = 7'b0100001;
		4'b1000: out = 7'b0001110;
		default: out = 7'b1000000;
	endcase

end

endmodule
