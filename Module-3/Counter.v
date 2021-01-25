`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:59:39 01/25/2021 
// Design Name: 
// Module Name:    Counter 
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
module Counter(
    input clk,
	 input rst,
    output reg [7:0] count
);
	initial count = 0;
	
	always @ ( posedge clk or posedge rst ) 
	begin
		if ( rst == 1'b1 ) count <= 0;
		else begin 
			if ( count == 8'b11111111 )
				count <= 0;
			else
				count <= count + 8'b00000001;
		end
	end

endmodule
