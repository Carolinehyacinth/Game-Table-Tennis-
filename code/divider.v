`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:13:40 01/31/2018 
// Design Name: 
// Module Name:    divider 
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
module divider(clk,clk_out);
    parameter timer = 999_999;
	 input clk;
	 output clk_out;
	 reg [31:0]count = 32'd0;
	 reg clk_out = 1'b0;
	 always @ (posedge clk)
	 begin
        if(count == timer)
        begin
		      count <= 32'd0;
				clk_out <= 1'b1;
        end	
        else
        begin
		      count <= count + 32'd1;
				clk_out <= 1'b0;
        end		  
	 end
endmodule

