class env_arbiter_driver;
env_arbiter_transaction pkt;
mailbox #(env_arbiter_transaction)gen_drv;
virtual env_arbiter_interface i;
virtual env_arbiter_rinterface ri;

function new (mailbox #(env_arbiter_transaction)gen_drv,virtual env_arbiter_interface i,virtual env_arbiter_rinterface ri);
this.gen_drv=gen_drv;
this.i=i;
this.ri=ri;
endfunction

task run;
gen_drv.get(pkt);
i.ack=pkt.ack;
i.req=pkt.req;
ri.ack=pkt.ack;
ri.req=pkt.req;
endtask
endclass