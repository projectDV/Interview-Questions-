//============================1st Round================================
property p1;
    $rose(A) |=> ##[->0:5] $rose(B);
endproperty

time t;
property clock_chk;
    (1,t=$realtime)|=>(($realtime-t)==1ns);
endproperty

class sample;
    int arr[10];
    constraint c{unique{a};}
endclass

contraint c1{a>5}
contraint c2{a+b}

class base_pkt;
    virtual function void print();
        $display("base_pcket");
    endfunction
endclass
class small_packet extends base_pkt;
    function void print();
        $display("small_packet");
    endfunction 
endclass

class large_packet extends base_pkt;
    function void print();
        $display("large_packet");
    endfunction 
endclass
module top;
    base_pkt b=new();
    small_packet c=new();
    large_packet l=new();
    initial begin
        b.print();//base_packet
        c.print();//small_packet
        l.print();//large packet
        b=c;
        c=b;
        b.print();//small_packet
        b=l;
        b.print();//large_packet
    end
endmodule
create() and new()
raise and drop
seq_1.start(env.seqr_1);
p_seqr amd m_seqr
