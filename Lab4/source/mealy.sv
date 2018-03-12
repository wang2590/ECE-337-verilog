// $Id: $
// File name:   mealy.sv
// Created:     2/3/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

module mealy
(
	input wire clk,
	input wire n_rst,
	input wire i,
	output reg o
);

	reg [1:0] current;
	reg [1:0] next;

	parameter [1:0] state_0000 = 2'b00;
	parameter [1:0] state_0001 = 2'b01;
	parameter [1:0] state_0011 = 2'b10;
	parameter [1:0] state_0110 = 2'b11;
	

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if(n_rst == 0)
			current <= state_0000;
		else 
			current <= next;
	end

	always_comb
	begin
		next = current;
		o = 0;
		case(current)

	state_0000: 
	begin
		if(i == 1)
		  next = state_0001;
		else
		  next = state_0000;
	end

	state_0001:
	begin
		if(i == 1)
		  next = state_0011;
		else
		  next = state_0000;
	end

	state_0011:
	begin
		if(i == 0)
		  next = state_0110;
		else
		  next = state_0011;
	end

	state_0110:
	begin
		if(i == 1)
		begin
		  next = state_0001;
		  o = 1;
		end
		else
		  next = state_0000;
	end

	default:
	begin
		next = state_0000;
	end
  
   endcase
end
	

endmodule
