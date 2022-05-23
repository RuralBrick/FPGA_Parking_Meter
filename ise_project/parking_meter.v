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
    output [7:0] seg,
    output [3:0] an
    );

	wire rst;

	debouncer debouncer1(.clk(clk), .btn(btnr), .state(rst));
	
	wire parked;
	
	sensor sensor1(.JA(JA), .parked(parked));

	wire clk_1Hz;
	wire clk_fast;
	wire clk_blink;
	
	clocks clocks1(
		.clk(clk),
		.rst(rst),
		.clk_1Hz(clk_1Hz),
		.clk_fast(clk_fast),
		.clk_blink(clk_blink)
	);
	
	wire [11:0] sec_count;
	
	second_counter second_counter1(
		.clk_1Hz(clk_1Hz),
		.rst(rst),
		.parked(parked),
		.sec_count(sec_count)
	);
	
	wire [3:0] min_tens;
	wire [3:0] min_ones;
	wire [3:0] sec_tens;
	wire [3:0] sec_ones;
	
	time_display time_display1(
		.sec_count(sec_count),
		.min_tens(min_tens),
		.min_ones(min_ones),
		.sec_tens(sec_tens),
		.sec_ones(sec_ones)
	);
	
	reg [3:0] digit3;
	reg [3:0] digit2;
	reg [3:0] digit1;
	reg [3:0] digit0;
	
	always @* begin
		if (parked) begin
		
		end
		else begin
			digit3 = min_tens;
			digit2 = min_ones;
			digit1 = sec_tens;
			digit0 = sec_ones;
		end	
	end
	
	display_control display_control1(
		.clk_fast(clk_fast),
		.clk_blink(clk_blink),
		.parked(parked),
		.digit3(digit3),
		.digit2(digit2),
		.digit1(digit1),
		.digit0(digit0),
		.seg(seg),
		.an(an)
	);

endmodule
