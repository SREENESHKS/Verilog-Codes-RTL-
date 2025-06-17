`timescale 1ns / 1ps

primitive srffp(out,s,r,clk,clear);
output reg out;
input s,r,clk,clear;
initial
out=0;
table
// s   r   clk  clear   q    qn+1
   ?   ?    ?     1   : ?   :  0;
   ?   ?    ?     (10)  : ?   :  -;
   0   0   (01)    0   : ?   :  -;
   0   1    (01)    0   : ?   :  0;
   1   0    (01)    0   : ?   :  1;
   1   1    (01)    0   : ?   :  x;
   ?   ?    (10)    0   : ?   :  -;
   endtable 
endprimitive 
