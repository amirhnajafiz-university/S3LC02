`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:21:51 02/05/2021
// Design Name:   LightDance
// Module Name:   F:/Xilinx_install/Projects/Final/Module5/Module/TB_LightDance.v
// Project Name:  Module
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LightDance
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_LightDance;

	// Inputs
	reg arst;
	reg clk;
	reg din;
	reg load;
	reg [7:0] pdata;

	// Outputs
	wire [7:0] qdata;

	// Instantiate the Unit Under Test (UUT)
	LightDance uut (
		.arst(arst), 
		.clk(clk), 
		.din(din), 
		.load(load), 
		.pdata(pdata),
		.qdata(qdata)
	);
	
	initial begin
		clk = 0;
		repeat (50)
			# 10 clk = ~ clk;
	end

	initial begin
		arst = 0;
		din = 0;
		load = 0;
		pdata = 8'b0101010101;
		
		# 5
		load = 1;
		# 10
		load = 0;
		# 20
		arst = 1;
		# 10
		arst = 0;
		# 10
		din = 1;
		# 20
		load = 1;
		# 20
		load = 0;
		# 40
		arst = 1;
		# 10
		arst = 0;
	end
      
endmodule

