`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:52:22 01/24/2021 
// Design Name: 
// Module Name:    DivideBy64 
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
module DivideBy64(
	input  [31:0] A , // Input a 32bits number
	output [31:0] B   // Outpus a 32bits number divided by 64
);
	 // Right shift 6 bits
	 assign B = {6'b000000, A[31:6]};
	 // -->> Warning is for not using the 6 low value bits of A 
	 
endmodule
