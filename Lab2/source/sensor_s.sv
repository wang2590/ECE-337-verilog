// $Id: $
// File name:   sensor_s.sv
// Created:     1/18/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

module sensor_s
(
	input wire [3:0] sensors,
	output wire error
);
	wire s1,s2,s3;
	AND2X1 A1 (.Y(s1), .A(sensors[1]), .B(sensors[2]));
	AND2X1 A2 (.Y(s2), .A(sensors[1]), .B(sensors[3]));
	OR2X1  A3 (.Y(s3), .A(sensors[0]), .B(s1));
	OR2X1  A4 (.Y(error), .A(s3), .B(s2));

endmodule
