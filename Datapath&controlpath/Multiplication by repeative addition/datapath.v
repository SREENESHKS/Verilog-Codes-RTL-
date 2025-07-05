`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2025 15:44:32
// Design Name: 
// Module Name: datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module datapath(datain,clk,lda,ldb,ldp,clrp,decb,eqz,result);
input [15:0]datain;
input clk,lda,ldb,ldp,clrp,decb;
output  eqz;
output wire [15:0] result;
wire [15:0]bus,x,y,z,bout;
pipo1 A(x,bus,lda,clk);
pipo2 P(y,z,ldp,clrp,clk);
counter B(bout,bus,ldb,decb,clk);
add AD(z,x,y);
eqzero comp(eqz,bout);
assign bus=datain;
assign result=y;
endmodule

module pipo1(x,bus,lda,clk);
input [15:0] bus;
input clk,lda;
output reg [15:0]x;
always @(posedge clk)
begin
if(lda==1) begin x<=bus;  
end end
endmodule

module pipo2(y,z,ldp,clrp,clk);
input [15:0] z;
input ldp,clrp,clk;
output reg [15:0]y;
always @(posedge clk)
begin
if(clrp==1) y<=0;
else if(ldp==1) y<=z;
end
endmodule

module counter(bout,bus,ldb,decb,clk);
input [15:0]bus;
input ldb,decb,clk;
output reg [15:0]bout;
always @(posedge clk) begin
if(ldb==1) bout<=bus;
else if(decb==1) bout<=bout-1;
end 
endmodule

module add(z,x,y);
input [15:0]x,y;
output reg [15:0] z;
always @(*) begin z=x+y; end
endmodule

module eqzero(eqz,bout);
input [15:0]bout;
output eqz;
assign eqz=(bout==0); //means if bout==0 output=1 else ouput=0;
endmodule
