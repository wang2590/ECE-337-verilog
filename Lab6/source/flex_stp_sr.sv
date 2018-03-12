// $Id: $
// File name:   flex_stp_sr.sv
// Created:     1/30/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

module flex_stp_sr
#(
	NUM_BITS = 4,
	SHIFT_MSB = 1  //defult for setting to MSB
)

(
	input wire clk, n_rst, shift_enable, serial_in,
	output reg [NUM_BITS-1:0]parallel_out
);

	reg [NUM_BITS-1:0] next_data;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if(n_rst == 0)
			parallel_out <= '1;
		else
			parallel_out <= next_data;
	end

	always_comb
	begin
	   if (shift_enable != 1)
	      next_data = parallel_out;
	   else
	   begin
	      if (SHIFT_MSB == 0)
		next_data = {serial_in, parallel_out[NUM_BITS-1:1]};	
	      else
		next_data = {parallel_out[NUM_BITS-2:0],serial_in};				       end
	end	
		

endmodule
