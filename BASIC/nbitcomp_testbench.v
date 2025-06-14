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

reg [3:0]a,b;
wire agreat,aless,equal;
comparator dut(.a(a),.b(b),.agreat(agreat),.aless(aless),.equal(equal));

initial begin
a=4'd5;
b=4'd7;

#10
a=4'd1;
b=4'd2;

#20
a=4'd10;
b=4'd1;

#20
a=4'd12;
b=4'd12;
#20 $finish;
end


endmodule
