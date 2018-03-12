// $Id: $
// File name:   adder_nbit.sv
// Created:     1/23/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

`timescale 1ns / 100ps

module adder_nbit
#(
	parameter BIT_WIDTH =4
)
(
	input wire [(BIT_WIDTH-1):0] a,
 	input wire [(BIT_WIDTH-1):0] b,
	input wire carry_in,
 	output wire [(BIT_WIDTH-1):0] sum,
	output wire overflow
);

   wire [(BIT_WIDTH):0] carrys;
   genvar i;

   assign carrys[0] = carry_in;
   generate
      for(i = 0; i<=(BIT_WIDTH-1); i = i+1)
	begin
	   adder_1bit IX (.a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i+1]));
	end
      endgenerate
   assign overflow = carrys[BIT_WIDTH];



   generate
   for(i=0; i <=(BIT_WIDTH-1); i=i+1)
   begin
     always @ (a)
     begin
       assert((a[i] == 1'b1) || (a[i] == 1'b0))
       else $error("Input 'a' of component is not a digital logic value");
     end

   always @ (b)
   begin
     assert((b[i] == 1'b1) || (b[i] == 1'b0))
     else $error("Input 'b' of component is not a digital logic value");
   end
  
   always @ (carry_in)
   begin
     assert((carry_in == 1'b1) || (carry_in == 1'b0))
     else $error("Input 'carry_in' of component is not a digital logic value");
   end

//	always @ (a, b, carry_in)
//	begin
//  	  #(2) assert (((a + b + carry_in) % 2) == sum)
//  	  else $error("Output 's' of first 1 bit adder is not correct");
//	end
  end
  endgenerate

endmodule
