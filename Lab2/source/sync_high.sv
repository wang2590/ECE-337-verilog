// $Id: $
// File name:   sync_high.sv
// Created:     1/23/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

module sync_high
(
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out
);
	reg mid;

	always_ff @ (posedge clk, posedge n_rst)
	begin : IMI
	   if(1'b1 == n_rst)
	   begin
	     sync_out <= 0;
	     mid <= 0;
	   end
	   else
	   begin
	     
	     mid <= async_in;
	      sync_out <= mid;
	   end
	end


endmodule
