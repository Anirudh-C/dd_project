`include "traffic_light_controller.vh"
module test_TLC();
  reg clk, rst;
  reg TA, TB;
  wire RA, YA, GA, RB, YB, GB;
  traffic_light_controller dut(TA,TB,clk,rst,RA,YA,GA,RB,YB,GB);
  always
    begin
      clk = 1; #5; clk = 0; #5;
    end
  initial begin
    rst = 1; #10; rst = 0;
    $display("Initially traffic in both lanes A and B");
    TA = 1; TB = 1; #10;
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);
    #10;
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);
    $display("----------------------");

    $display("Now traffic in A but not in B");
    TA = 1; TB = 0; #10;
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);
    #10;
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);
    $display("----------------------");

    $display("Now traffic in B but not in A");
    TA = 0; TB = 1; #10;
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);
    #10;
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);
    $display("----------------------");

    $display("Now traffic in neither");
    TA = 0; TB = 0; #10;
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);
    #10;
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);

  $finish;
end
endmodule
