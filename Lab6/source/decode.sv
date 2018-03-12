// $Id: $
// File name:   decode.sv
// Created:     2/21/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .
module decode
(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	input wire shift_enable,
	input wire eop,
	output wire d_orig	
);
        reg state1,state2,next_state;

	always_ff @ (posedge clk, negedge n_rst)
	begin 
		if (n_rst == 0) 
		begin
			next_state <= 1'b1;
			state2 <= 1'b1;	
		end

		else 
		begin
			next_state <= d_plus;
			state2 <= state1;  
		end		
	end

   always_comb
     begin
	if(shift_enable == 1 && eop == 0)
	  state1 = d_plus;
	else if (shift_enable == 1 && eop == 1)
	  state1 = 1;
	else
	  state1 = state2;
     end
   
   assign d_orig = ~(state2 ^ next_state);
	
endmodule
