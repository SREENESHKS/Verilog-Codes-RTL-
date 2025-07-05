`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2025 16:24:10
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
reg [15:0]datain;
reg clk,start;
wire done;
wire [15:0] result;
wire lda, ldb, ldp, clrp, decb, eqz;

datapath dut(datain,clk,lda,ldb,ldp,clrp,decb,eqz,result);
controlpath dut1(lda,ldb,ldp,clrp,decb,clk,start,done,eqz);
initial begin clk=1'b0; #3 start=1; #1000 $finish; end
always #5 clk=~clk;
initial begin
  wait(lda == 1); // Wait until A is being loaded
  datain = 24;
  @(negedge clk); // holdvalue
  @(posedge clk);

  wait(ldb == 1);// Wait until B is being loaded
  datain = 4;
  @(negedge clk);// Hold value
  @(posedge clk);

  datain = 0; // Reset input afterward to avoid accidental reuse again
end
initial begin
  $monitor("Time = %0t | Result = %d | Binary = %b", $time, result, result);
end
endmodule


