`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:56:02 05/23/2022
// Design Name:   second_counter
// Module Name:   D:/m152a/lab4/ise_project/test_counter.v
// Project Name:  ise_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: second_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_counter;

	// Inputs
	reg clk_1Hz;
	reg rst;
	reg parked;

	// Outputs
	wire [11:0] sec_count;

	// Instantiate the Unit Under Test (UUT)
	second_counter uut (
		.clk_1Hz(clk_1Hz), 
		.rst(rst), 
		.parked(parked), 
		.sec_count(sec_count)
	);

	always #5 clk_1Hz = ~clk_1Hz;

	initial begin
		// Initialize Inputs
		clk_1Hz = 0;
		rst = 1;
		parked = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rst = 0;
		#500 parked = 1;
		#500 parked = 0;
	end
      
endmodule

