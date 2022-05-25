`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:56 05/23/2022 
// Design Name: 
// Module Name:    second_counter 
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
module second_counter(
    input clk_1Hz,
    input rst,
    input parked,
    output reg [11:0] sec_count
    );

	always @(posedge rst or posedge clk_1Hz) begin
		if (rst)
			sec_count <= 720;
		else if (!parked)
			if (sec_count > 3599)
				sec_count <= 0;
			else
				sec_count <= sec_count + 1;
	end

endmodule
