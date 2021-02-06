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
---  Module Name: Memory Unit
---  Description: Module6:
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module MemoryUnit (
	input         arst , // async  reset
	input         clk  , // clock  posedge
	input         wren , // write  enabledata
	input  [34:0] din  , // input  data
	output [34:0] dout   // output data
);
	
	reg [34:0] middle;
	
	DFF
		bit_0 (arst, clk, wren, middle[0], dout[0]),
		bit_1 (arst, clk, wren, middle[1], dout[1]),
		bit_2 (arst, clk, wren, middle[2], dout[2]),
		bit_3 (arst, clk, wren, middle[3], dout[3]),
		bit_4 (arst, clk, wren, middle[4], dout[4]),
		bit_5 (arst, clk, wren, middle[5], dout[5]),
		bit_6 (arst, clk, wren, middle[6], dout[6]),
		bit_7 (arst, clk, wren, middle[7], dout[7]),
		bit_8 (arst, clk, wren, middle[8], dout[8]),
		bit_9 (arst, clk, wren, middle[9], dout[9]),
		bit_10 (arst, clk, wren, middle[10], dout[10]),
		bit_11 (arst, clk, wren, middle[11], dout[11]),
		bit_12 (arst, clk, wren, middle[12], dout[12]),
		bit_13 (arst, clk, wren, middle[13], dout[13]),
		bit_14 (arst, clk, wren, middle[14], dout[14]),
		bit_15 (arst, clk, wren, middle[15], dout[15]),
		bit_16 (arst, clk, wren, middle[16], dout[16]),
		bit_17 (arst, clk, wren, middle[17], dout[17]),
		bit_18 (arst, clk, wren, middle[18], dout[18]),
		bit_19 (arst, clk, wren, middle[19], dout[19]),
		bit_20 (arst, clk, wren, middle[20], dout[20]),
		bit_21 (arst, clk, wren, middle[21], dout[21]),
		bit_22 (arst, clk, wren, middle[22], dout[22]),
		bit_23 (arst, clk, wren, middle[23], dout[23]),
		bit_24 (arst, clk, wren, middle[24], dout[24]),
		bit_25 (arst, clk, wren, middle[25], dout[25]),
		bit_26 (arst, clk, wren, middle[26], dout[26]),
		bit_27 (arst, clk, wren, middle[27], dout[27]),
		bit_28 (arst, clk, wren, middle[28], dout[28]),
		bit_29 (arst, clk, wren, middle[29], dout[29]),
		bit_30 (arst, clk, wren, middle[30], dout[30]),
		bit_31 (arst, clk, wren, middle[31], dout[31]),
		bit_32 (arst, clk, wren, middle[32], dout[32]),
		bit_33 (arst, clk, wren, middle[33], dout[33]),
		bit_34 (arst, clk, wren, middle[34], dout[34]);
		
	
	always @ ( posedge clk ) begin
		middle[0] <= din[0];
		middle[1] <= din[1];
		middle[2] <= din[2];
		middle[3] <= din[3];
		middle[4] <= din[4];
		middle[5] <= din[5];
		middle[6] <= din[6];
		middle[7] <= din[7];
		middle[8] <= din[8];
		middle[9] <= din[9];
		middle[10] <= din[10];
		middle[11] <= din[11];
		middle[12] <= din[12];
		middle[13] <= din[13];
		middle[14] <= din[14];
		middle[15] <= din[15];
		middle[16] <= din[16];
		middle[17] <= din[17];
		middle[18] <= din[18];
		middle[19] <= din[19];
		middle[20] <= din[20];
		middle[21] <= din[21];
		middle[22] <= din[22];
		middle[23] <= din[23];
		middle[24] <= din[24];
		middle[25] <= din[25];
		middle[26] <= din[26];
		middle[27] <= din[27];
		middle[28] <= din[28];
		middle[29] <= din[29];
		middle[30] <= din[30];
		middle[31] <= din[31];
		middle[32] <= din[32];
		middle[33] <= din[33];
		middle[34] <= din[34];
	end
		

endmodule
