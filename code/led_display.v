`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:05:04 01/30/2018 
// Design Name: 
// Module Name:    led_display 
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
module led_display(led,clk,right,score,s,led_control);
   input clk,right;
	input [3:0]score;    //�������
	input [5:0]s;    //ƹ����켣
	input [3:0]led_control;    //LED�������
   output [3:0]led;    //
	reg [3:0]temp_led;    //
	reg [29:0]cnt;    //��˸Ƶ�ʿ���
	//wire clk_500ms;
	//divider #(24_999_999)count_500ms(.clk(clk),.clk_out(clk_500ms));
   initial
	begin
	   temp_led <= 4'b1111;
	   cnt <= 30'd0;
	end
	
	always@(posedge clk)
	begin
		case (led_control)
		//��ʾ����
		   4'b1000:  
			begin
				temp_led <= (~score);					
			end
		//��ʾ����Ȩ
			4'b0100:
			begin
				if(right)
					temp_led <= 4'b0111;
				else
					temp_led <= 4'b1110;
			end
		//��ʾ����˶��켣
			4'b0010:
			begin
				temp_led <= (~s[4:1]);
			end
		//������˸
			4'b0001:
			begin
				if(cnt==30'd24999999)//0.5��
				begin		
					temp_led <= (~temp_led);
					cnt <= 30'd0;
				end
				else
					cnt<=cnt+30'd1; 
		  	end
			default: temp_led <= 4'b1111;
		endcase			
	 end
	 assign led = {temp_led[0],temp_led[1],temp_led[2],temp_led[3]};
endmodule

