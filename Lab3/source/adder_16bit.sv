// $Id: $
// File name:   adder_16bit.sv
// Created:     1/25/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

`timescale 1ns / 100ps

module adder_16bit
(
	input wire [15:0] a,
	input wire [15:0] b,
	input wire carry_in,
	output wire [15:0] sum,
	output wire overflow
);
//	wire [ 15:0 ] carrys;
	
	adder_nbit #(16) DUT(.a(a), .b(b), .carry_in(carry_in), .sum(sum), .overflow(overflow));

//	assign carrys[0] = carry_in;

	genvar i;
	generate
	  for(i =0;i<=(15);i=i+1)
	  begin
		always @ (a,b,carry_in)
  		begin
    			assert((a[i] == 1'b1) || (a[i] == 1'b0))
    			else $error("Input 'a' of component is not a digital logic value");
		
			assert((b[i] == 1'b1) || (b[i] == 1'b0))
    			else $error("Input 'b' of component is not a digital logic value");
		
			assert((carry_in == 1'b1) || (carry_in == 1'b0))
			else $error("Input 'carry_in' of component is not a digital logic value ");
  		
	//	        #(2) assert (((a + b + carry_in) % 2) == sum)
  	  //		else $error("Output 's' of first 1 bit adder is not correct");
		end

  		end
endgenerate
//	end
  endmodule
