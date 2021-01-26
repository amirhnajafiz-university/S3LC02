`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:50:06 01/26/2021
// Design Name:   CoolHeatSystem
// Module Name:   F:/Xilinx_install/Projects/Final/Module3/Module/CoolHeatSystemTB.v
// Project Name:  Module
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CoolHeatSystem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CoolHeatSystemTB;

	// Inputs
	reg arst;
	reg clk;
	reg [7:0] speed;
	reg [7:0] chs_conf;

	// Outputs
	wire [3:0] chs_power;
	wire chs_mode;
	wire pwm_data;

	// Instantiate the Unit Under Test (UUT)
	CoolHeatSystem uut (
		.arst(arst), 
		.clk(clk), 
		.speed(speed), 
		.chs_conf(chs_conf), 
		.chs_power(chs_power), 
		.chs_mode(chs_mode), 
		.pwm_data(pwm_data)
	);
	
	initial begin
		clk = 0;
		repeat (256)
			# 10 clk = ~ clk;
	end

	initial begin
		// Initialize Inputs
		arst = 0;
		speed = 8'b01000000;
		chs_conf = 8'b10101010;
	end
      
endmodule

