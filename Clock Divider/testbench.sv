// Code your testbench here
// or browse Examples
module tb;
  
  reg clk,reset;
  reg [3:0] div;
  wire f;
  
  counter x1(reset,clk,div,f);
  
  initial
    begin
      clk=0;
      reset=0;
      div=8;
      #2 reset=1;
      
      
    end
  
  always #5 clk=~clk;
  
  initial
    begin
      $monitor($time, "div:%d f: %b",div, f);
      $dumpfile("dump.vcd");
      $dumpvars(1);
      #200 $finish;
    end

  
endmodule