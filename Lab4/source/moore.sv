// $Id: $
// File name:   moore.sv
// Created:     2/3/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

module moore
(
	input wire clk,
	input wire n_rst,
	input wire i,
	output reg o
);

	reg [2:0] current;
	reg [2:0] next;

	parameter [2:0] state_0000 = 3'b000;
	parameter [2:0] state_0001 = 3'b001;
	parameter [2:0] state_0011 = 3'b010;
	parameter [2:0] state_0110 = 3'b011;
	parameter [2:0] state_1101 = 3'b100;
	

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if(n_rst == 0)
			current <= 3'b000;
		else 
			current <= next;
	end

	always_comb
	begin
		next = current;
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
		  next = state_1101;
		else
		  next = state_0000;
	end

	state_1101:
	begin
		if(i == 1)
		  next = state_0011;
		else
		  next = state_0000;
	end

	default:
	begin
		next = state_0000;
	end
  
   endcase
end
	
assign o = (current == state_1101);

endmodule
