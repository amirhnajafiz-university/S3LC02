`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:54 01/25/2021 
// Design Name: 
// Module Name:    GasEngineUtils 
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
module GasEngineUtils(
	input        arst, // async reset
	input        clk , // clock posedge
	input        din , // input data 
	output [2:0] dout  // output data
);
	// Detectors
	CO2Detector co2 (arst, clk, din, dout[2]);
	CODetector co (arst, clk, din, dout[1]);
	MethanDetector methan (arst, clk, din, dout[0]);
	
endmodule
