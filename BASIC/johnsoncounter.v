`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2025 13:52:11
// Design Name: 
// Module Name: ram
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


module john(clk,reset,out);
input clk,reset;
output  wire  [3:0]out;
wire q0,q1,q2,q3;

dffp ff1(.clk(clk),.reset(reset),.d(~q3),.q(q0));
dffp ff2(.clk(clk),.reset(reset),.d(q0),.q(q1));
dffp ff3(.clk(clk),.reset(reset),.d(q1),.q(q2));
dffp ff4(.clk(clk),.reset(reset),.d(q2),.q(q3));
assign out={q3,q2,q1,q0};
endmodule

module dffp(clk,reset,d,q);
input clk,reset,d;
output reg q;
always @(negedge clk or posedge reset)
begin
if(reset==1)
q<=0;
else
q<=d;
end
endmodule
