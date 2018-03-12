// $Id: $
// File name:   tb_moore.sv
// Created:     2/3/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

`timescale 1ns / 100ps

module tb_moore();

	localparam CLK_PERIOD = 2.5;
	localparam CHECK_DELAY = 1;
	localparam NUM_CNT_BITS = 4;

	reg tb_clk;
	reg tb_n_rst;
	reg tb_i;
	reg tb_o;

	integer testcase;

	moore DUT (.clk(tb_clk), .n_rst(tb_n_rst), .i(tb_i), .o(tb_o));

	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end


	initial
	begin

testcase = 1;
	tb_n_rst = 1'b0;
	#(CHECK_DELAY);
	tb_n_rst = 1'b1;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if(tb_o == 0)
		$info("Test case 1: Passed");
	else
		$error("Test case 1: Failed");
	
testcase = 2;
	tb_n_rst = 1'b0;
	#(CHECK_DELAY);
	tb_n_rst = 1'b1;
	@(posedge tb_clk);

	tb_i = 1'b1;
	@(posedge tb_clk);
	tb_i = 1'b1;
	@(posedge tb_clk);
	tb_i = 1'b0;
	@(posedge tb_clk);
	tb_i = 1'b1;

	@(posedge tb_clk);
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if(tb_o == 1)
		$info("Test case 2: Passed");
	else
		$error("Test case 2: Failed");

testcase = 3;
	tb_n_rst = 1'b0;
	#(CHECK_DELAY);
	tb_n_rst = 1'b1;
	@(posedge tb_clk);

	tb_i = 1'b1;
	@(posedge tb_clk);
	tb_i = 1'b1;
	@(posedge tb_clk);
	tb_i = 1'b0;
	@(posedge tb_clk);
	tb_i = 1'b0;

	#(CHECK_DELAY);
	if(tb_o == 0)
		$info("Test case 3: Passed");
	else
		$error("Test case 3: Failed");

testcase = 4;
	tb_n_rst = 1'b0;
	#(CHECK_DELAY);
	tb_n_rst = 1'b1;
	@(posedge tb_clk);

	tb_i = 1'b1;
	@(posedge tb_clk);
	tb_i = 1'b0;
	@(posedge tb_clk);
	tb_i = 1'b0;
	@(posedge tb_clk);
	tb_i = 1'b1;

	#(CHECK_DELAY);
	if(tb_o == 0)
		$info("Test case 4: Passed");
	else
		$error("Test case 4: Failed");

testcase = 5;
	tb_n_rst = 1'b0;
	#(CHECK_DELAY);
	tb_n_rst = 1'b1;
	@(posedge tb_clk);

	tb_i = 1'b1;
	@(posedge tb_clk);
	tb_i = 1'b0;
	@(posedge tb_clk);
	tb_i = 1'b0;
	@(posedge tb_clk);
	tb_i = 1'b0;

	#(CHECK_DELAY);
	if(tb_o == 0)
		$info("Test case 5: Passed");
	else
		$error("Test case 5: Failed");

testcase = 6;
	tb_n_rst = 1'b0;
	#(CHECK_DELAY);
	tb_n_rst = 1'b1;
	@(posedge tb_clk);

	tb_i = 1'b1;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if(tb_o == 0)
		$info("Test case 6: Passed");
	else
		$error("Test case 6: Failed");

testcase = 7;
	@(posedge tb_clk);
	tb_i = 1'b1;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if(tb_o == 0)
		$info("Test case 7: Passed");
	else
		$error("Test case 7: Failed");

testcase = 8;
	tb_i = 1'b0;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if(tb_o == 0)
		$info("Test case 8: Passed");
	else
		$error("Test case 8: Failed");

testcase = 9;
	tb_i = 1'b1;
	@(posedge tb_clk);

	#(CHECK_DELAY);
	if(tb_o == 0)
		$info("Test case 9: Passed");
	else
		$error("Test case 9: Failed");




	end
endmodule
