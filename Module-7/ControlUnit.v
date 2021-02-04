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
---  Module Name: Control Unit
---  Description: Module7:
-----------------------------------------------------------*/
`timescale 1ns / 1ns

`define STATE_IDLE    3'b001
`define STATE_ACTIVE  3'b010
`define STATE_REQUEST 3'b011
`define STATE_STORE   3'b100
`define STATE_TRAP    3'b101
`define STATE_OTHERS  3'b111

module ControlUnit (
	input         arst      , // async  reset
	input         clk       , // clock  posedge
	input         request   , // request input (asynch) 
	input         confirm   , // confirm input 
	input  [ 1:0] password  , // password from user
	input  [ 1:0] syskey    , // key  from memoty unit
	input  [34:0] configin  , // conf from user
	output reg [34:0] configout , // conf to memory unit
	output reg        write_en  , // conf mem write enable
	output [ 2:0] dbg_state   // current state (debug)
);
	
	// Regs that we use for state machine
	reg [3:0] current_state, next_state;
	
	// Password checking circuit
	wire pass_check;
	PassCheckUnit passcheck (password, syskey, pass_check);
	
	// Starting initial
	initial begin
		configout = 0;
		write_en = 0;
		current_state = 3'b001;
	end
	
	// State machine in behavioral model
	always @ ( posedge clk or posedge arst or negedge request ) begin
		if ( arst == 1'b1 ) begin
			// Reset is on
			configout <= 0;
			write_en <= 0;
			current_state <= 3'b001;
		end
		else if ( request == 1'b0 ) begin
			// Request is 0
			configout <= 0;
			write_en <= 0;
			current_state <= 3'b001;
		end
		else begin
			// State machine update
			if ( current_state == `STATE_STORE ) begin
				// Saving into memory is available
				write_en <= 1'b1;
				configout <= configin;
			end
			else write_en <= 1'b0;
			// State machine switch cases
			case (current_state)
				`STATE_IDLE:
					begin
						next_state <= `STATE_ACTIVE;
					end
				`STATE_ACTIVE:
					begin
						if ( confirm == 1'b1 )
							next_state <= `STATE_OTHERS;
					end
				`STATE_OTHERS:
					begin
						if ( pass_check == 1'b1 )
							next_state <= `STATE_REQUEST;
						else
							next_state <= `STATE_TRAP;
					end
				`STATE_REQUEST:
					begin
						if ( confirm == 1'b1 )
							next_state <= `STATE_STORE;
					end
			endcase
			// Moving states
			current_state <= next_state;
		end
	end
	
	// Debug assignment
	assign dbg_state = current_state;

endmodule
