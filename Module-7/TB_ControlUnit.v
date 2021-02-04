`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:13:09 02/04/2021
// Design Name:   ControlUnit
// Module Name:   F:/Xilinx_install/Projects/Final/Module7/Module/TB_ControlUnit.v
// Project Name:  Module
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ControlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_ControlUnit;

	// Inputs
	reg arst;
	reg clk;
	reg request;
	reg confirm;
	reg [1:0] password;
	reg [1:0] syskey;
	reg [34:0] configin;

	// Outputs
	wire [34:0] configout;
	wire write_en;
	wire [2:0] dbg_state;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.arst(arst), 
		.clk(clk), 
		.request(request), 
		.confirm(confirm), 
		.password(password), 
		.syskey(syskey), 
		.configin(configin), 
		.configout(configout), 
		.write_en(write_en), 
		.dbg_state(dbg_state)
	);

	initial begin
		clk = 0;
		repeat (50)
			# 10 clk = ~ clk;
	end
	
	initial begin
		// Initialize Inputs
		arst = 0;
		request = 1;
		syskey = 2'b11;
		configin = 0;
		confirm = 0;
		password = 0;
		
		# 15
		password = 2'b11;
		confirm = 1;
		# 10
		configin = 35'b01010101010101010101010101010101010;
		confirm = 0;
		# 10
		confirm = 1;
		# 10
		request = 0;
		# 10
		request = 1;

	end
      
endmodule

