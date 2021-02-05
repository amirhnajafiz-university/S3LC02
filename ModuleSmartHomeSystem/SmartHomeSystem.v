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
---  Module Name: Smart Home System
---  Description: ModuleSmartHomeSystem:
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module SmartHomeSystem (
	input  arst      , // async  reset
	input  clk       , // clock  posedge
	input  request,
	input  confirm,
	input  gds_din   , // gas detector input
	output [2:0 ] gds_dout   , // gas detector output
	input  [ 1:0] password,
	input  [34:0] confdata,
	input  [31:0] tc_base,
	input  [15:0] adc_data,
	output [31:0] tempc,
	input  [ 7:0] speed,
	output [ 3:0] chs_power,
	output        chs_mode,
	output        pwm_data,
	input  [ 3:0] tcode,
	output [ 3:0] wshade,
	output [ 3:0] lightnum,
	output [15:0] lightstate,
	input         dance_load,
	output [ 7:0] dance_qdata,
	output [ 2:0] dbg_state
	);
	
	wire [ 7:0] tc_ref;
	wire [ 7:0] chs_conf;
	wire [ 3:0] ulight;
	wire [ 3:0] lenght;
	wire [ 7:0] dance_pdata;
	wire        dance_din;
	wire        mem_wren;
	wire [34:0] mem_in;
	wire [34:0] mem_out;
	wire [ 1:0] syskey;
	
	assign tc_ref = mem_out[7:0];
	assign chs_conf = mem_out[15:8];
	assign lenght = mem_out[23:20];
	assign ulight = mem_out[19:16];
	assign dance_din = mem_out[32];
	assign dance_pdata = mem_out[31:24];
	assign syskey = mem_out[34:33] ;

	TemperatureCalculator Module1 (tc_base, tc_ref, adc_data, tempc);

	GasDetectorSensor Module2 (arst, clk, gds_din, gds_dout);

	CoolHeatSystem Module3 (arst, clk, speed, chs_conf, chs_power, chs_mode, pwm_data);

	LightingSystem Module4 (tcode, ulight, lenght, wshade, lightnum, lightstate);
	
	LightDance Module5 (arst, clk, dance_din, dance_load, dance_pdata, dance_qdata);

	MemoryUnit Module6 (arst, clk, mem_wren, mem_in, mem_out);
	
	ControlUnit Module7 (arst, clk, request, confirm, password, syskey, confdata, mem_in, mem_wren, dbg_state);

endmodule
