// $Id: $
// File name:   flex_pts_sr.sv
// Created:     1/30/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

module flex_pts_sr
#(
	NUM_BITS = 4,
	SHIFT_MSB = 1
)

(
	input wire clk, n_rst, shift_enable, load_enable,
	input reg [NUM_BITS-1:0] parallel_in,
	output wire serial_out
);
	reg [NUM_BITS-1:0] output_data;
	reg [NUM_BITS-1:0] input_data;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if(n_rst == 0)
		  output_data <= '1;
		else
		   output_data <= input_data;
	end
	
	if(SHIFT_MSB == 1)
	  assign serial_out = output_data[NUM_BITS-1];	
	else
	  assign serial_out = output_data[0];
	
	always_comb
	begin
		if(load_enable != 1)
		begin
		if(shift_enable == 1)
		begin
		  if(SHIFT_MSB != 1)
		    input_data = {1'b1, output_data[NUM_BITS-1:1]};
		  else
		    input_data = {output_data[NUM_BITS-2:0], 1'b1};
		end
		else
		  input_data = output_data;
		end	
		else
		  input_data = parallel_in;
		
  	end
		    

	endmodule	  
