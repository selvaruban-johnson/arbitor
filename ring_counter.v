module ring_counter
(input clock,reset,enable,
 output reg [3:0] token);

always @ (posedge clock)
begin
	if (reset==1'b0)
	   token<=4'b0001;
   else if (enable==1'b1)
	   token<={token[2:0],token[3]};
	else
	   token<=token;
end
endmodule