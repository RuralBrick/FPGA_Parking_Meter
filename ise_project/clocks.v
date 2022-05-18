`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:11:40 05/18/2022 
// Design Name: 
// Module Name:    clocks 
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
module clocks(
    input clk,
    input rst,
    output reg clk_1Hz,
	output reg clk_fast,
    output reg clk_blink
    );

	reg [31:0] count_1Hz = 0;
	reg [31:0] count_fast = 0;
	reg [31:0] count_blink = 0;
	
	always @(posedge rst or posedge clk) begin
		if (rst) begin
			count_1Hz <= 0;
			count_fast <= 0;
			count_blink <= 0;
			clk_1Hz <= 0;
			clk_fast <= 0;
			clk_blink <= 0;
		end
		else begin
			if (count_1Hz == 50000000) begin
				count_1Hz <= 0;
				clk_1Hz <= ~clk_1Hz;
			end
			else
				count_1Hz <= count_1Hz + 1;
				
			if (count_fast == 20000) begin
				count_fast <= 0;
				clk_fast <= ~clk_fast;
			end
			else
				count_fast <= count_fast + 1;
				
			if (count_blink == 30000000) begin
				count_blink <= 0;
				clk_blink <= ~clk_blink;
			end
			else
				count_blink <= count_blink + 1;
		end
	end

endmodule
