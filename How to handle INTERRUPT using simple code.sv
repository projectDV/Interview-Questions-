/****************C CODE***************************************************/
//Interrupt handler
//Activate Interrupt
//Trigger Interrupt
//Service Interrupt
//Clear Interrupt and flag it

#include<iostream.h>
#include<stdio.h>

/* Register and their corresponding pointers can also be mentioned as separate
#define BASE_ADDR_REG       0x00000000;
#define INTR_ENABLE_REG     (BASE_ADDR_REG + 0x4000000);
#define INTR_TRIGGER_REG    (BASE_ADDR_REG + 0x4000004);
#define INTR_CLEAR_REG      (BASE_ADDR_REG + 0x4000008);

//cast below pointers to above memory [memory mapping]
#define INTR_ENABLE         (*(volatile uint32_t*)(INTR_ENABLE_REG)); //This means INTR_ENABLE is pointing to INTR_ENABLE_REG's addr which is off 32 bits
#define INTR_TRIGGER        (*(volatile uint32_t*)(INTR_TRIGGER_REG));//Volatile means, there could be visits to and fro to this location so requesting compiler not to optimize this
#define INTR_CLEAR          (*(volatile uint32_t*)(INTR_CLEAR_REG)); //Lastly the outer * means dereference and enabling it to get the value stored within the specific addr
*/

#define INTR_ENABLE_REG     (*(volatile uint32_t*)0x4000000);
#define INTR_TRIGGER_REG    (*(volatile uint32_t*)0x4000004);
#define INTR_CLEAR_REG      (*(volatile uint32_t*)0x4000008);

volatile int interrupt_handled=0;

void __attribute__((interrupt)) my_isr(){
    interrupt_handled=1;
    INTR_CLEAR_REG=1;
    printf("ISR EXECUTED AND CLEARED");
}

int main(){
    printf("Interrupt test started");

    INTR_ENABLE_REG=1;
    INTR_TRIGGER_REG=1;


    while(!interrupt_handled)
    printf("Interrupt Cleared and Done");
    return 0
}
/********************************SV SIDE ***********************************************************/
module top;
    logic clk=0;
    logic rst=1;
    logic intr=0;

    //DUT
    mem_dut dut{
        .mem_clk(Clk),
        .mem_rst(rst),
        .interrupt(intr)
    };

    clk=0;
    forever
        clk=~clk;

    initial begin
        $display("starting INT test");
        rst=0;

        //wait for CPU to boot
        #100;

        intr=1;
        #10;
        intr=0;

        //wait for flag to high
        wait(dut.mem[32'h00000000]==32'h1);
        $display("PASS");
        $finish;
    end
endmodule 
    
