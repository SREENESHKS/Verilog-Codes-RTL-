`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2025 16:15:42
// Design Name: 
// Module Name: controlpath
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


module controlpath(lda,ldb,ldp,clrp,decb,clk,start,done,eqz);
input clk,start,eqz;
output reg lda,ldb,clrp,ldp,decb,done;
reg [2:0] state;
parameter s0=0,s1=1,s2=2,s3=3,s4=4;
always @(posedge clk)
begin
case(state)
s0 : if(start==1) state<=s1;
s1 : state<=s2;
s2 : state<=s3;
s3 : #2 if(eqz==1) state<=s4; else state<=s3;
s4 : state<=s4;
default : state<=s0;
endcase
end
always @(state)
begin
case(state)
s0 : begin  lda=0; ldb=0;ldp=0;clrp=0;decb=0;done=0; end
s1 : begin  lda=1; ldb=0;ldp=0;clrp=0;decb=0;done=0; end
s2 : begin  lda=0; ldb=1;ldp=0;clrp=1;decb=0;done=0; end
s3 : begin  lda=0; ldb=0;ldp=1;clrp=0;decb=1;done=0; end
s4 : begin  lda=0; ldb=0;ldp=0;clrp=0;decb=0;done=1; end
default : begin lda=0; ldb=0;ldp=0;clrp=0;decb=0;done=0; end
endcase
end
endmodule


