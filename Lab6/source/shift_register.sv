// $Id: $
// File name:   shift_register.sv
// Created:     2/27/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .
module shift_register
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire d_orig,
	output wire [7:0] rcv_data
);
 
flex_stp_sr #(8, 0) SHIFT
(
   	.clk(clk), 
   	.n_rst(n_rst), 
   	.shift_enable(shift_enable), 
 	.serial_in(d_orig), 
   	.parallel_out(rcv_data)
);

endmodule
