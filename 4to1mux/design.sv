// Code your design here
module mux2to1(w0,w1,s,f);
  
  input w0,w1,s;
  output reg f;
  
  always@(*)
    if (s==0)
      f=w0;
  	else
      f=w1;
  
  
endmodule

module mux4to1(w,s,f);
  
  input [3:0]w;
  input [1:0]s;
  output f;
  wire [1:0]c;
  
  mux2to1 x1 (w[0],w[1],s[0],c[0]);
  
  mux2to1 x2 (w[2],w[3],s[0],c[1]);
    
  mux2to1 x3 (c[0],c[1],s[1],f);
  
  
endmodule