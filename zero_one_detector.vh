module zero_one_detector(input A, input clk, input rst, output Y);
  reg [2:0] state, nextstate;
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  always @ (posedge clk, posedge rst)
    if (rst) state <=  S0;
    else       state <= nextstate;
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
  reg A, Yexpected;
  wire Y;
  reg [31:0] vectornum, errors;
  reg [1:0]   testvectors[0:5];
  zero_one_detector dut(A,clk,rst,Y);
  always
    begin
      clk = 1; #5; clk = 0; #5;
    end
  initial begin
    $readmemb("test.tv", testvectors);
    vectornum = 0;
    errors = 0;
    rst = 1;
    #6;
    rst=0;
  end
  always @ (posedge clk)
    begin
      #11;
      {A, Yexpected} = testvectors[vectornum];
    end
  always @ (negedge clk)
    if (~rst) begin
      $display("%d: A = %b Yexpected = %b", vectornum, A, Yexpected);
      if(Y !== Yexpected) begin
        // $display("E: A = %b, Y = %b, Yexpected = %b", A, Y, Yexpected);
        errors = errors + 1;
      end
      vectornum = vectornum + 1;
      if (vectornum === 6) begin
        $display("%d tests completed with %d errors", vectornum, errors);
        $finish;
    end
  end
endmodule
