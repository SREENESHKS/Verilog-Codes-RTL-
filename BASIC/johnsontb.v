`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2025 13:59:39
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


`timescale 1ns / 1ps

module tb;
reg clk,reset;
wire [3:0]out;
john dut(.clk(clk),.reset(reset),.out(out));
initial begin
clk=0;
reset=1;
#3 reset=0;
#100 $finish;
end
always #5 clk=~clk;
initial begin
$monitor("%0t: out = %b", $time, out);
end

endmodule

