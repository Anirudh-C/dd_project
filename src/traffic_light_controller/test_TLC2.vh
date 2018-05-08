`include "traffic_light_controller.vh"
module test_TLC();
  reg clk, rst;
  reg TA, TB;
  wire RA, YA, GA, RB, YB, GB;
  wire [4:0] A, B;
  Traffic_sensor input_string (A,B,clk,rst);
  traffic_light_controller dut(TA,TB,clk,rst,RA,YA,GA,RB,YB,GB);
  always
    begin
      clk = 1; #5; clk = 0; #5;
    end
  initial begin
    rst = 1; #10; rst = 0;
    TA = A[0]; TB = B[0]; #10;
    $display("Input String from Traffic Sensors:");
    $display("TA = %b; TB = %b\n", A, B);
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);
    #10;
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);
    $display("----------------------");

    TA = A[1]; TB = B[1]; #10;
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);
    #10;
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);
    $display("----------------------");

    TA = A[2]; TB = B[2]; #10;
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);
    #10;
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);
    $display("----------------------");

    TA = A[3]; TB = B[3]; #10;
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);
    #10;
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);
    $display("----------------------");

    TA = A[4]; TB = B[4]; #10;
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);
    #10;
    $display("RA = %b, YA = %b, GA = %b", RA, YA, GA);
    $display("RB = %b, YB = %b, GB = %b\n", RB, YB, GB);

  $finish;
end
endmodule
