class env_arbiter_generator;
env_arbiter_transaction pkt;
mailbox #(env_arbiter_transaction)gen_drv;

function new (mailbox #(env_arbiter_transaction)gen_drv);
this.gen_drv=gen_drv;
endfunction

task run;
pkt=new();
assert(pkt.randomize())
begin
$display("Randomization successful.");
gen_drv.put(pkt);
end
else 
$display("Randomization failure.");
endtask
endclass