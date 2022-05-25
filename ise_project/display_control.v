`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:44 05/18/2022 
// Design Name: 
// Module Name:    display_control 
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
module display_control(
    input clk_fast,
    input clk_blink,
    input parked,
    input [3:0] digit3,
    input [3:0] digit2,
    input [3:0] digit1,
    input [3:0] digit0,
    output reg [7:0] seg,
    output reg [3:0] an
    );

	reg [1:0] digit = 0;
	reg [3:0] value = 0;
	
	always @(posedge clk_fast) begin
		case (digit)
			0: value <= digit0;
			1: value <= digit1;
			2: value <= digit2;
			3: value <= digit3;
		endcase
		
		case (value)
			0: seg <= 'b11000000;
			1: seg <= 'b11111001;
			2: seg <= 'b10100100;
			3: seg <= 'b10110000;
			4: seg <= 'b10011001;
			5: seg <= 'b10010010;
			6: seg <= 'b10000010;
			7: seg <= 'b11111000;
			8: seg <= 'b10000000;
			9: seg <= 'b10010000;
		endcase
		
		if (parked) begin
			if (clk_blink)
				seg <= 'b11111111;
			else if (digit == 3)
				seg[7] <= 0;
		end
		
		case (digit)
			0: an <= 'b0111;
			1: an <= 'b1110;
			2: an <= 'b1101;
			3: an <= 'b1011;
		endcase
		
		digit <= digit + 1;
	end

endmodule
