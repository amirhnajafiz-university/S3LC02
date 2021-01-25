`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:42:04 01/25/2021 
// Design Name: 
// Module Name:    DFF 
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
module DFF(
	input      rst,
	input      clk,
	input      din, 
	output reg dout
);

	initial 
	begin
		dout = 1'b0;
	end
	
	// A behavioral model
	always @ ( posedge clk or posedge rst ) begin
		if ( rst == 1'b1 ) 
			dout <= 1'b0;
		else 
			dout <= din;
	end
	
endmodule
