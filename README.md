# Digital Design Project
1. Moore Sequence Detector
- Implement a '01' sequence detector as a Moore Machine. Write a Verilog module of the form zero_one_detector(A, Y, clk, rst, S).
- Use a 2-bit state vector S to store the state.
- Also write a test bench test_zero_one() to test the module. The test bench should clearly indicate the working of the detector.
- Write a report with the input and output waveforms and the Verilog codes.

 **Note:**

 **Use idioms for the resettable flip-flop and label all states using parameter statements**
 
2. Traffic Light Controller
- Write a Verilog RTL module for a basic 4-state traffic_light_controller (without timeout).
   For two lanes A and B which cross each other, the traffic_light_controller must give a signal appropriate to the traffic in A and B
- This Controller shold take traffic sensor outputs TA and TB, which controls the signal using 6 outputs
  - RA, YA, GA &
  - RB, YB, GB
- Write a test bench test_TLC() with some assuming sequences of TA and TB to make sure that the controller works.
- To simulate the random traffic as seen by the sensors implement a 5-bit Linear Feedback Shift Register Traffic_sensor(T,rst,clk).
- Now modify the test bench to use teh LFSR's random outputs as the traffic sensor outputs.
- Write a report with the input and output waveforms and the Verilog codes.

 **Note:**

 **Use idioms for the resettable flip-flop and label all states using typedef statements**
