`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:19:47 05/18/2022
// Design Name:   clocks
// Module Name:   /home/ise/ise_projects/M152A_Lab4/ise_project/test_clocks.v
// Project Name:  ise_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clocks
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_clocks;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire clk_1Hz;
	wire clk_blink;

	// Instantiate the Unit Under Test (UUT)
	clocks uut (
		.clk(clk), 
		.rst(rst), 
		.clk_1Hz(clk_1Hz), 
		.clk_blink(clk_blink)
	);
	
	always #1 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rst = 0;

	end
      
endmodule

