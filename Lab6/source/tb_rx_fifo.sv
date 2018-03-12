// $Id: $
// File name:   tb_rx_fifo.sv
// Created:     2/21/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .
`timescale 1ns / 100ps

module tb_rx_fifo();

	localparam CLK_PERIOD = 2.5;
	localparam CHECK_DELAY = 3;

	reg tb_clk;
   	reg tb_n_rst;    
   	reg tb_r_enable;
   	reg tb_w_enable;
  	reg [7:0] tb_w_data;
   	reg [7:0] tb_r_data;
   	reg tb_empty;
   	reg tb_full;

	always
    begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
     end

	rx_fifo DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.r_enable(tb_r_enable),
		.w_enable(tb_w_enable),
		.w_data(tb_w_data),
		.r_data(tb_r_data),
		.empty(tb_empty),
		.full(tb_full)
	);
	
	initial
	begin
		tb_n_rst = 0;
		tb_r_enable = 0;
		tb_w_enable = 0;
		tb_w_data = 8'b0;
	   
	   @(posedge tb_clk);
	   tb_n_rst = 0;
	   @(posedge tb_clk);
	   tb_n_rst = 1;
	   
	   if (tb_full==0)
	     $info("Passed");
	   else
	     $info("Failed");
	   if(tb_empty==1)
	     $info("Passed");
	   else
	     $info("Failed");

	   tb_w_data=8'b0;
	   #(CHECK_DELAY);
	   tb_w_enable = 1;
	   #(CHECK_DELAY);
	   @(posedge tb_clk);
	   tb_w_enable=0;
	  
	   if(tb_r_data==8'b0)
	     $info("Passed");
	   else
	     $info("FAILED");
	   #(CHECK_DELAY);
	   tb_w_data = 8'b00000000;
	   #(CHECK_DELAY);
	   tb_w_enable=1;
	   @(posedge tb_clk)
	     #(CHECK_DELAY);
	   tb_w_enable = 0;
	   
	   #(CHECK_DELAY);
	   tb_w_data = 8'b01010101;
	   #(CHECK_DELAY);
	   tb_w_enable=1;
	   @(posedge tb_clk)
	     #(CHECK_DELAY);
	   tb_w_enable = 0;
	   
	   
	    #(CHECK_DELAY);
	   tb_w_data = 8'b10101010;
	   #(CHECK_DELAY);
	   tb_w_enable=1;
	   @(posedge tb_clk)
	     #(CHECK_DELAY);
	   tb_w_enable = 0;
	   
	   #(CHECK_DELAY);
	   tb_w_data = 8'b11110101;
	   #(CHECK_DELAY);
	   tb_w_enable=1;
	   @(posedge tb_clk)
	     #(CHECK_DELAY);
	   tb_w_enable = 0;
	   
	   #(CHECK_DELAY);
	   tb_w_data = 8'b01010000;
	   #(CHECK_DELAY);
	   tb_w_enable=1;
	   @(posedge tb_clk)
	     #(CHECK_DELAY);
	   tb_w_enable = 0;

	   
	   #(CHECK_DELAY);
	   tb_w_data = 8'b01011111;
	   #(CHECK_DELAY);
	   tb_w_enable=1;
	   @(posedge tb_clk)
	     #(CHECK_DELAY);
	   tb_w_enable = 0;
	   
	    #(CHECK_DELAY);
	   tb_w_data = 8'b11110000;
	   #(CHECK_DELAY);
	   tb_w_enable=1;
	   @(posedge tb_clk)
	     #(CHECK_DELAY);
	   tb_w_enable = 0;
	   	   
	   #(CHECK_DELAY);
	   tb_w_data = 8'b00001111;
	   #(CHECK_DELAY);
	   tb_w_enable=1;
	   @(posedge tb_clk)
	     #(CHECK_DELAY);
	   tb_w_enable = 0;
	    if (tb_full==1)
	     $info("Passed");
	   else
	     $info("Failed");
	end
endmodule








