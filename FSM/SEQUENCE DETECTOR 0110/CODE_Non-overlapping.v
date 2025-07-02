`timescale 1ns / 1ps
module seq(clk,in,reset,out);
input clk,in,reset;
output reg out;
parameter S0=0,S1=1,S2=2,S3=3;
reg [0:1] presentstate,nextstate;
always @(posedge clk or posedge reset)
if(reset==1)
presentstate<=S0;
else
presentstate<=nextstate;
always @( presentstate,in)
case(presentstate)
S0 : begin out=in?0:0; nextstate=in?S0:S1; end
S1 : begin out=in?0:0; nextstate=in?S2:S1; end
S2 : begin out=in?0:0; nextstate=in?S3:S1; end
S3 : begin out=in?0:1; nextstate=S0; end //MEANS NON-OVERLAPPING CASE
endcase
endmodule
