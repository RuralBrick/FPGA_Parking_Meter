`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:40:33 05/18/2022
// Design Name:   debouncer
// Module Name:   /home/ise/ise_projects/M152A_Lab4/ise_project/test_debouncer.v
// Project Name:  ise_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: debouncer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_debouncer;

	// Inputs
	reg clk;
	reg btn;

	// Outputs
	wire state;

	// Instantiate the Unit Under Test (UUT)
	debouncer uut (
		.clk(clk), 
		.btn(btn), 
		.state(state)
	);

	always #10 clk = ~clk;

	integer i;

	initial begin
		// Initialize Inputs
		clk = 0;
		btn = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for (i = 0; i < 5; i = i + 1)
			#5 btn = ~btn;

	end
      
endmodule

