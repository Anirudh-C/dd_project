module traffic_light_controller(input TA, TB, clk, rst, output RA, YA, GA, RB, YB, GB);
  reg [1:0] state, nextstate;
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  parameter S3 = 2'b11;
  always @ (posedge clk, posedge rst)
    if (rst) state <=  S0;
    else       state <= nextstate;
  always @ (*)
    case(state)
      S0: if (TA) nextstate = S0;
      else   nextstate = S1;
      S1:        nextstate = S2;
      S2: if (TB) nextstate = S2;
      else   nextstate = S3;
      S2:        nextstate = S0;
      default:   nextstate = S0;
    endcase
   // output logic
   assign RA = (state == S2 | state == S3);
   assign YA = (state == S1);
   assign GA = (state == S0);
   assign RB = (state == S0 | state == S1);
   assign YB = (state == S3);
   assign GB = (state == S2);
endmodule
