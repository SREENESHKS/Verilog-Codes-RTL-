`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 21:37:53
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
reg clk,in;
wire s;
pa dut(.clk(clk),.in(in),.s(s));
initial begin clk=1'b0; end
always #5 clk=~clk;
initial begin 
#2 in=0;
#10 in=1;
#10 in=1;
#10 in=0;
#10 in=1;
#10 in=1;
#10 in=0;
#10 $finish;
end
endmodule
