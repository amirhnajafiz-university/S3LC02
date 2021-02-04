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
---  Module Name: Light Dance
---  Description: Module5
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module LightDance (
	input        arst  , // async  reset
	input        clk   , // clock  posedge
	input        din   , // input  data
	input        load  , // load   enable 
	input  [7:0] pdata , // load   data
	output [7:0] qdata   // output data
);

	wire i0, i1, i2, i3, i4, i5, i6, i7, q0, q1, q2, q3, q4, q5, q6, q7;
	
	wire middle_7, middle_5, middle_4, middle_1, middle_0;
	
	xor 
		in_7 (middle_7, din, q0),
		in_5 (middle_5, q6, q0),
		in_4 (middle_4, q5, q0),
		in_1 (middle_1, q2, q0),
		in_0 (middle_0, q1, q0);
		
	Mux_21
		mux_7 (pdata[7], middle_7, load, i7),
		mux_6 (pdata[6], q7, load, i6),
		mux_5 (pdata[5], middle_5, load, i5),
		mux_4 (pdata[4], middle_4, load, i4),
		mux_3 (pdata[3], q4, load, i3),
		mux_2 (pdata[2], q3, load, i2),
		mux_1 (pdata[1], middle_1, load, i1),
		mux_0 (pdata[0], middle_0, load, i0);
		
	DFlop
		D7 (arst, clk, i7, q7),
		D6 (arst, clk, i6, q6),
		D5 (arst, clk, i5, q5),
		D4 (arst, clk, i4, q4),
		D3 (arst, clk, i3, q3),
		D2 (arst, clk, i2, q2),
		D1 (arst, clk, i1, q1),
		D0 (arst, clk, i0, q0);
	
	assign qdata = {q7, q6, q5, q4, q3, q2, q1, q0};

endmodule
