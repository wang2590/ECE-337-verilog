// $Id: $
// File name:   timer.sv
// Created:     2/7/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

module timer
  (
   input wire clk,
   input wire n_rst,
   input wire enable_timer,
   output reg shift_strobe,
   output reg packet_done
   );

   reg [3:0]  rol_clock;
   reg [3:0]  rol_bit;

   flex_counter #(4) clock_counter(.clk(clk), .n_rst(n_rst), .clear(packet_done), .count_enable(enable_timer), .rollover_val(4'd10), .count_out(rol_clock), .rollover_flag(shift_strobe));
   flex_counter #(4) bit_counter(.clk(clk), .n_rst(n_rst), .clear(packet_done), .count_enable(shift_strobe), .rollover_val(4'd9), .count_out(rol_bit), .rollover_flag(packet_done));
   


endmodule  
