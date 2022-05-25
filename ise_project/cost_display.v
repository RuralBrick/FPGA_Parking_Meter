`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:35 05/23/2022 
// Design Name: 
// Module Name:    cost_display 
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
module cost_display(
    input [13:0] cost,
    output [3:0] dol_tens,
    output [3:0] dol_ones,
    output [3:0] cent_tens,
    output [3:0] cent_ones
    );

	assign dol_tens = (cost / 1000) % 10;

	assign dol_ones = (cost / 100) % 10;

	assign cent_tens = (cost / 10) % 10;

	assign cent_ones = cost % 10;

endmodule
