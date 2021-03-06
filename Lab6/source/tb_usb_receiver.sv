// $Id: $
// File name:   tb_usb_receiver.sv
// Created:     2/27/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

`timescale 1ns / 100ps

module tb_usb_receiver();

	localparam	CLK_PERIOD = 10.4;
	localparam 	BITS = 4;

	reg tb_clk;
	reg tb_n_rst;
	reg tb_d_plus, tb_d_minus, tb_r_enable;
	reg [7:0] tb_r_data;
	reg tb_empty, tb_full, tb_rcving, tb_r_error;


	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	

	usb_receiver DUT
	(
		.clk(tb_clk), .n_rst(tb_n_rst), 
		.d_plus(tb_d_plus), 
		.d_minus(tb_d_minus),
		.r_enable(tb_r_enable),
		.r_data(tb_r_data),
		.empty(tb_empty), .full(tb_full),
		.rcving(tb_rcving), .r_error(tb_r_error)	
	);

initial
begin
   tb_n_rst = 0;
   tb_r_enable = 0;
   tb_d_plus = 1;
   tb_d_minus = 0;
    
	@(posedge tb_clk);
	@(posedge tb_clk);
	tb_n_rst = 1;
   
        tb_r_enable = 1;
	tb_d_plus = 0;
	tb_d_minus = 1;
        #(CLK_PERIOD * 8)

   	tb_d_plus = 1;
	tb_d_minus = 0;
        tb_r_enable = 1;
        #(CLK_PERIOD * 8)

   	tb_d_plus = 0;
	tb_d_minus = 1;
        tb_r_enable = 1;
        #(CLK_PERIOD * 8)
   
   	tb_d_plus = 1;
	tb_d_minus = 0;
        tb_r_enable = 1;
        #(CLK_PERIOD * 8)

   	tb_d_plus = 0;
	tb_d_minus = 1;
        tb_r_enable = 1;
        #(CLK_PERIOD * 8)
   
   	tb_d_plus = 1;
	tb_d_minus = 0;
        tb_r_enable = 1;
        #(CLK_PERIOD * 8)
   	tb_d_plus = 0;
	tb_d_minus = 1;
        tb_r_enable = 1;


        #(CLK_PERIOD * 8)
   	tb_d_plus = 0;
	tb_d_minus = 1;
        tb_r_enable = 1;
   
        //Packet Data
   //#1
        #(CLK_PERIOD *8)
      	tb_d_plus = 1;
	tb_d_minus = 0;
        tb_r_enable = 1;
   //#2
        #(CLK_PERIOD * 8) 
      	tb_d_plus = 0;
	tb_d_minus = 1;
        tb_r_enable = 1;
//#3
        #(CLK_PERIOD * 8)
      	tb_d_plus = 1;
	tb_d_minus = 0;
        tb_r_enable = 1;
//#4
        #(CLK_PERIOD * 8)
      	tb_d_plus = 1;
	tb_d_minus = 0;
        tb_r_enable = 1;
   
//#5
        #(CLK_PERIOD * 8)
      	tb_d_plus = 0;
	tb_d_minus = 1;
        tb_r_enable = 1;
//#6
        #(CLK_PERIOD * 8)
      	tb_d_plus = 1;
	tb_d_minus = 0;
        tb_r_enable = 1;
//#7
        #(CLK_PERIOD * 8)
      	tb_d_plus = 0;
	tb_d_minus = 1;
        tb_r_enable = 1;
   
   //#8
        #(CLK_PERIOD * 8)
      	tb_d_plus = 1;
	tb_d_minus = 0;
        tb_r_enable = 1;

   //EOP
        #(CLK_PERIOD * 8)
      	tb_d_plus = 0;
	tb_d_minus = 0;
        tb_r_enable = 1;
   
        #(CLK_PERIOD * 8)
      	tb_d_plus = 0;
	tb_d_minus = 0;
        tb_r_enable = 1;
   //IDLE
        #(CLK_PERIOD * 8)
      	tb_d_plus = 1;
	tb_d_minus = 0;
        tb_r_enable = 1;
   
   
end
endmodule
