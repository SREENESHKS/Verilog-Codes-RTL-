//PROBLEM STATEMENT
//Problem Statement: Design and Implementation of a 4-bit ALU Supporting Arithmetic, Logic, and Status Operations in Verilog
//To design and simulate a 4-bit Arithmetic Logic Unit (ALU) in Verilog HDL 
//that can perform various arithmetic, logical, comparison, and status flag operations based on a 3-bit operation code.
//The ALU accepts two 4-bit input operands a and b, and a 3-bit control signal opt that selects the operation.
//It produces a 4-bit result out, a 1-bit comparison result out2 for set-less-than, and several status flags: carry, overflow, sign, zero, and parity.




`timescale 1ns / 1ps

module alu(a,b,out2,opt,out,carry,overflow,sign,zero,parity);
parameter N=4;
input [N-1:0]a,b;
input [2:0]opt;
output reg [N-1:0]out;
output reg out2;
output reg carry,overflow,sign,zero,parity;

always @(*)
begin
out = 0;
out2 = 0;
carry = 0;
overflow = 0;
sign = 0;
zero = 0;
parity = 0;
case(opt)
3'b000:begin out=a&b; end
3'b001:begin {carry,out}=a+b; overflow = (a[N-1] & b[N-1] & ~out[N-1]) | (~a[N-1] & ~b[N-1] & out[N-1]);end
3'b011:begin {carry,out}=a-b; overflow = (a[N-1] & ~b[N-1] & ~out[N-1]) | (~a[N-1] & b[N-1] & out[N-1]);end //IMPORTANT EQUATION CHANGES
3'b100: begin out=a|b; end
3'b101:begin assign out2=(a<b)?1:0; end
3'b110:begin zero=~|out; parity=~^out; sign=out[N-1];end
default : begin out=4'b0000;end
endcase
end
endmodule
