`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:11 05/23/2022 
// Design Name: 
// Module Name:    time_display 
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
module time_display(
    input [11:0] sec_count,
    output [3:0] min_tens,
    output [3:0] min_ones,
    output [3:0] sec_tens,
    output [3:0] sec_ones
    );

	assign min_tens = (sec_count / 600) % 10;

	assign min_ones = (sec_count / 60) % 10;

	assign sec_tens = ((sec_count % 60) / 10) % 10;
	
	assign sec_ones = sec_count % 10;

endmodule
