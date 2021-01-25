/*--  *******************************************************
--  Computer Architecture Course, Laboratory Sources 
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce[dot]aut[dot]ac[dot]ir
--  *******************************************************
--  All Rights reserved (C) 2019-2020
--  *******************************************************
--  Student ID  : 
--  Student Name: 
--  Student Mail: 
--  *******************************************************
--  Additional Comments:
--
--*/

/*-----------------------------------------------------------
---  Module Name: Fan Speed (PWM)
---  Description: Module3: 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module FanSpeed (
	input        arst     , // reset [asynch]  
	input        clk      , // clock [posedge] 
	input  [7:0] speed    , // speed [duty-cycle]  
	output       pwm_data   // data  [output]
);
	reg data;
	reg count <= speed;
	integer i;
	/* write your code here */
	always @(negedge arst or posedge clk) begin
		if(~arst ) pwm_data=1'b0;
		else
			begin
			for(i=0;i<=256;i=i+1)
				begin
					if(count >=0)
					data = 1'b1;
					else
					data = 1'b0;
				end
			end
		
	end

	assign pwm_data = data;
	/* write your code here */

endmodule