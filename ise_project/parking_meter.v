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
    input btn_reset,
	 input MISO,
    output SS,
	 output SCLK,
	 output MOSI,
    output [7:0] seg,
    output [3:0] an
    );

	wire rst;

	debouncer debouncer1(.clk(clk), .btn(btn_reset), .state(rst));
	
	wire parked;
	
	sensor sensor1(.clk(clk), .MISO(MISO), .SS(SS), .SCLK(SCLK), .MOSI(MOSI), .parked(parked));

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
	
	wire [13:0] cost;
	
	cost_convert cost_convert1(.sw(sw), .sec_count(sec_count), .cst(cost));
	
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
	
	wire [3:0] dol_tens;
	wire [3:0] dol_ones;
	wire [3:0] cent_tens;
	wire [3:0] cent_ones;
	
	cost_display cost_display1(
		.cost(cost),
		.dol_tens(dol_tens),
		.dol_ones(dol_ones),
		.cent_tens(cent_tens),
		.cent_ones(cent_ones)
	);
	
	reg [3:0] digit3;
	reg [3:0] digit2;
	reg [3:0] digit1;
	reg [3:0] digit0;
	
	always @* begin
		if (parked) begin
			digit3 = dol_tens;
			digit2 = dol_ones;
			digit1 = cent_tens;
			digit0 = cent_ones;
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
