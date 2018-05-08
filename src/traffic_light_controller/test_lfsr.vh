`include "traffic_light_controller.vh"
module test_lfsr();
   reg clk, rst;
   wire [4:0] T;
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
        $display("T = %b", T);
        if(index === 5'b11111) begin
           $finish;
        end
     end
   Traffic_sensor dut(T,clk,rst);
endmodule
