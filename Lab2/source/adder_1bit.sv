// $Id: $
// File name:   adder_1bit.sv
// Created:     1/22/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

module adder_1bit
(
	input wire a,
	input wire b,
	input wire carry_in,
	output reg sum,
	output reg carry_out	
);

	always_comb
	begin
		sum=0;
		carry_out=0;
		sum=carry_in ^ (a ^ b);
		carry_out=((~ carry_in) && b && a) || (carry_in && (b || a));
	end
endmodule


