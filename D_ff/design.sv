// Code your design here
module D_ff (D,Q,reset,clk);
  input D;
  input clk;
  input reset;
  output reg Q;
 
  always @(posedge clk,reset)
    begin
    	if(reset==0)
          Q<= 0;
      	else
          Q<=D;
    end
  
  
endmodule      