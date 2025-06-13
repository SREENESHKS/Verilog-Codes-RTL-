`timescale 1ns / 1ps
module addersubtractor(a,b,cin,sum,cout);
parameter N=4;
input [N-1:0]a,b;
input cin;
output [N-1:0]sum;
output cout;
wire [N-1:0]t;
wire[N-2:0]f;
genvar i;
for (i = 0; i < N; i = i + 1) begin : ADD_SUB
xor1 xo(b[i], cin, t[i]);
if (i == 0) 
fulladder fa(a[i], t[i], cin, sum[i], f[i]);
else if (i < N-1) 
fulladder fa(a[i], t[i], f[i-1], sum[i], f[i]);//important coz her f[i-1] as f[i]=1 we want f[i-1]=f[0]
else 
fulladder fa(a[i], t[i], f[i-1], sum[i], cout);
end
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
