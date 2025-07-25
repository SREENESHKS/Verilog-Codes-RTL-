`timescale 1ns / 1ps
module addersubtractor(a,b,cin,sum,cout);
parameter N=4;
input [N-1:0]a,b;
input cin;
output [N-1:0]sum;
output cout;
wire [N-1:0]t;
wire [N-2:0]f;
wire mod;
assign mod=cin;
xor1 x0(b[0],mod,t[0]);
xor1 x1(b[1],mod,t[1]);
xor1 x2(b[2],mod,t[2]);
xor1 x3(b[3],mod,t[3]);

fulladder fa0(a[0],t[0],cin,sum[0],f[0]);
fulladder fa1(a[1],t[1],f[0],sum[1],f[1]);
fulladder fa2(a[2],t[2],f[1],sum[2],f[2]);
fulladder fa3(a[3],t[3],f[2],sum[3],cout);
endmodule
module fulladder(a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;
assign sum=a^b^cin;
assign cout=(a&b)|(b&cin)|(cin&a);
endmodule
module xor1(b,k,out);
input b,k;
output out;
xor g1(out,k,b);
endmodule
//NB IN CASE OF SUBTRACTION IF COUT=0 MEANS BORROW AND COUT=1 MEANS NO BORROW
