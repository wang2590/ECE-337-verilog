/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Feb  3 23:30:10 2018
/////////////////////////////////////////////////////////////


module moore ( clk, n_rst, i, o );
  input clk, n_rst, i;
  output o;
  wire   n12, n13, n14, n15, n16, n17, n18, n19;
  wire   [2:0] current;
  wire   [2:0] next;

  DFFSR \current_reg[0]  ( .D(next[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current[0]) );
  DFFSR \current_reg[2]  ( .D(next[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current[2]) );
  DFFSR \current_reg[1]  ( .D(next[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current[1]) );
  NOR2X1 U17 ( .A(n12), .B(n13), .Y(o) );
  OR2X1 U18 ( .A(current[0]), .B(current[1]), .Y(n13) );
  NOR2X1 U19 ( .A(n14), .B(n15), .Y(next[2]) );
  NAND2X1 U20 ( .A(i), .B(current[1]), .Y(n15) );
  NAND2X1 U21 ( .A(current[0]), .B(n12), .Y(n14) );
  INVX1 U22 ( .A(current[2]), .Y(n12) );
  AOI21X1 U23 ( .A(current[0]), .B(current[2]), .C(n16), .Y(next[1]) );
  MUX2X1 U24 ( .B(n17), .A(n18), .S(current[1]), .Y(n16) );
  NOR2X1 U25 ( .A(n18), .B(n19), .Y(n17) );
  INVX1 U26 ( .A(i), .Y(n19) );
  AND2X1 U27 ( .A(i), .B(n18), .Y(next[0]) );
  NOR2X1 U28 ( .A(current[0]), .B(current[2]), .Y(n18) );
endmodule

