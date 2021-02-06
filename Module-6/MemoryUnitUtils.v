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
---  Module Name:  Memory Unit Utils
---  Description: Module5:
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

/***********************************************************/
/************** Design Your Own Modules Below **************/
module DFF (
	input arst,
	input clk,
	input wren,
	input din,
	output reg dout
);

	initial begin 
		dout = 0;
	end

	always @ ( posedge clk or posedge arst) begin
		if ( arst == 1'b1 ) dout <= 0;
		else if ( wren == 1'b1 ) dout <= din;
	end

endmodule	
/************** Design Your Own Modules Above **************/
/***********************************************************/