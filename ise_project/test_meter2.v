`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:32:07 06/01/2022
// Design Name:   parking_meter
// Module Name:   D:/m152a/lab4/ise_project/test_meter2.v
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

module test_meter2;

	// Inputs
	reg clk;
	reg [7:0] sw;
	reg btn_reset;
	reg MISO;

	// Outputs
	wire SS;
	wire SCLK;
	wire MOSI;
	wire [7:0] seg;
	wire [3:0] an;

	// Instantiate the Unit Under Test (UUT)
	parking_meter uut (
		.clk(clk), 
		.sw(sw), 
		.btn_reset(btn_reset), 
		.MISO(MISO), 
		.SS(SS), 
		.SCLK(SCLK), 
		.MOSI(MOSI), 
		.seg(seg), 
		.an(an)
	);
	
	always #1 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		sw = 0;
		btn_reset = 0;
		MISO = 0;

		// Wait 100 ns for global reset to finish
		#100 btn_reset = 1;
        
		// Add stimulus here
		#200000 btn_reset = 0;
	end
      
endmodule

