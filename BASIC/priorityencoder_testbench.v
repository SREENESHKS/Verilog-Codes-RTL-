module tb();
reg [7:0]in;
reg en;
wire [2:0]out;
priority dut(.in(in),.en(en),.out(out));
initial begin
en=1'b0;
#2 en=1'b1;
in=8'b00000000;
end
always #2 in=$random();
endmodule

//NB: HERE I DIRECTLY INCLUDED MY INPUT VALUES AS FOR 8:3 PRIORITY ENCODER
