`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:17:59 02/04/2021
// Design Name:   MemoryUnit
// Module Name:   F:/Xilinx_install/Projects/Final/Module6/Module/TB_MemoryUnit.v
// Project Name:  Module
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MemoryUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_MemoryUnit;

	// Inputs
	reg arst;
	reg clk;
	reg wren;
	reg [34:0] din;

	// Outputs
	wire [34:0] dout;

	// Instantiate the Unit Under Test (UUT)
	MemoryUnit uut (
		.arst(arst), 
		.clk(clk), 
		.wren(wren), 
		.din(din), 
		.dout(dout)
	);
	
	initial begin
		clk = 0;
		repeat (20)
			# 10 clk = ~ clk;
	end

	initial begin
		arst = 0;
		din = 35'b00000000000000000000000000000000000;
		wren = 0;
		# 25
		din = 35'b00000000000000000000000000000000010;
		# 25
		wren = 1'b1;
		# 30
		wren = 0;
		# 10
		din = 35'b00001111110000000000000000000000010;
		# 20
		arst = 1;
		# 10
		arst = 0;
	end
      
endmodule

