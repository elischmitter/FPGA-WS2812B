
module Sendbit(Clock_50,in,out);
	input Clock_50;
	input in;
	output reg out;
	reg [5:0] counter = 6'h0;
	parameter T1H = 40;
	parameter T1L = 20;
	parameter T0H = 20;
	parameter T0L = 40;
	always@(posedge Clock_50)
	begin
	if(in ==1)begin 
		if(counter<=T1H)
		begin 
		out=1;
		end
		if(counter<=(T1L+T1H)&& counter >T1H)
		begin
		out=0;
		end
		if(counter>(T1L+T1H))
		begin
		counter=0;
		end
		counter=counter+1;
	end

	else
	begin 
			if(counter<=T0H)
		begin 
		out=1;
		end
		if(counter<=(T0L+T0H)&& counter >T0H)
		begin
		out=0;
		end
		if(counter>(T0L+T0H))
		begin
		counter=0;
		end
		counter=counter+1;
	end
	end
endmodule
