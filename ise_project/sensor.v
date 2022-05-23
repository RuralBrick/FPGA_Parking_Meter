`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:04:17 05/23/2022 
// Design Name: 
// Module Name:    sensor 
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
module sensor(
    input [7:0] JA,
    output reg parked
    );

	initial parked = 0;
	
	always @* parked = 0;

endmodule
