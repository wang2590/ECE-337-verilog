// $Id: $
// File name:   tb_edge_detect.sv
// Created:     2/21/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .
`timescale 1ns / 100ps

module tb_edge_detect();

	localparam CLK_PERIOD = 2.5;
	localparam CHECK_DELAY = 1;

	reg tb_d_plus;
	reg tb_d_edge;
	reg tb_clk;
	reg tb_n_rst;

	edge_detect DUT
	(
		.d_plus(tb_d_plus),
		.d_edge(tb_d_edge),
		.clk(tb_clk),
		.n_rst(tb_n_rst)
	);

	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end

	initial
	begin
		@(posedge tb_clk);
		tb_n_rst = 1'b1;
		@(posedge tb_clk);
		tb_n_rst = 1'b0;
		@(posedge tb_clk);

	//TEST CASE 1
	tb_n_rst = 1'b1;		
	tb_d_plus = 1;
	@(posedge tb_clk);
    #(CHECK_DELAY);
    if(tb_d_edge==0)
        $info("Test case 1: Passed");
    else 
        $error("Test case 1: FAILED");

    //TEST CASE 2
    @(posedge tb_clk);
	tb_n_rst = 1'b0;		
	tb_d_plus = 1;
	@(posedge tb_clk);
    #(CHECK_DELAY);
    if(tb_d_edge==0)
        $info("Test case 2: Passed");
    else 
        $error("Test case 2: FAILED");

    //TEST CASE 3
    @(posedge tb_clk);
	tb_n_rst = 1'b1;		
	tb_d_plus = 0;
	@(posedge tb_clk);
    #(CHECK_DELAY);
    if(tb_d_edge==1)
        $info("Test case 3: Passed");
    else 
        $error("Test case 3: FAILED");

    //TEST CASE 4
    @(posedge tb_clk);
	tb_n_rst = 1'b1;		
	tb_d_plus = 0;
	@(posedge tb_clk);
    #(CHECK_DELAY);
    if(tb_d_edge==0)
        $info("Test case 4: Passed");
    else 
        $error("Test case 4: FAILED");

    //TEST CASE 5
    @(posedge tb_clk);
	tb_n_rst = 1'b0;		
	tb_d_plus = 1;
	@(posedge tb_clk);
    #(CHECK_DELAY);
    if(tb_d_edge==0)
        $info("Test case 5: Passed");
    else 
        $error("Test case 5: FAILED");


	end // initial begin
endmodule // tb_edge_detect
