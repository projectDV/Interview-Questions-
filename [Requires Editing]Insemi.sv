//Driver and sequence handshaking using code description
class driver extends uvm_driver#(txn);
    //fact_reg
    trans txn;
    virtual interface vif;
    uvm_tlm_port#(trans) get_port;
    driver_cfg;

    task run_phase(uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(txn);
            drive();
            seq_item_port.item_done(txn);
        end
    endtask
    task driver();
        fork
            @(vif.cb);
                vif.sig_a<=txn.sig_a;
        join_none        
endclass

class sequence_1 extends uvm_sequence#(uvm_sequence_item);
    //fact reg
    trans txn;
    task body();
        txn=new();
        start_item(txn);
        assert(txn.randomize() with txn.sig_a<10);
        finish_item(txn);
    endtask
endclass

p_sequencer and m_sequencer
active_agt
if(cfg.IS_ACTIVE);
//active agt
seqr
drv
mon
else
//passive
mon=monitor::type_id::create();

//mon
uvm_analysis_port#(txn)mon2sb;
//run_phase
    mon2sb.write(txn);
//SB
uvm_analysis_imp#(scoreboard,txn)mon2sb;
//ENV
monitor mon;
scoreboard sb;
//connect_phase
mon.mon2sb.connect(sb.mon2sb);
//top
//virtual interface vif;
int a=10;
uvm_config_db#(int)::set(NULL,"*","SET_A",a);

class sample;
    int i;
    real r=(4.5+5.8);
    i=int'(r);
endclass

virtual class abstract;
    pure virtual function void display();
    static int a;
endclass
class actual extends abstract;
    virtual function void display();
        $display("hello");
    endfunction 
endclass
//Write a constraint to generate 2,4,8,16,32,64,128....?  --
rand int arr[];
constraint c{foreach(a[i])
                a[i]==(2**i);}
 
//write constraint for even numbers --
rand int a;
constraint c{a%2==0;}

 
//a = 10,1,12,4,7,3,5  -- array in descending order  -- 
rand int a[];  
constraint dec{foreach(a[i])
                if(i>0)
                    arr[i]<arr[i-1];}           
 
//declare dynamic array. how you will resize this dynamic  array  with previous values of it  --  
int a[];
initial begin
    assert(a.size()==10);
end
 
 
//declare associative array. find index of value "10" in array a  -- 
int arr[int];
int index;
initial begin
    for()int i=0;i<10;i++) begin    
        index=$urandom(10);
        assert(arr.exists(index)==10);
    end

//declare queue. insert value "10" at 3rd index --
int q[$];
    initial begin;
        q={1,2,10,5,6,7};
    end

//Write constraint for fibonaci series  -
 
//randc without using randc -
rand bit[1:0] a
int q[$];
    constraint c{!(a inside q)}
    function post_randomize();
        q.pushback(a);
    endfunction

interface if();
    logic sig_a;

    clocking drv_cb@(posedge clk)
        default intput#1 output#1;
        output sig_a;
    endclocking 
    clocking mon_cb@(posedge clk)
        default intput#1 output#1;
        input sig_a;
    endclocking

    modport wrmp(clocking drv_cb); 
    modport monmp(clocking mon_cb); 
endinterface






