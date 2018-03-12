// $Id: $
// File name:   sensor_d.sv
// Created:     1/18/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

module sensor_d
(
	input wire [3:0] sensors,
	output wire error
);
	wire s1,s2,s3;
	assign s1 = sensors[1] && sensors[2];
	assign s2 = sensors[1] && sensors[3];
	assign s3 = sensors[0] || s1;
	assign error = s3 || s2;

endmodule
