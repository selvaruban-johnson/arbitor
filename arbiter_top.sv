module arbiter_top;
bit clock,reset;

//Clock generation
initial
begin 
clock = 1'b0;
forever
#5 clock = ~clock;
end

//Reset generation
initial 
begin
reset=1'b0;
#10;
reset=1'b1;
#50;
reset=1'b0;
#10;
reset=1'b1;
end

env_arbiter_interface i(clock,reset);
env_arbiter_rinterface ri(clock,reset);
env_arbiter_test T(i,ri);

//DUT Instantiation synthesizable 
arbiter DUT(.clock(clock),.reset(reset),.ack(i.ack),.req(i.req),.grant(i.grant));

//Dummy DUT simulatable code
arbiter_dummy DUMMY(.clock(clock),.reset(reset),.ack(ri.ack),.req(ri.req),.grant(ri.grant));
endmodule