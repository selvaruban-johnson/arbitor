class env_arbiter_monitor;
env_arbiter_transaction pkt1,pkt2;
mailbox #(env_arbiter_transaction)mon_sb;
mailbox #(env_arbiter_transaction)mon_sb2;
virtual env_arbiter_interface i;
virtual env_arbiter_rinterface ri;

function new (mailbox #(env_arbiter_transaction)mon_sb,mailbox #(env_arbiter_transaction)mon_sb2,virtual env_arbiter_interface i,virtual env_arbiter_rinterface ri);
this.mon_sb=mon_sb;
this.mon_sb2=mon_sb2;
this.i=i;
this.ri=ri;
endfunction

task run;
pkt1=new();
pkt2=new();

pkt1.ack=i.ack;
pkt1.req=i.req;
pkt1.grant=i.grant;

pkt2.ack=ri.ack;
pkt2.req=ri.req;
pkt2.grant=ri.grant;

$display($time," pkt1.ack=%0b pkt1.req=%0b pkt1.grant=%0b",pkt1.ack,pkt1.req,pkt1.grant);
$display($time," pkt2.ack=%0b pkt2.req=%0b pkt2.grant=%0b",pkt2.ack,pkt2.req,pkt2.grant);

mon_sb.put(pkt1);
mon_sb2.put(pkt2);
endtask
endclass