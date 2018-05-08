`include "traffic_light_controller.vh"
module test_lfsr();
   reg clk, rst;
   wire [4:0] T1, T2;
   reg [4:0]  index;
   initial
     begin
        index = 4'b0;
        clk = 0;
        rst = 1;
        #15;
        rst = 0;
        #200;
     end
   always
     begin
        #5;
        clk = ~clk;
        index = index + 1;
        $display("T1 = %b", T1);
        $display("T2 = %b", T2);
        if(index === 5'b11111) begin
           $finish;
        end
     end
   Traffic_sensor dut(T1,T2,clk,rst);
endmodule
