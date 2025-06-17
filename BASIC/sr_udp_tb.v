`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2025 15:11:16
// Design Name: 
// Module Name: tb
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

module tb();
reg s ,r ,clk,clear;
wire out;
srffp dut(out,s,r,clk,clear);
initial begin
clk=0;
forever #10 clk=~clk;
end
initial begin
s=0;r=0;
clear=1;
#50 clear=0;
#20 s = 1; r = 0; // set
#20 s = 0; r = 1; // reset
#20 s = 1; r = 1; // set + reset 
#20 s = 0; r = 0; // back to normal
end
initial begin
$monitor("time %t : s = %b, r = %b, clear = %b, clk = %b, out = %b",$time, s, r, clear, clk, out);
end
endmodule
