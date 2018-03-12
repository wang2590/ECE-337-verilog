// $Id: $
// File name:   counter.sv
// Created:     2/15/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .
module counter
(	
	input wire clk,
	input wire n_reset,
	input wire cnt_up,
	input wire clear,
	output wire one_k_samples
);

reg [9:0] outtemp;

flex_counter #(.NUM_CNT_BITS(10)) counter(.clk(clk), .n_rst(n_reset), .clear(clear), .count_enable(cnt_up), .rollover_val(10'd1000), .rollover_flag(one_k_samples),.count_out(outtemp));

endmodule
