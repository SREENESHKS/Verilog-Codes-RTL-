`timescale 1ns / 1ps

module srffps (s,r,clk,clear,preset,out);
input s,r,clk,clear,preset;
output  reg out;
always @(posedge clk or  posedge preset or posedge clear ) begin
if (clear==1'b1)
out<=0;
else if(preset==1'b1)
out<=1;
else
case({s,r})
2'b00: begin out<=out; end
2'b01:begin out<=0; end
2'b10:begin out<=1; end
2'b11:begin out<=1'bx;  end
endcase
end
endmodule
