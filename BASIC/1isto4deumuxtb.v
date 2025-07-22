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
reg in;
reg [1:0]sel;
wire [3:0]out;
demux dut(.in(in),.sel(sel),.out(out));
initial begin
in=1'b0;
sel=2'b00;
#10 in=1'b1;
#18 in=1'b0;
#100 $finish;
end
always #5 sel=sel+1;
initial begin
$monitor("%0t: in=%b ,sel=%b,out=%b", $time,in,sel, out);
end

endmodule

