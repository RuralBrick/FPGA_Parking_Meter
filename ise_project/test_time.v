`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:06:53 05/23/2022
// Design Name:   time_display
// Module Name:   D:/m152a/lab4/ise_project/test_time.v
// Project Name:  ise_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: time_display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_time;

	// Inputs
	reg [11:0] sec_count;

	// Outputs
	wire [3:0] min_tens;
	wire [3:0] min_ones;
	wire [3:0] sec_tens;
	wire [3:0] sec_ones;

	// Instantiate the Unit Under Test (UUT)
	time_display uut (
		.sec_count(sec_count), 
		.min_tens(min_tens), 
		.min_ones(min_ones), 
		.sec_tens(sec_tens), 
		.sec_ones(sec_ones)
	);
	
	initial begin
		for (sec_count = 0; sec_count <= 3599; sec_count = sec_count + 1) #100;
	end
      
endmodule

