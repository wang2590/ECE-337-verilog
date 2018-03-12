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
	   else if(async_in == 0 || async_in == 1)
	   begin
	     
	     mid <= async_in;
	      sync_out <= mid;
	      
	   end
	   else
	     begin
		mid <= 0;
		sync_out <= 0;
		end
	end


endmodule
