// $Id: $
// File name:   edge_detect.sv
// Created:     2/21/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .
module edge_detect
(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	output wire d_edge
);

	reg check1, check2;

	always_ff@(posedge clk, negedge n_rst)
	begin
		if(n_rst == 0) 
		begin
			check1 <= 1'b1;
			check2 <= 1'b1;
		end

		else 
		begin
			check2 <= check1;
			check1 <= d_plus;
		end
	end

	assign d_edge = (check1 == check2)? 1'b0:1'b1;

endmodule
