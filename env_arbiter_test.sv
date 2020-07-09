module env_arbiter_test(env_arbiter_interface i,env_arbiter_rinterface ri);
env_arbiter_environment en;

initial
begin
en=new(i,ri);
en.build();
repeat(100)
begin
#10 en.run();
end
end
endmodule