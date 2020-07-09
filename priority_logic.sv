module priority_logic
(input enable,reset,
 input [3:0] in,
 output reg [3:0] op);

always @ (reset,enable,in)
begin
	if(reset==1'b0)
	begin
		op=4'b0000;
	end
	else if(enable==1'b0)
		begin
			op=4'b0000;
		end
		else if(in[0]==1'b1)
			begin
				op=4'b0001;
			end
			else if(in[1]==1'b1)
				begin
					op=4'b0010;
				end
				else if(in[2]==1'b1)
					begin
						op=4'b0100;
					end
					else if(in[3]==1'b1)
						begin
							op=4'b1000;
						end
						else
						begin
							op=4'b0000;
						end
end
endmodule