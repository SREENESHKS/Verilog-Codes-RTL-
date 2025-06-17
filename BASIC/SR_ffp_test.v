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
reg s ,r ,clk,clear,preset;
wire out;
srffps dut(.s(s),.r(r),.clk(clk),.clear(clear),.preset(preset),.out(out));
initial begin
clk=0;
forever #10 clk=~clk;
end
initial begin
s=0;r=0;
clear=1;
preset=0;
#25 clear=0; 
#20 s = 1; r = 0; // Set
#20 s = 0; r = 1; // Reset
#20 s = 1; r = 1; // SET + reset 
#20 s = 0; r = 0; //Normal
#20 clear=1;
#10 clear=0;
#20 preset=1;
#10 preset=0;
#40 s=0; r=0;  //TO Hold 
end
initial begin
$monitor("time %t : s = %b, r = %b, clear = %b, clk = %b,preset=%b out = %b",$time, s, r, clear, clk,preset, out);
end
endmodule
