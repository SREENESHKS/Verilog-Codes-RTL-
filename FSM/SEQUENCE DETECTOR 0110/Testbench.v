module tb();
reg clk,in,reset;
wire out;
seq dut(.clk(clk),.in(in),.reset(reset),.out(out));
initial begin
clk=1'b0;
reset=1'b1;
#15 reset=1'b0;
end
always #5 clk=~clk;
initial begin
#12 in=0; #10 in=0; #10  in=1; #10 in=1;
#10 in=0; #10  in=1; #10 in=1;
#10 in=0; #10  in=0; #10 in=1;
#10 in=1; #10  in=0; #10 in=0;
#10 $finish;
end

endmodule
