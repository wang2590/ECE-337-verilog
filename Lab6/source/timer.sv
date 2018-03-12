// $Id: $
// File name:   timer.sv
// Created:     2/27/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .
module timer
(
	input wire clk, 
	input wire n_rst, 
	input wire d_edge, 
	input wire rcving,
	output wire shift_enable, 
	output wire byte_received
);

	reg [3:0] shift;
        reg received;
	

	flex_counter #(4) SHIFT
	(
		.clk(clk), 
		.n_rst(n_rst),
		.clear(d_edge),
		.count_enable(rcving),
		.rollover_val(4'd8),
		.count_out(shift)
	);

	flex_counter #(4) BYTE_REC
	(
		.clk(clk), 
		.n_rst(n_rst),
		.clear(~rcving | received),
		.count_enable(shift_enable),
		.rollover_val(4'd8),
		.rollover_flag(received)
	);



	assign shift_enable = (shift == 4'd3) ? 1'b1 : 1'b0;
   assign byte_received = received;
   
   

endmodule
