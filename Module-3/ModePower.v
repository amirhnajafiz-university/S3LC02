`timescale 1 ns/1 ns
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
---  Module Name: Power Mode (Conting Ones)
---  Description: Module3: 
-----------------------------------------------------------*/
module ModePower (
	input  [7:0] chs_conf  , // degree [temprature] 
	output [3:0] chs_power , // power  [cooler/heater] 
	output       chs_mode    // model  [heat=1/cool=0]
);
	// Simply just add them up
	wire [3:0] cnt;
	assign cnt = chs_conf[0] + chs_conf[1] + chs_conf[2] + chs_conf[3] + chs_conf[4] + chs_conf[5] + chs_conf[6] + chs_conf[7];
	
	assign chs_mode = ~ cnt[0];
	assign chs_power = cnt;

endmodule
