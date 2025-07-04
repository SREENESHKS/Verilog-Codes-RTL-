module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss); 

    initial begin hh<=8'h0; mm<=8'h0; ss<=8'h0; pm<=0; end

    always @(posedge clk)
        if (reset==1)
            begin hh<=8'h12; mm<=8'h0; ss<=8'h0; pm<=0; end
        else if (ena==1 && reset==0) begin
            if(ss[3:0] <4'h9) begin 
                ss[3:0]<=ss[3:0]+1; // means as BCD 12=0001 0010 if last 4 bit is less than 9 then secon increase like 13,14,15...
            end else begin 
                ss[3:0]<= 4'h0; // make last 4bit 0 
                if (ss[7:4]< 4'h5) begin 
                    ss[7:4]<= ss[7:4] + 1; // means if upper 4 bit is less than 5 [coz till 59] then add 1 to upper 4 bit
                end else begin 
                    ss<=8'h00; // if upper 4 bit is greather than 5  entire second goes to 000000 next is to increment minutes
                    if(mm[3:0] <4'h9) begin 
                        mm[3:0]<=mm[3:0]+1; 
                    end else begin 
                        mm[3:0]<= 4'h0; // make last 4bit 0 
                        if (mm[7:4]< 4'h5) begin 
                            mm[7:4]<= mm[7:4] + 1; 
                        end else begin 
                            mm<=8'h00; //next to increment hrs
                            if (hh == 8'h11) begin 
                                hh<= 8'h12; 
                                pm<=~pm; //need to toggle am and pm if we write pm=1 then it stay always 1 we want to become am if it become mornting agaian
                            end else if (hh == 8'h12) begin 
                                hh<=8'h01; 
                            end else begin 
                                if (hh[3:0] < 4'h9) begin 
                                    hh[3:0] <= hh[3:0] + 1;
                                end else begin 
                                    hh[3:0] <= 4'h0; 
                                    hh[7:4] <= hh[7:4] + 1;
                                end
                            end
                        end
                    end
                end
            end
        end

endmodule
