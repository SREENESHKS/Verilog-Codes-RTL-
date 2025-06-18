`timescale 1ns / 1ps
module traffic(clk,light);
input clk;
  output reg [0:2]light; //as output is 2bit variablee coz 3 states means 2 bits
parameter S0=0,S1=1,S2=2; 
parameter red=3'b100,green=3'b010,yellow=3'b001;
reg [0:1]state;
always @ (posedge clk)
case(state)//which state we are
S0:begin state<=S1; end // when clk comes when we are at s0 need to move to s1 which isn green
S1:begin state<=S2; end
S2:begin  state<=S0; end
default: begin state<=S0; end
endcase
always @ (state) //whenever state changes light shld also change
case(state)//which state we are
S0:begin light<=green; end // when clk comes when we are at s0 need to move to s1 which isn green
S1:begin light<=yellow; end
S2:begin light<=red;end
default: begin light<=red; end
endcase

endmodule
