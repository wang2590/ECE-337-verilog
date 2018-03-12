// $Id: $
// File name:   sr_9bit.sv
// Created:     2/7/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

module sr_9bit
  (
   input wire clk,
   input wire n_rst,
   input wire shift_strobe,
   input wire serial_in,
   output reg [7:0] packet_data,
   output reg stop_bit
   );

   flex_stp_sr #(9,0) A (.clk(clk), .n_rst(n_rst), .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({stop_bit,packet_data}));
   

endmodule // sr_9bit

