// $Id: $
// File name:   adder_1bit.sv
// Created:     1/22/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

`timescale 1ns / 100ps

module adder_1bit
(
	input wire a,
	input wire b,
	input wire carry_in,
	output reg sum,
	output reg carry_out	
);

	always @ (a)
 	begin
   	  assert((a == 1'b1) || (a == 1'b0))
  	  else $error("Input 'a' of component is not a digital logic value");
	end

	always @ (b)
	begin
  	  assert((b == 1'b1) || (b == 1'b0))
  	  else $error("Input 'b' of component is not a digital logic value");
	end

	always @ (a, b, carry_in)
	begin
  	  #(2) assert (((a + b + carry_in) % 2) == sum)
  	  else $error("Output 's' of first 1 bit adder is not correct");
	end
	

	always_comb
	begin
		sum=0;
		carry_out=0;
		sum=carry_in ^ (a ^ b);
		carry_out=((~ carry_in) && b && a) || (carry_in && (b || a));
	end

endmodule


