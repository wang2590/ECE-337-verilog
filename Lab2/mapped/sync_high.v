/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Jan 23 22:24:35 2018
/////////////////////////////////////////////////////////////


module sync_high ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   mid, n2;

  DFFSR mid_reg ( .D(async_in), .CLK(clk), .R(n2), .S(1'b1), .Q(mid) );
  DFFSR sync_out_reg ( .D(mid), .CLK(clk), .R(n2), .S(1'b1), .Q(sync_out) );
  INVX1 U6 ( .A(n_rst), .Y(n2) );
endmodule

