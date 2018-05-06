module zero_one_detector(input A, input clk, input rst, output Y);
  reg [1:0] state, nextstate;
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  always @ (posedge clk, posedge rst)
    if (rst) state <=  S0;
    else     state <= nextstate;
  always @ (*)
    case(state)
      S0: if (A) nextstate = S0;
          else   nextstate = S1;
      S1: if (A) nextstate = S2;
          else   nextstate = S0;
      S2: if (A) nextstate = S0;
          else   nextstate = S1;
      default:   nextstate = S0;
    endcase
  assign Y = (state == S2);
endmodule

module test_zero_one();
  reg clk, rst;
  reg A;
  wire Y;
  reg[15:0] i;
  reg [0:15] input_string;
  zero_one_detector dut(A,clk,rst,Y);
  always
    begin
      clk = 1; #30; clk = 0; #30;
    end
  initial begin
    input_string = 16'b0100000000000000;
    i = 0;
    rst = 1;
    #31;
    rst=0;
  end
  always @ (posedge clk)
    begin
      A = input_string[i];
    end
  always @ (negedge clk)
   if(~rst) begin
      $display("A = %d; Y = %b",A,Y);
      i = i + 1;
      if (i === 16) begin
        $display("Finished tests");
        $finish;
      end
    end
endmodule
