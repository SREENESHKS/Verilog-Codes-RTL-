`timescale 1ns / 1ps

module comparator(a,b,aless,agreat,equal);
parameter N=4;
input [N-1:0]a,b;
output reg aless,agreat,equal;
always @(*) begin
agreat=0; aless=0;equal=0;
if (a>b) agreat=1'b1;
else if(a<b) aless=1'b1;
else equal=1'b1;
end
endmodule
