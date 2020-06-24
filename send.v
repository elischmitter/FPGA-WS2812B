module send(CLOCK_50,red, green, blue,out);
	input CLOCK_50;
	reg [4:0] i=0;
	input [7:0] red;
	input [7:0] green;
	input [7:0] blue;
	output reg out;
	wire [23:0] data;
	reg [3:0] ii=4'h0;
	reg [5:0] counter = 6'h0;
	parameter T1H = 40;
	parameter T1L = 20;
	parameter T0H = 20;
	parameter T0L = 40;
   reg done=1;
	assign data={green,red,blue};
	always @(posedge CLOCK_50)
	begin
	if(i==5'b11111)
	begin 
	i=5'b10111;
	end
	if(done ==1) begin
	if(data[i] ==1)begin 
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
		done=0;
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
		done=0;
		end
		counter=counter+1;
	end 
	end
	else
	begin
	i=i-1;
	done=1;
	end
	
	end
endmodule 