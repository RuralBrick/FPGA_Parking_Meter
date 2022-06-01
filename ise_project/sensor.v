`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:04:17 05/23/2022 
// Design Name: 
// Module Name:    sensor 
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
module sensor(
    input MISO,
    input clk,
	 output SS,
	 output SCLK,
	 output MOSI,
    output parked
    );
    assign MOSI = 0;
	 reg [31:0] counter_cursor = 0;
     reg clk_cursor = 0; // Ticks at 30 Hz
     always @(posedge clk)
     begin
        counter_cursor <= (counter_cursor == 1666666) ? 0 : counter_cursor + 1;
        if (counter_cursor == 0)
            clk_cursor <= ~clk_cursor;    
     end

	// Data read from PmodJSTK
	wire [39:0] jstkData;
  
	joy joy(
		.CLK(clk),
		.sndRec(clk_cursor),
		.MISO(MISO),
		.SS(SS),
		.SCLK(SCLK),
		.DOUT(jstkData)
	);
    
    assign parked = jstkData[39];

endmodule
