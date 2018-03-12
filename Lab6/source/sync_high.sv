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

	always_ff @ (posedge clk, negedge n_rst)
	begin : IMI
	   if(n_rst == 1'd0)
	   begin
	     sync_out <= 1;
	     mid <= 1;
	   end
	   else
	   begin
	     
	     mid <= async_in;
	      sync_out <= mid;
	   end
	end


endmodule
