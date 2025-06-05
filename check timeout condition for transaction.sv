//this snippet can also help is detecting timeout error when doing PA test where we can power down a system and start trasaction during this period.
//Timeout condition check for AXI
int timeout_count=0;
const int timeout_limit=100;

@(posedge clk)
while(!arredy && timeout_count<timeout_limit) begin
    timeout_count++;
end

if(timeout_count >= timeout_limit)
    `uvm_error("TIMEOUT ERROR");
