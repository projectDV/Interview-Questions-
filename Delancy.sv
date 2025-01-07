//1. Swap 2 numbers
class sample;
	int temp,a,b;
	function void swap();
	temp=a;
	a=b;
	b=temp;
	endfunction
endclass

//2. Find the output for the below code
a=3;
b<=5;
c=a+b;
d<=a*b;
$display("%0d %0d %0d %0d",a,b,c,d);
$strobe("%0d %0d %0d %0d",a,b,c,d);

//3. Compiler Directives and what is the usecase of `ifdef?
`include
`timescale
`ifdef
`ifndef

//4. Tell the difference
new() and new[]

a=new();
trans txn=new[2];

//5. Contraint to generate 123454321
class sample;
	rand bit[8:0] a[];
	constraint c{foreach(a[i])
			if(i<5)
			a[i]=i;//12345
			else
			a[i]=9-i;}

//6. create a coverage for sig_a and sig_b. Additionaly, create coverage excluding 0 and 01.
sig_a-1 bit [1,0]//0
sig_b-2 bits[00,01,10,11]//01

  bit sig_a;
  bit[1:0]sig_b;
covergroup cg;
  coverpoint signal_a{bins low={0};
                      bins high={1};}
  coverpoint signal_b{bins low={2'b00};
                      bins mid_1={2'b01};
                      bins mid_2={2'b10};
                      bins high={2'b11};}
endgroup
covergroup cg_ignore;
  coverpoint signal_a{bins high={1};
                      ignore_bins low={0};}
  coverpoint signal_b{bins low={2'b00};
                      bins mid_1={2'b10};
                      bins high={2'b11};
                      ignore_bins mid_2={2'b01};}
endgroup

//7. How test is started? And why we require raise and drop objection?
class test_1 extends base_test;
phase.raise_objection
seq_1.start(env.seqr);
phase.drop_objection;
endclass

class test_2 extends base_test;
phase.raise_objection
seq_2.start(env.seqr);
phase.drop_objection;
endclass

//8. explain about uvm_config_db?
uvm_config_db[set and get]

//top
virtual interface vif;
uvm_config_db#(virtual interface)::set(Null,"*","VIF",vif);

//drv
tb_cfg cfg;
  uvm_config_db#(tb_cfg)::get(this,"","VIF",cfg);
  
//9. Difference between FF and Latch and what is race around condition?
//10. What is clocking block and why it is used?





