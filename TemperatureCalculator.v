`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:22:34 01/24/2021 
// Design Name: 
// Module Name:    TemperatureCalculator 
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
module TemperatureCalculator (
	input  [31:0] tc_base  , // base [environment degree ]
	input  [ 7:0] tc_ref   , // ref  [system work voltage]
	input  [15:0] adc_data , // adc  [sensor digital data]
	output [31:0] tempc      // temp [temperature celsius]
);
	// First 8*8 multiplier
	wire [15:0] multi8x8_result;
	Multiplier8x8 multi8x8 (tc_ref, tc_ref, multi8x8_result);
	
	// The 16*16 multiplier
	wire [31:0] multi16x16_result;
	wire [15:0] modified_vector;
	assign modified_vector = {1'b0, adc_data[14:0]}; // Changing the last bit of this vector
	Multiplier16x16 multi16x16 (multi8x8_result, modified_vector, multi16x16_result);
	
	// Divider
	wire [31:0] vector_divide_by_64;
	DivideBy64 divide (multi16x16_result, vector_divide_by_64);
	
	// Final Result of module 1
	AdderSubtractor32x32 adder_subtractor (tc_base, vector_divide_by_64, adc_data[15], tempc);
	
endmodule
