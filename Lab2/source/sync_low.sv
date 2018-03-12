// $Id: $
// File name:   sync_low.sv
// Created:     1/23/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

module sync_low
(
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out
);
	reg mid;

	always_ff @ (posedge clk, negedge n_rst)
	begin : IMI
	   if(1'b0 == n_rst)
	   begin
	     sync_out <= 0;
	     mid <= 0;
	   end
	   else
	   begin
	     sync_out <= mid;
	     mid <= async_in;
	   end
	end


endmodule
