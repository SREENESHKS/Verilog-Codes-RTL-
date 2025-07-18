
`timescale 1ns / 1ps

module tb;
reg clk,reset;
wire [3:0] count;
bin dut(.clk(clk),.reset(reset),.count(count));
initial begin
clk=1'b0;
reset=1'b1;
#7 reset=1'b0;
#100 $finish;
end
always #5 clk=~clk;
initial begin
$monitor("time=%0t,reset=%b,clk=%b,count=%b",$time,reset,clk,count);
end



endmodule
