`timescale 1 ns/10 ps
module tb(out);
	reg clk;
   output out;
	localparam period = 20;
	reg [7:0] g=8'b00000000;
	reg [7:0] r=8'b00000000;
	reg [7:0] b=8'b00000000;
	reg [8:0] count=0;
	reg E=1'b0;
	always 
	begin
	clk = 1'b1; 
	#20; // high for 20 * timescale = 20 ns
	
	clk = 1'b0;
	#20; // low for 20 * timescale = 20 ns
	end
	always @(posedge clk)
	begin
	count<=count+1;
	$diplay("%d",count);
	if(count==250)
		E<=E^1;
		count<=0;
	end
	send a (clk,red, green, blue,out,E);
endmodule 