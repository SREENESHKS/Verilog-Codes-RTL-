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
reg clk;
wire [0:2]light;
traffic dut(.clk(clk),.light(light));
always #5 clk=~clk;
initial begin
clk=1'b0;
#50 $finish;
end
initial begin
$monitor($time,"R-G-Y:%b",light);
end
endmodule
