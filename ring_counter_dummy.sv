module ring_counter_dummy
//PORT DECLARATION
(input clock,reset,en,
 output reg [3:0] q);

//PROCEDURAL BLOCK
always@(posedge clock)
begin
	if(!reset)
		q<=4'b0001;
	else if(en)
		q<={q[2:0],q[3]};//LEFT SHIFTING
end
endmodule
