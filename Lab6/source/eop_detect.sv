// $Id: $
// File name:   eop_detect.sv
// Created:     2/21/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .
module eop_detect
(
	input wire d_plus,
	input wire d_minus,
	output wire eop	
);

	assign eop = !(d_plus || d_minus);
	
endmodule
