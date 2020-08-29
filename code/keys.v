`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:00:46 01/30/2018 
// Design Name: 
// Module Name:    keys 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module keys(clk,in1,in2,score1,score2,key_flag);
    input clk,in1,in2,score1,score2;
	 output [3:0]key_flag;
	 //wire clk_20ms;
	 reg [3:0]key_scan;
	 reg [3:0]key_scan_r;
	 reg [19:0]cnt;
	 //divider count_20ms(.clk(clk),.clk_out(clk_20ms));
	 initial
	 begin
	    key_scan <= 4'b0000;
		 key_scan_r <= 4'b0000;
		 cnt <= 20'd0;
	 end
	 //20ms扫描按键
    always @ (posedge clk)	 
	 begin
	    if(cnt == 20'd999_999)
		   begin 
		    key_scan[3] <= in1;
		    key_scan[2] <= score1;
		    key_scan[1] <= score2;
		    key_scan[0] <= in2;
			 cnt<=20'd0;
		   end
		else
		    cnt<=cnt+20'd1;   		  
	 end
	 
	 // 保留前一次扫描结果
	 always @ (posedge clk)
	 begin
		  key_scan_r <= key_scan;
	 end
	 assign key_flag = key_scan_r[3:0] & (~key_scan[3:0]);
endmodule
