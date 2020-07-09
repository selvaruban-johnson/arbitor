module arbiter
(input clock,reset,ack,
 input [3:0] req,
 output [3:0] grant);
wire [15:0] priority_op_wire;
wire [3:0] token_wire;

ring_counter M1 (.clock(clock),.reset(reset),.enable(ack),.token(token_wire));

priority_logic M2 (.enable(token_wire[0]),.reset(reset),.in(req),.op(priority_op_wire[3:0]));

priority_logic M3 (.enable(token_wire[1]),.reset(reset),.in({req[0],req[3:1]}),.op(priority_op_wire[7:4]));

priority_logic M4 (.enable(token_wire[2]),.reset(reset),.in({req[1:0],req[3:2]}),.op(priority_op_wire[11:8]));

priority_logic M5 (.enable(token_wire[3]),.reset(reset),.in({req[2:0],req[3]}),.op(priority_op_wire[15:12]));

or M6 (grant[0],priority_op_wire[0],priority_op_wire[7],priority_op_wire[10],priority_op_wire[13]);

or M7 (grant[1],priority_op_wire[1],priority_op_wire[4],priority_op_wire[11],priority_op_wire[14]);

or M8 (grant[2],priority_op_wire[2],priority_op_wire[5],priority_op_wire[8],priority_op_wire[15]);

or M9 (grant[3],priority_op_wire[3],priority_op_wire[6],priority_op_wire[9],priority_op_wire[12]);

endmodule