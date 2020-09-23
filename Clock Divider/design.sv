// Code your design here
module counter(reset,clk,div,f);
  
  input reset, clk;
  input [3:0] div;
  output reg f;
  reg [3:0]counter_1;
  reg [3:0]counter_2;
  reg [3:0]counter;
  
  always@( reset)
    if (reset==0)
    begin
      f=0;
      counter_1=0;
      counter_2=0;
      counter=0;
    end

  
  always@(posedge clk)			// regular D ff cannot work as dual edge
    counter_1=counter_1+1;

  always@(negedge clk)
    counter_2=counter_2+1;
  
  
  always@(counter_1,counter_2)
    begin
    counter= counter_1 + counter_2;
      
      if(counter==div)
        begin
         // $display($time, " counter: %d", counter);
          counter=0;
          counter_1=0;
          counter_2=0;
          f=~f;
          
        end
    end      
                
endmodule
      
      
    
    
  


      