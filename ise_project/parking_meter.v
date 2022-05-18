`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:48:46 05/16/2022 
// Design Name: 
// Module Name:    parking_meter 
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
module parking_meter(
    input clk,
    input [7:0] sw,
    input btns,
    input btnu,
    input btnl,
    input btnd,
    input btnr,
    input [7:0] JA,
    output reg [7:0] seg,
    output reg [3:0] an
    );

	wire rst;

	debouncer debouncer1(.clk(clk), .btn(btnr), .state(rst));

	wire clk_1Hz;
	wire clk_blink;
	
	clocks clocks1(.clk(clk), .rst(rst), .clk_1Hz(clk_1Hz), .clk_blink(clk_blink));


endmodule
