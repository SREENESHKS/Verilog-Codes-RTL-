`timescale 1ns / 1ps

module serialinserialout(in,clk,clear,out);
parameter N=4;
input in;
input clk,clear;
output out;
wire [N:0]f;
assign f[0]=in;
assign out=f[N];
genvar i;
generate for (i=0;i<N;i=i+1)
begin:shift
dffp do1 (f[i],clk,clear,f[i+1]);
end
endgenerate 
endmodule
module dffp(in,clk,clear,out);
input in,clk,clear;
output reg out;
always @(posedge clk)
begin
if(clear==1)
out<=1'b0;
else
out<=in;
end
endmodule
