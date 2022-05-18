`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:31:08 05/18/2022 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(
    input clk,
    input btn,
    output reg state
    );

	reg [15:0] count;

    always @(posedge clk) begin
        if (btn == 0) begin
            state <= 0;
            count <= 0;
        end
        else begin
            if (count == 'hFFFF) begin
                state <= 1;
                count <= 0;
            end
            else
                count <= count + 1;
        end
    end

endmodule
