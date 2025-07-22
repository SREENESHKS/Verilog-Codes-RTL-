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


module demux(in,sel,out);
input in;
input [1:0]sel;
output reg [3:0]out;
always @(*) begin
out=4'b0000;
case(sel)
2'b00:out[0]=in;
2'b01:out[1]=in;
2'b10:out[2]=in;
2'b11:out[3]=in; endcase
end
endmodule
