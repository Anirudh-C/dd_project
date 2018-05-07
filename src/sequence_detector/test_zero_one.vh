`include "zero_one_detector.vh"
module test_zero_one();
   reg clk, rst;
   reg A, Yexpected;
   wire Y;
   zero_one_detector dut(A,clk,rst,Y);
   always
     begin
        clk = 1; #5; clk = 0; #5;
     end
   initial begin
      rst = 1;
      #6;
      rst=0;
      A = 0; Yexpected = 0; #10;
      if (Y !== Yexpected) begin
          $display("E: A = %b, Yexpected = %b, Y = %b",A,Yexpected,Y);
      end
      else $display("D: A = %b, Yexpected = %b, Y = %b",A,Yexpected,Y);

      A = 1; Yexpected = 1; #10;
      if (Y !== Yexpected) begin
          $display("E: A = %b, Yexpected = %b, Y = %b",A,Yexpected,Y);
      end
      else $display("D: A = %b, Yexpected = %b, Y = %b",A,Yexpected,Y);

      A = 0; Yexpected = 0; #10;
      if (Y !== Yexpected) begin
          $display("E: A = %b, Yexpected = %b, Y = %b",A,Yexpected,Y);
      end
      else $display("D: A = %b, Yexpected = %b, Y = %b",A,Yexpected,Y);

      A = 1; Yexpected = 1; #10;
      if (Y !== Yexpected) begin
          $display("E: A = %b, Yexpected = %b, Y = %b",A,Yexpected,Y);
      end
      else $display("D: A = %b, Yexpected = %b, Y = %b",A,Yexpected,Y);

      A = 1; Yexpected = 0; #10;
      if (Y !== Yexpected) begin
          $display("E: A = %b, Yexpected = %b, Y = %b",A,Yexpected,Y);
      end
      else $display("D: A = %b, Yexpected = %b, Y = %b",A,Yexpected,Y);

      A = 0; Yexpected = 0; #10;
      if (Y !== Yexpected) begin
          $display("E: A = %b, Yexpected = %b, Y = %b",A,Yexpected,Y);
      end
      else $display("D: A = %b, Yexpected = %b, Y = %b",A,Yexpected,Y);

      A = 0; Yexpected = 0; #10;
      if (Y !== Yexpected) begin
         $display("E: A = %b, Yexpected = %b, Y = %b",A,Yexpected,Y);
      end
      else $display("D: A = %b, Yexpected = %b, Y = %b",A,Yexpected,Y);
      $finish;

     end
endmodule
