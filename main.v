module main(CLOCK_50,out,KEY0,KEY1,led);
	input CLOCK_50;
	input KEY0;
	input KEY1;
	reg clk;
	output wire out;
	output reg [7:0] led;
	reg [13:0] count; 
	reg [7:0] g=8'b00000000;
	reg [7:0] r=8'b00000000;
	reg [7:0] b=8'b00000000;
	always @( * )
	begin
	if(KEY0==0)
		begin
		count=0;
		end
	if(count>2500)
	begin
	clk=CLOCK_50;
	end
	else
	count=count+1;
	end
	
	always @(KEY1)
	begin 
	if(KEY1==0)
	begin
	g=g^(8'b11111111);
	r=r^(8'b11111111);
	b=b^(8'b11111111);
	led=g;
	end
	
	end
	send a (CLOCK_50,r,g,b,out);
endmodule 