class env_arbiter_scoreboard;
env_arbiter_transaction pkt1,pkt2;
mailbox #(env_arbiter_transaction)mon_sb;
mailbox #(env_arbiter_transaction)mon_sb2;

function new(mailbox #(env_arbiter_transaction)mon_sb,mailbox #(env_arbiter_transaction)mon_sb2);
this.mon_sb=mon_sb;
this.mon_sb2=mon_sb2;
endfunction

task run;
mon_sb.get(pkt1);
mon_sb2.get(pkt2);
assert(pkt1.grant==pkt2.grant)
begin
$display("Design is okay.");
end
else
begin
$display("Design is not okay.");
end
endtask
endclass