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

reg shld;
reg [3:0]b;
reg clk,clear;
wire out;
parallelinserialout dut(.shld(shld),.b(b),.clk(clk),.clear(clear),.out(out));
initial begin
clk=1'b0;
forever #5 clk=~clk;
end
initial begin
    $display("Time\tclk\tclear\tshld\tb\tout");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk, clear, shld, b, out);
end

initial begin
clear = 1;
shld = 0;
b = 4'b0000;
 #10 clear = 0;    
 b = 4'b1010;        // parallel input
 #10 shld = 1;      
 #10 shld = 0;      
    #40 $finish;
end
endmodule
