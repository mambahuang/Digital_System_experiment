module Eight_to_Three_Encoder(in,out,valid);

parameter size = 8;
input[size-1:0] in;
output[2:0] out;
output valid;

reg[2:0] out;
reg valid;

always@(in)
begin
	case(in)
		8'b00000001: out = 3'b000;
		8'b00000010: out = 3'b001;
		8'b00000100: out = 3'b010;
		8'b00001000: out = 3'b011;
		8'b00010000: out = 3'b100;
		8'b00100000: out = 3'b101;
		8'b01000000: out = 3'b110;
		8'b10000000: out = 3'b111;
		default: out = 3'b000;
	endcase
	case(in)
		8'b00000001, 
		8'b00000010, 
		8'b00000100, 
		8'b00001000, 
		8'b00010000, 
		8'b00100000, 
		8'b01000000, 
		8'b10000000: valid = 1;
		default: valid = 0;
	endcase
end
endmodule

		