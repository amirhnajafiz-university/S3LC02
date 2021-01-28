`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:09:16 01/25/2021
// Design Name:   LampState
// Module Name:   F:/LOGIC AZ/final_4/tb_lamp_state.v
// Project Name:  final_4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LampState
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_lamp_state;

	// Inputs
	reg [3:0] active_lights;

	// Outputs
	wire [15:0] lights_state;

	// Instantiate the Unit Under Test (UUT)
	LampState uut (
		.active_lights(active_lights), 
		.lights_state(lights_state)
	);

	initial begin
		// Initialize Inputs
		active_lights = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
				active_lights = 4'b0010;
				#100;
				active_lights = 4'b0010;
				#100;
				active_lights = 4'b1010;
				#100;
				active_lights = 4'b1110;
				#100;
				active_lights = 4'b0011;
				#100;
				active_lights = 4'b1111;
				#100
				$finish;

		// Add stimulus here

	end
      
endmodule

