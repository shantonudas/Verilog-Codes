// Code your testbench here
// or browse Examples
module tb;
  reg [3:0]w;
  reg [1:0]s;
  output f;
 
  mux4to1 tb(w,s,f);
  
  initial
    begin
      w=4'bxxxx;
      s=0;
      
      repeat(20)
        begin
          #5;
          w=$random;
          s=$random;
        end
    end
  
  initial
    begin
      $monitor($time, " W: %b S: %b f:%b", w,s,f);
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
  
endmodule
