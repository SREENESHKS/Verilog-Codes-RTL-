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

reg in;
reg clk,clear;
wire out;
serialinserialout dut(.in(in),.clk(clk),.clear(clear),.out(out));
initial begin
clk=1'b0;
forever #5 clk=~clk;
end
initial begin
clear = 1;
in = 0;
#20;
clear = 0;

@(posedge clk);
in = 1;

@(posedge clk);
in = 0;

@(posedge clk);
in = 1;

@(posedge clk);
 in = 0; //im transmitting 1010

    #50;
    $finish;
end


endmodule
