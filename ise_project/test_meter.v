`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:49:31 05/23/2022
// Design Name:   parking_meter
// Module Name:   D:/m152a/lab4/ise_project/test_meter.v
// Project Name:  ise_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: parking_meter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_meter;

	// Inputs
	reg clk;
	reg [7:0] sw;
	reg btns;
	reg btnu;
	reg btnl;
	reg btnd;
	reg btnr;
	reg [7:0] JA;

	// Outputs
	wire [7:0] seg;
	wire [3:0] an;

	// Instantiate the Unit Under Test (UUT)
	parking_meter uut (
		.clk(clk), 
		.sw(sw), 
		.btns(btns), 
		.btnu(btnu), 
		.btnl(btnl), 
		.btnd(btnd), 
		.btnr(btnr), 
		.JA(JA), 
		.seg(seg), 
		.an(an)
	);

	always #1 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		sw = 0;
		btns = 0;
		btnu = 0;
		btnl = 0;
		btnd = 0;
		btnr = 0;
		JA = 0;

		// Wait 100 ns for global reset to finish
		#100 btnr = 1;
        
		// Add stimulus here
		#200000 btnr = 0;
	end
      
endmodule

