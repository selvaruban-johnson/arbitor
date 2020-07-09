interface env_arbiter_rinterface (input bit clock,reset);
bit ack;
bit [3:0] req;
bit [3:0] grant;
endinterface