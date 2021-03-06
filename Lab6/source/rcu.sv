// $Id: $
// File name:   rcu.sv
// Created:     2/27/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .
module rcu 
(
  input wire clk,
  input wire n_rst,
  input wire d_edge,
  input wire eop,
  input wire shift_enable,
  input wire [7:0] rcv_data,
  input wire byte_received,
  output reg rcving,
  output reg w_enable,
  output reg r_error
);

typedef enum bit [3:0] {IDLE,SYNC,START,CHECK_EOP,DONE,EIDLE,EWAIT,ERROR,READ_DATA,STORE} stateType;

stateType state;
stateType next;

always_ff @(posedge clk, negedge n_rst)
begin
  if (n_rst == 0)
     state <= IDLE;

  else
    state <= next;
end

always_comb
begin

  next = state;

  rcving = 0;
  w_enable = 0;
  r_error = 0;
 
  case(state)

  IDLE: 
  begin
    if (d_edge)
      next = SYNC;
    else
      next = IDLE;

    rcving = 0;
    w_enable = 0; 
    r_error = 0;
  end

  SYNC:
  begin
    if (byte_received)
      next = START;

    rcving = 1;
    w_enable = 0; 
    r_error = 0;
  end


  START:
  begin
    if (rcv_data == 8'b10000000)
      next = CHECK_EOP;
    else
      next = EWAIT;

    rcving = 1;
    w_enable = 0; 
    r_error = 0;
  end

  CHECK_EOP:
  begin
    if (!eop && shift_enable)
      next = READ_DATA;
    else if (eop && shift_enable)
      next = DONE;

    rcving = 1;
    w_enable = 0; 
    r_error = 0;
  end

  DONE:
  begin
    if (d_edge)
      next = IDLE;

    rcving = 0;
    w_enable = 0; 
    r_error = 0;
  end

  READ_DATA:
  begin 
    if (eop && shift_enable)
      next = ERROR;
    else if (byte_received)
      next = STORE;

    rcving = 1;
    w_enable = 0;
    r_error = 0;
  end

  STORE:
  begin
    next = CHECK_EOP;

    rcving = 1;
    w_enable = 1;
    r_error = 0;
  end

  EWAIT:
  begin
    if (eop && shift_enable)
      next = ERROR;

    rcving = 1;
    w_enable = 0; 
    r_error = 1;
  end

  ERROR:
  begin
    if (d_edge)
      next = EIDLE;

    rcving = 0;
    w_enable = 0; 
    r_error = 1;
  end

  EIDLE:
  begin
    if (d_edge)
      next = SYNC;

    rcving = 0;
    w_enable = 0; 
    r_error = 1;
  end

  endcase
end
endmodule 
