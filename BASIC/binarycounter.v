module bin(clk,reset,count);
input clk,reset;
output reg [3:0]count;
always @(posedge clk)
begin
if(reset==1) begin count=4'b0; end
else begin count=count+1; if(count==4'b1010) begin count=4'b0000; end 
end
end
endmodule
