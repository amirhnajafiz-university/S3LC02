`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:22:11 01/24/2021 
// Design Name: 
// Module Name:    Multiplier8x8 
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
module Multiplier8x8 (
	input  [7:0] A , // input  [unsigned 08 bits]
	input  [7:0] B , // input  [unsigned 08 bits]
	output [15:0] P   // output [unsigned 16 bits]
);
	// Simply just multiply A in B
	assign P = A * B;

endmodule
