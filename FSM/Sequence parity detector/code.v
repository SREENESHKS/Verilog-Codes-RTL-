`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 21:17:36
// Design Name: 
// Module Name: pa
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


module pa(clk,in,s);
input clk,in;
output reg s;
reg state;
parameter even=0,odd=1;
always @(posedge clk)
case(state)
even : begin s<=in?1:0; //if in=true assign output s=1; coz it reached odd case
             state<=in?odd:even;
             end //if in=1 odd else even ie changin state
odd : begin s<=in?0:1; //if in=true assign output s=0; coz reached even case
            state<=in?even:odd;
            end
default : state<=even;
endcase
endmodule
