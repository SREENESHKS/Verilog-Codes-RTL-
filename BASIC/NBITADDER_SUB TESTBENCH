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
reg cin;
wire [3:0]sum;
wire cout;
addersubtractor dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

initial begin
a=4'd5;
b=4'd7;
cin=1'b0;
#10
a=4'd1;
b=4'd2;
cin=1'b1;
#20
a=4'd10;
b=4'd1;
cin=1'b0;

#20 cin=1'b1;
#20 $finish;
end

endmodule
