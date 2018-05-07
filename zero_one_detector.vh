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
