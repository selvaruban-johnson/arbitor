class env_arbiter_coverage;
virtual env_arbiter_interface i;

covergroup cg @(posedge i.clock);
arbiter_req_CP: coverpoint i.req{ignore_bins req1 = {4'b0000};}
arbiter_grant_CP: coverpoint i.grant{bins grant1 = {4'b0000,4'b0001,4'b0010,4'b0100,4'b1000};}
arbiter_reset_ack_cross: cross i.reset,i.ack;
endgroup

function new (virtual env_arbiter_interface i);
this.i=i;
cg=new();
endfunction

task sample();
cg.sample();
endtask
endclass