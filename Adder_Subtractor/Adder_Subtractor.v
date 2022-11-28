module Adder_Subtractor(a,b,select,out,overflow);

parameter size=4;
input [size-1:0]a,b;
input select;
output [size-1:0]out;
output overflow;

reg[size-1:0]out;
reg overflow;

always@(a or b or select)
begin
	
	out = (select==1)?a+b:a-b;
	if(a+b>=16 && select == 1)
		overflow = 1;
	else if(a<b && select == 0)
		overflow = 1;
	else 
		overflow = 0;
		
end
endmodule


/*
out = (select==1)?a+b:a-b;
if(a+b>8 && select == 1)begin
		overflow = 1;
	end else if(a<b && select == 0)begin
		overflow = 1;
	end else begin
		overflow = 0;
	end
*/