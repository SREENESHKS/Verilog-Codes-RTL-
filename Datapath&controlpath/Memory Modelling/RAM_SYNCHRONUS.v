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


module ram(clk,datain,dataout,addr,wr,read,chipselect);
input [7:0]datain;
input [9:0]addr;
input clk,wr,read,chipselect;
output reg [7:0]dataout;
reg [7:0] mem[1023:0];
always @(posedge clk) begin
if (chipselect==1) begin
       if(wr==1)
        mem[addr]<=datain;
       else if (read==1)
        dataout<=mem[addr];
end end
endmodule
