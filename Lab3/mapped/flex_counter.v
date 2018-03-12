/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Feb  1 13:20:13 2018
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   input_flag, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68;

  DFFSR \output_count_reg[0]  ( .D(n38), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \output_count_reg[1]  ( .D(n37), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \output_count_reg[2]  ( .D(n36), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \output_count_reg[3]  ( .D(n35), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR output_flag_reg ( .D(input_flag), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI22X1 U37 ( .A(n39), .B(n40), .C(n41), .D(n42), .Y(n38) );
  OAI22X1 U38 ( .A(n43), .B(n40), .C(n42), .D(n44), .Y(n37) );
  OAI22X1 U39 ( .A(n45), .B(n40), .C(n46), .D(n42), .Y(n36) );
  OAI22X1 U40 ( .A(n47), .B(n40), .C(n48), .D(n42), .Y(n35) );
  NAND2X1 U41 ( .A(n40), .B(n49), .Y(n42) );
  OR2X1 U42 ( .A(count_enable), .B(clear), .Y(n40) );
  NOR2X1 U43 ( .A(n50), .B(n51), .Y(input_flag) );
  NAND3X1 U44 ( .A(n52), .B(n53), .C(n54), .Y(n51) );
  XOR2X1 U45 ( .A(n48), .B(rollover_val[3]), .Y(n54) );
  XOR2X1 U46 ( .A(n55), .B(n56), .Y(n48) );
  NOR2X1 U47 ( .A(n57), .B(n47), .Y(n56) );
  INVX1 U48 ( .A(count_out[3]), .Y(n47) );
  NAND2X1 U49 ( .A(n58), .B(n59), .Y(n55) );
  XOR2X1 U50 ( .A(n46), .B(rollover_val[2]), .Y(n53) );
  XNOR2X1 U51 ( .A(n58), .B(n59), .Y(n46) );
  INVX1 U52 ( .A(n60), .Y(n59) );
  NOR2X1 U53 ( .A(n45), .B(n57), .Y(n58) );
  INVX1 U54 ( .A(count_out[2]), .Y(n45) );
  XOR2X1 U55 ( .A(n44), .B(rollover_val[1]), .Y(n52) );
  OAI21X1 U56 ( .A(n41), .B(n61), .C(n60), .Y(n44) );
  NAND2X1 U57 ( .A(n41), .B(count_out[1]), .Y(n60) );
  NOR2X1 U58 ( .A(n57), .B(n43), .Y(n61) );
  NAND3X1 U59 ( .A(n62), .B(n49), .C(count_enable), .Y(n50) );
  INVX1 U60 ( .A(clear), .Y(n49) );
  XOR2X1 U61 ( .A(rollover_val[0]), .B(n41), .Y(n62) );
  NOR2X1 U62 ( .A(n39), .B(n57), .Y(n41) );
  INVX1 U63 ( .A(n63), .Y(n57) );
  NAND3X1 U64 ( .A(n64), .B(n65), .C(n66), .Y(n63) );
  NOR2X1 U65 ( .A(n67), .B(n68), .Y(n66) );
  XNOR2X1 U66 ( .A(rollover_val[1]), .B(n43), .Y(n68) );
  INVX1 U67 ( .A(count_out[1]), .Y(n43) );
  XNOR2X1 U68 ( .A(rollover_val[0]), .B(n39), .Y(n67) );
  XNOR2X1 U69 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n65) );
  XNOR2X1 U70 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n64) );
  INVX1 U71 ( .A(count_out[0]), .Y(n39) );
endmodule

