module tb();
reg [3:0]in;
wire [3:0]out;
bintogray dut(.in(in),.out(out));
initial begin
in=4'b0000;
end
always #2 in=$random();
endmodule
