// Code your design here
module seq_detector(clk, d, reset, Z); //0101 overlapping Moore
  
  input clk;
  input d;
  input reset;
  output reg Z;
  reg [2:0] y, Y;//states
  parameter SI =3'b000, S0=3'b001, S01=3'b010, S010=3'b011, S0101=3'b100;
  
  //combinational block
  
  always@(d,y)
      begin 
      case(y)
        SI: if (d==0)
              begin
                  Y=S0;
                  Z=0;
              end	
              else
              begin
                  Y=SI;
                  Z=0;
              end
        
        S0: if (d==0)
              begin
                  Y=S0;
                  Z=0;
              end	
              else
              begin
                  Y=S01;
                  Z=0;
              end
                
        S01: if (d==0)
              begin
                  Y=S010;
                  Z=0;
              end	
              else
              begin
                  Y=SI;
                  Z=0;
              end

        S010: if (d==0)
              begin
                  Y=S0;
                  Z=0;
              end	
              else
              begin
                  Y=S0101;
                  Z=0;
              end
        S0101: if (d==0)
              begin
                  Y=S010;
                  Z=1;
              end	
              else
              begin
                  Y=SI;
                  Z=1;
              end
        default:
          	begin
              Z=1'bz;
              Y=SI;
            end
      endcase
    end
  
      
      
      //seq block
      
  always@(posedge clk)
        y=Y;
  
  always@(negedge reset)
        y=SI;
      
endmodule
      

  		
  