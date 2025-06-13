module bintogray(in,out);
input [3:0]in;
output [3:0]out;
//BASED ON EQUATION IM DOING
xor G1(out[0],in[0] ,in[1]);
xor G2(out[1],in[1],in[2]);
xor G3(out[2],in[2],in[3]);
assign out[3]=in[3];

endmodule
