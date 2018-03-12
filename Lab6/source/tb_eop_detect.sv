// $Id: $
// File name:   tb_eop_detect.sv
// Created:     2/21/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .
`timescale 1ns / 100ps

module tb_eop_detect();
	localparam CLK_ERIOD = 2.5;
	localparam CHECK_DELAY = 1;

	reg tb_d_plus;
	reg tb_d_minus;
	reg tb_eop;

	eop_detect DUT
	(
		.d_plus(tb_d_plus),
		.d_minus(tb_d_minus),
		.eop(tb_eop)
	);

	initial 
	begin

	//test case 1
	tb_d_plus = 0;
	tb_d_minus = 0;
	#(CHECK_DELAY)
	if(tb_eop == 1)
		$info("Test case 1: Passed");
	else
		$info("Test case 1: FAILED");

	//test case 2
	tb_d_plus = 1;
	tb_d_minus = 1;
	#(CHECK_DELAY)
	if(tb_eop == 0)
		$info("Test case 2: Passed");
	else
		$info("Test case 2: FAILED");

	//test case 3
	tb_d_plus = 1;
	tb_d_minus = 0;
	#(CHECK_DELAY)
	if(tb_eop == 0)
		$info("Test case 3: Passed");
	else
		$info("Test case 3: FAILED");

	//test case 4
	tb_d_plus = 0;
	tb_d_minus = 1;
	#(CHECK_DELAY)
	if(tb_eop == 0)
		$info("Test case 4: Passed");
	else
		$info("Test case 4: FAILED");
	//test case 5
	tb_d_plus = 0;
	tb_d_minus = 0;
	#(CHECK_DELAY)
	if(tb_eop == 1)
		$info("Test case 5: Passed");
	else
		$info("Test case 5: FAILED");

	//test case 6
	tb_d_plus = 1;
	tb_d_minus = 1;
	#(CHECK_DELAY)
	if(tb_eop == 0)
		$info("Test case 6: Passed");
	else
		$info("Test case 6: FAILED");

	//test case 7
	tb_d_plus = 1;
	tb_d_minus = 0;
	#(CHECK_DELAY)
	if(tb_eop == 0)
		$info("Test case 7: Passed");
	else
		$info("Test case 7: FAILED");

	//test case 8
	tb_d_plus = 0;
	tb_d_minus = 1;
	#(CHECK_DELAY)
	if(tb_eop == 0)
		$info("Test case 8: Passed");
	else
		$info("Test case 8: FAILED");
	end
endmodule
