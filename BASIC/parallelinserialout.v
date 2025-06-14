`timescale 1ns / 1ps

module parallelinserialout(shld,b,clk,clear,out);
parameter N=4;
input shld,clk,clear;
input [N-1:0]b;
output  out;
wire [N-1:0]t;//triocircuit out wires
wire [N-1:0]d;//dffp out wires

triocircuit t1h(1'b0,shld,b[0],t[0]);
triocircuit t2h(d[0],shld,b[1],t[1]);
triocircuit t3h(d[1],shld,b[2],t[2]);
triocircuit t4h(d[2],shld,b[3],t[3]);
dffp d1h(t[0],clk,clear,d[0]);
dffp d4h(t[1],clk,clear,d[1]);
dffp d3h(t[2],clk,clear,d[2]);
dffp d2h(t[3],clk,clear,d[3]);
assign out=d[3];

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
module triocircuit(a,b,c,out);
input a,b,c;
output out;
wire t1,t2;
and g1(t1,a,b), g2(t2,~b,c);
or g3(out,t1,t2);
endmodule
