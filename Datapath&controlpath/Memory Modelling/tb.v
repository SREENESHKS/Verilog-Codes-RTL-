`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2025 13:59:39
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


`timescale 1ns / 1ps

module tb;
    reg clk;
    reg wr, read, chipselect;
    reg [7:0] datain;
    reg [9:0] addr;
    wire [7:0] dataout;
    ram dut ( .clk(clk),.datain(datain),.dataout(dataout),.addr(addr), .wr(wr), .read(read), .chipselect(chipselect)
    );
    always #5 clk=~clk;  // 10ns clock period

    // Internal array to store expected values for comparison
    reg [7:0] expected_data [0:9];

    integer i;

    initial begin
        clk= 0;
        wr= 0;
        read= 0;
        chipselect= 0;
        addr= 0;
        datain= 0;

        $display(" Starting RAM test...");
        //TO WRITE
        for (i = 0; i < 10; i = i + 1) begin
            @(posedge clk);
            addr = i;
            datain = $random % 256;
            expected_data[i] = datain; //like expecteddata[0]= a random data input
            wr = 1;
            chipselect = 1;
        end
        @(posedge clk);
        wr = 0;
        chipselect = 0;

        // READ PHASEE
        for (i = 0; i < 10; i = i + 1) begin
            @(posedge clk);
            addr = i;
            read = 1;
            chipselect = 1;
            @(posedge clk); // wait for output to stabilize
            $display("ADDR =%0d | WRITTEN =%0d | READ =%0d ", addr, expected_data[i], dataout,);
            read = 0;
            chipselect = 0;
        end

        $display(" Testcompleted.");
        $finish;
    end

endmodule

