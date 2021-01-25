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
---  Module Name: Cool Heat System Utils
---  Description: Module3:
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

/***********************************************************/
/************** Design Your Own Modules Below **************/

// module D_FF(
//     input D,
//     input clk,
//     output Q,
// );
//     reg Q;
//     always @ (posedge clk)
//         Q = D;
// endmodule


module shift_register(
    input [7:0] chs_conf ,
    input load , 
    input shift ,
    input clk,
    output outBit ,
);

    reg outBit;
    reg [7:0] d_inputs;
    reg [7:0] q_outputs;

    always @ (load or shift) begin
        if(load) d_inputs <= chs_conf;
        if(shift)
            begin
                d_input[1]=q_output[0];
                d_input[2]=q_output[1];
                d_input[3]=q_output[2];
                d_input[4]=q_output[3];
                d_input[5]=q_output[4];
                d_input[6]=q_output[5];
                d_input[7]=q_output[6];
                outBit=q_output[7];
            end
    end
    always @(posedge clk) begin
        q_outputs <= d_inputs;
    end
endmodule

module counter (
    input in,
    input clk, 
    input reset,
    output [3:0] count,
    output isEven,
);
    reg [3:0] cnt;

    always @(posedge clk or negedge reset) begin
        if(~reset) cnt=4'b0000;
        else if(in) cnt = cnt + 1'b1;
    end

    assign count=cnt;
    assign isEven = ~ cnt[0];
    
endmodule

	
/************** Design Your Own Modules Above **************/
/***********************************************************/