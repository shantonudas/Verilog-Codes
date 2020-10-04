// Code your testbench here
// or browse Examples
`timescale 100ps/1ps
module testbench;
  reg clk,d,reset;
  wire Z;
  
  seq_detector x1(clk,d,reset,Z);
  
  always #5 clk=~clk;
  
  initial
    begin
      clk=0;
      reset=1;
      #5 reset =0;
      #10 d=1;
      #10 d=0;
      #10 d=1;
      #10 d=0;
      #10 d=1;
   	  #10 reset =0;
      #10 reset =1;
      #10 d=1;
      #10 d=0;
      #10 d=1;
      #10 d=0;
      #10 d=1;
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
      $monitor ($time, "d: %b  Z: %b reset: %b",d,Z,reset);
      #150 $finish;
    end
  
endmodule
  

  
      