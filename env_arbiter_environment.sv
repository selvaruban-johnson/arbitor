class env_arbiter_environment;
mailbox #(env_arbiter_transaction)gen_drv;
mailbox #(env_arbiter_transaction)mon_sb;
mailbox #(env_arbiter_transaction)mon_sb2;
virtual env_arbiter_interface i;
virtual env_arbiter_rinterface ri;
env_arbiter_generator g1;
env_arbiter_driver d1;
env_arbiter_monitor m1;
env_arbiter_coverage c1;
env_arbiter_scoreboard s1;

function new (virtual env_arbiter_interface i,virtual env_arbiter_rinterface ri);
this.i=i;
this.ri=ri;
endfunction

function build;
gen_drv=new();
mon_sb=new();
mon_sb2=new();
g1=new(gen_drv);
d1=new(gen_drv,i,ri);
m1=new(mon_sb,mon_sb2,i,ri);
s1=new(mon_sb,mon_sb2);
c1=new(i);
endfunction

task run;
fork
g1.run();
d1.run();
c1.sample();
m1.run();
s1.run();
join
endtask
endclass