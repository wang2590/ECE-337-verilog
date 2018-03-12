// $Id: $
// File name:   sensor_b.sv
// Created:     1/21/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

module sensor_b
(
	input reg [3:0] sensors,
	output reg error
);
	reg s1,s2,s3;
	always_comb
	begin
		s1 = sensors[1] && sensors[2];
		s2 = sensors[1] && sensors[3];
		s3 = sensors[0] || s1;
		error = s3 || s2;
	end
endmodule
