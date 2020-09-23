// Code your testbench here
// or browse Examples

module tb;
  
  reg D,reset,clk;
  output Q;
  
  //instantiate
  D_ff ex(D,Q,reset,clk); 
 
  always #5 clk= ~clk;
  
  initial
    clk =0;
  
  
   
  
  initial
    begin
      #2 D=0;
      reset=1;
  
      repeat(10)
        begin
          #5;
          D=$random;
          reset=$random;
         // $display($time , " D: %b Q: %b reset: %b clk:%b",D,Q,reset,clk);
        end
      
    end
  
 initial
   begin
     $dumpfile("dump.vcd");
     $dumpvars(1);
    $monitor($time , " D: %b Q: %b reset: %b clk:%b",D,Q,reset,clk);
  	# 50 $finish;
   end
  

         
  
endmodule