/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Feb  3 23:54:48 2018
/////////////////////////////////////////////////////////////


module mealy ( clk, n_rst, i, o );
  input clk, n_rst, i;
  output o;
  wire   n9, n10, n11;
  wire   [1:0] current;
  wire   [1:0] next;

  DFFSR \current_reg[0]  ( .D(next[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current[0]) );
  DFFSR \current_reg[1]  ( .D(next[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current[1]) );
  INVX1 U14 ( .A(n9), .Y(o) );
  MUX2X1 U15 ( .B(n10), .A(current[0]), .S(current[1]), .Y(next[1]) );
  NAND2X1 U16 ( .A(i), .B(current[0]), .Y(n10) );
  OAI21X1 U17 ( .A(current[0]), .B(n11), .C(n9), .Y(next[0]) );
  NAND3X1 U18 ( .A(current[1]), .B(current[0]), .C(i), .Y(n9) );
  XNOR2X1 U19 ( .A(current[1]), .B(i), .Y(n11) );
endmodule

