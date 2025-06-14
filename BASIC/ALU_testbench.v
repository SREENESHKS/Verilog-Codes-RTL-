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
reg [3:0]a,b;
reg[2:0]opt;
wire [3:0]out;
wire out2;
wire carry,overflow,sign,zero,parity;
alu dut(a,b,out2,opt,out,carry,overflow,sign,zero,parity);
 initial begin
 a=4'b0101;
 b=4'b1011;
 opt=3'b000;
 end
 always #5 opt=opt+1;
 
 
endmodule
