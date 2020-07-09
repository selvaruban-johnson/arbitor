interface env_arbiter_interface (input bit clock,reset);
bit ack;
bit [3:0] req;
bit [3:0] grant;
endinterface