/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Feb 15 10:11:14 2018
/////////////////////////////////////////////////////////////


module sync_low_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   N3, N4;
  assign N3 = async_in;

  DFFSR mid_reg ( .D(N3), .CLK(clk), .R(n_rst), .S(1'b1), .Q(N4) );
  DFFSR sync_out_reg ( .D(N4), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module sync_low_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   N3, N4;
  assign N3 = async_in;

  DFFSR mid_reg ( .D(N3), .CLK(clk), .R(n_rst), .S(1'b1), .Q(N4) );
  DFFSR sync_out_reg ( .D(N4), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module controller ( clk, n_reset, dr, lc, overflow, cnt_up, clear, modwait, op, 
        src1, src2, dest, err );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_reset, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153;
  wire   [4:0] state;
  wire   [4:0] next_state;
  assign src1[3] = 1'b0;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[4]  ( .D(next_state[4]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[4]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[3]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[1]) );
  DFFSR curr_modwait_reg ( .D(n153), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        modwait) );
  AND2X1 U9 ( .A(n130), .B(n132), .Y(n40) );
  BUFX2 U10 ( .A(n98), .Y(n33) );
  BUFX2 U11 ( .A(state[0]), .Y(n43) );
  BUFX4 U12 ( .A(state[2]), .Y(n7) );
  INVX2 U13 ( .A(n18), .Y(n8) );
  AND2X1 U14 ( .A(n87), .B(n9), .Y(n104) );
  NOR2X1 U15 ( .A(n107), .B(n8), .Y(n9) );
  NAND2X1 U16 ( .A(n10), .B(n11), .Y(n12) );
  NAND2X1 U17 ( .A(n12), .B(n74), .Y(n48) );
  INVX1 U18 ( .A(n49), .Y(n10) );
  INVX1 U19 ( .A(n83), .Y(n11) );
  NAND2X1 U20 ( .A(n43), .B(n44), .Y(n13) );
  NAND2X1 U21 ( .A(n61), .B(n14), .Y(n134) );
  INVX2 U22 ( .A(n13), .Y(n14) );
  INVX2 U23 ( .A(n97), .Y(n46) );
  INVX1 U24 ( .A(n137), .Y(n138) );
  AND2X1 U25 ( .A(n16), .B(overflow), .Y(n86) );
  INVX2 U26 ( .A(n84), .Y(n47) );
  AND2X2 U27 ( .A(n105), .B(n106), .Y(n15) );
  NAND2X1 U28 ( .A(n84), .B(n83), .Y(n16) );
  AND2X2 U29 ( .A(n72), .B(n82), .Y(n17) );
  AND2X2 U30 ( .A(n88), .B(n120), .Y(n18) );
  INVX1 U31 ( .A(n56), .Y(n19) );
  INVX2 U32 ( .A(n22), .Y(n20) );
  INVX2 U33 ( .A(n22), .Y(src2[2]) );
  INVX1 U34 ( .A(state[4]), .Y(n21) );
  INVX2 U35 ( .A(state[4]), .Y(n38) );
  AND2X2 U36 ( .A(n30), .B(n60), .Y(n22) );
  INVX1 U37 ( .A(n74), .Y(n23) );
  INVX2 U38 ( .A(n23), .Y(n24) );
  AND2X1 U39 ( .A(n134), .B(n133), .Y(n41) );
  INVX1 U40 ( .A(state[0]), .Y(n112) );
  INVX2 U41 ( .A(n28), .Y(n25) );
  INVX1 U42 ( .A(n28), .Y(n56) );
  INVX4 U43 ( .A(n7), .Y(n80) );
  NAND2X1 U44 ( .A(n18), .B(n87), .Y(n103) );
  INVX1 U45 ( .A(src1[2]), .Y(n88) );
  INVX1 U46 ( .A(n51), .Y(n26) );
  NAND2X1 U47 ( .A(n66), .B(n47), .Y(n27) );
  NAND2X1 U48 ( .A(n27), .B(n45), .Y(n50) );
  BUFX4 U49 ( .A(state[3]), .Y(n28) );
  INVX1 U50 ( .A(n19), .Y(n29) );
  NAND2X1 U51 ( .A(n36), .B(n47), .Y(n30) );
  INVX1 U52 ( .A(n29), .Y(n31) );
  NAND2X1 U53 ( .A(n15), .B(n104), .Y(next_state[1]) );
  OR2X2 U54 ( .A(n54), .B(n37), .Y(n143) );
  BUFX2 U55 ( .A(state[1]), .Y(n32) );
  INVX1 U56 ( .A(state[1]), .Y(n98) );
  INVX2 U57 ( .A(n136), .Y(n34) );
  BUFX4 U58 ( .A(n112), .Y(n35) );
  AND2X2 U59 ( .A(n43), .B(n80), .Y(n36) );
  INVX1 U60 ( .A(overflow), .Y(n121) );
  INVX1 U61 ( .A(n54), .Y(n67) );
  NAND2X1 U62 ( .A(n38), .B(n43), .Y(n37) );
  INVX1 U63 ( .A(n38), .Y(n39) );
  INVX1 U64 ( .A(n40), .Y(n136) );
  AND2X1 U65 ( .A(n130), .B(n144), .Y(n131) );
  INVX2 U66 ( .A(n51), .Y(n61) );
  AND2X2 U67 ( .A(n43), .B(n7), .Y(n42) );
  BUFX2 U68 ( .A(state[1]), .Y(n44) );
  NOR2X1 U69 ( .A(n48), .B(n46), .Y(n45) );
  INVX1 U70 ( .A(n45), .Y(n92) );
  INVX1 U71 ( .A(n48), .Y(n145) );
  OR2X2 U72 ( .A(n50), .B(n20), .Y(src2[1]) );
  INVX1 U73 ( .A(n50), .Y(n135) );
  NAND2X1 U74 ( .A(n7), .B(n112), .Y(n62) );
  NAND3X1 U75 ( .A(n38), .B(n32), .C(n28), .Y(n84) );
  NAND2X1 U76 ( .A(n112), .B(n80), .Y(n49) );
  NAND3X1 U77 ( .A(n98), .B(n28), .C(n38), .Y(n83) );
  INVX2 U78 ( .A(n83), .Y(n52) );
  INVX2 U79 ( .A(n62), .Y(n66) );
  NAND2X1 U80 ( .A(n66), .B(n52), .Y(n74) );
  INVX2 U81 ( .A(n49), .Y(n65) );
  NAND2X1 U82 ( .A(n47), .B(n65), .Y(n97) );
  NAND3X1 U83 ( .A(n7), .B(n38), .C(n25), .Y(n51) );
  NAND2X1 U84 ( .A(n36), .B(n47), .Y(n133) );
  NAND2X1 U85 ( .A(n52), .B(n42), .Y(n60) );
  NAND2X1 U86 ( .A(n52), .B(n36), .Y(n139) );
  NAND3X1 U87 ( .A(n134), .B(n22), .C(n139), .Y(n53) );
  INVX2 U88 ( .A(n53), .Y(n150) );
  NAND3X1 U89 ( .A(n44), .B(n56), .C(n80), .Y(n54) );
  NAND3X1 U90 ( .A(n67), .B(n21), .C(n35), .Y(n151) );
  NAND3X1 U91 ( .A(n135), .B(n150), .C(n151), .Y(op[2]) );
  NAND3X1 U92 ( .A(n61), .B(n43), .C(n33), .Y(n144) );
  NAND2X1 U93 ( .A(n143), .B(n144), .Y(n59) );
  NAND3X1 U94 ( .A(n39), .B(n33), .C(n29), .Y(n55) );
  INVX2 U95 ( .A(n55), .Y(n73) );
  NAND2X1 U96 ( .A(n73), .B(n65), .Y(n123) );
  NAND3X1 U97 ( .A(n33), .B(n29), .C(n21), .Y(n57) );
  INVX2 U98 ( .A(n57), .Y(n64) );
  NAND2X1 U99 ( .A(n36), .B(n64), .Y(n148) );
  NAND3X1 U100 ( .A(n67), .B(n39), .C(n35), .Y(n140) );
  NAND3X1 U101 ( .A(n123), .B(n148), .C(n140), .Y(n58) );
  NOR2X1 U102 ( .A(n59), .B(n58), .Y(n70) );
  INVX2 U103 ( .A(n70), .Y(dest[0]) );
  NAND3X1 U104 ( .A(n44), .B(n35), .C(n61), .Y(n132) );
  NAND3X1 U105 ( .A(n132), .B(n60), .C(n144), .Y(src1[2]) );
  NAND2X1 U106 ( .A(n47), .B(n42), .Y(n124) );
  INVX2 U107 ( .A(n124), .Y(n102) );
  NAND3X1 U108 ( .A(n35), .B(n33), .C(n26), .Y(n130) );
  NOR2X1 U109 ( .A(n102), .B(n136), .Y(n71) );
  NOR2X1 U110 ( .A(n31), .B(n62), .Y(n63) );
  NAND3X1 U111 ( .A(n44), .B(n39), .C(n63), .Y(n81) );
  NAND2X1 U112 ( .A(n65), .B(n64), .Y(n85) );
  NAND2X1 U113 ( .A(n81), .B(n85), .Y(n108) );
  INVX2 U114 ( .A(n108), .Y(n68) );
  NAND2X1 U115 ( .A(n73), .B(n66), .Y(n109) );
  NAND2X1 U116 ( .A(n42), .B(n73), .Y(n110) );
  NAND2X1 U117 ( .A(n109), .B(n110), .Y(n125) );
  INVX2 U118 ( .A(n125), .Y(n77) );
  NAND3X1 U119 ( .A(n43), .B(n39), .C(n67), .Y(n119) );
  NAND3X1 U120 ( .A(n68), .B(n77), .C(n119), .Y(n152) );
  NOR2X1 U121 ( .A(op[2]), .B(n152), .Y(n69) );
  NAND3X1 U122 ( .A(n71), .B(n70), .C(n69), .Y(n118) );
  NAND3X1 U123 ( .A(n130), .B(n133), .C(n143), .Y(n137) );
  INVX2 U124 ( .A(n148), .Y(n72) );
  INVX2 U125 ( .A(dr), .Y(n82) );
  NAND2X1 U126 ( .A(n36), .B(n73), .Y(n141) );
  NAND3X1 U127 ( .A(n24), .B(n123), .C(n141), .Y(n75) );
  NOR2X1 U128 ( .A(n17), .B(n75), .Y(n76) );
  OAI21X1 U129 ( .A(lc), .B(n77), .C(n76), .Y(n78) );
  NOR2X1 U130 ( .A(n137), .B(n78), .Y(n79) );
  OAI21X1 U131 ( .A(n80), .B(n118), .C(n79), .Y(n89) );
  INVX2 U132 ( .A(n81), .Y(err) );
  NAND2X1 U133 ( .A(err), .B(n82), .Y(n120) );
  INVX2 U134 ( .A(n85), .Y(n91) );
  AOI22X1 U135 ( .A(n86), .B(n35), .C(lc), .D(n91), .Y(n87) );
  OR2X1 U136 ( .A(n89), .B(n103), .Y(next_state[2]) );
  INVX2 U137 ( .A(n120), .Y(n90) );
  OAI21X1 U138 ( .A(n91), .B(n90), .C(lc), .Y(n96) );
  INVX2 U139 ( .A(n118), .Y(n94) );
  NAND2X1 U140 ( .A(n92), .B(n121), .Y(n111) );
  INVX2 U141 ( .A(n111), .Y(n93) );
  AOI21X1 U142 ( .A(n94), .B(n31), .C(n93), .Y(n95) );
  NAND3X1 U143 ( .A(n150), .B(n96), .C(n95), .Y(next_state[3]) );
  AND2X2 U144 ( .A(n139), .B(n97), .Y(n106) );
  INVX2 U145 ( .A(n110), .Y(n100) );
  OAI21X1 U146 ( .A(n33), .B(n118), .C(n148), .Y(n99) );
  AOI21X1 U147 ( .A(n100), .B(lc), .C(n99), .Y(n105) );
  OAI21X1 U148 ( .A(lc), .B(n119), .C(n151), .Y(n101) );
  OR2X1 U149 ( .A(n102), .B(n101), .Y(n107) );
  NOR2X1 U150 ( .A(n136), .B(n107), .Y(n117) );
  OAI21X1 U151 ( .A(dr), .B(lc), .C(n108), .Y(n116) );
  MUX2X1 U152 ( .B(n110), .A(n109), .S(lc), .Y(n114) );
  OAI21X1 U153 ( .A(n35), .B(n118), .C(n111), .Y(n113) );
  NOR2X1 U154 ( .A(n114), .B(n113), .Y(n115) );
  NAND3X1 U155 ( .A(n117), .B(n116), .C(n115), .Y(next_state[0]) );
  AND2X2 U156 ( .A(n119), .B(n118), .Y(n128) );
  OAI22X1 U157 ( .A(n135), .B(n121), .C(lc), .D(n120), .Y(n122) );
  NOR2X1 U158 ( .A(n17), .B(n122), .Y(n127) );
  NAND2X1 U159 ( .A(n124), .B(n123), .Y(n129) );
  NOR2X1 U160 ( .A(n125), .B(n129), .Y(n126) );
  NAND3X1 U161 ( .A(n128), .B(n127), .C(n126), .Y(next_state[4]) );
  INVX2 U162 ( .A(n129), .Y(n142) );
  NAND3X1 U163 ( .A(n150), .B(n142), .C(n131), .Y(dest[1]) );
  NAND3X1 U164 ( .A(n142), .B(n132), .C(n148), .Y(dest[2]) );
  NAND3X1 U165 ( .A(n150), .B(n141), .C(n140), .Y(dest[3]) );
  NAND2X1 U166 ( .A(n134), .B(n30), .Y(src2[0]) );
  NAND3X1 U167 ( .A(n135), .B(n134), .C(n139), .Y(src2[3]) );
  NAND2X1 U168 ( .A(n40), .B(n41), .Y(src1[0]) );
  NAND2X1 U169 ( .A(n139), .B(n138), .Y(src1[1]) );
  NAND3X1 U170 ( .A(n142), .B(n141), .C(n140), .Y(clear) );
  NAND3X1 U171 ( .A(n144), .B(n151), .C(n143), .Y(n147) );
  INVX2 U172 ( .A(clear), .Y(n149) );
  NAND3X1 U173 ( .A(n145), .B(n34), .C(n149), .Y(n146) );
  OR2X1 U174 ( .A(n147), .B(n146), .Y(op[0]) );
  NAND3X1 U175 ( .A(n150), .B(n149), .C(n148), .Y(op[1]) );
  INVX2 U176 ( .A(n151), .Y(cnt_up) );
  INVX2 U177 ( .A(n152), .Y(n153) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n4, n5, n1, n2, n3;

  NAND3X1 U6 ( .A(n2), .B(n3), .C(n1), .Y(w_en) );
  NOR2X1 U7 ( .A(n1), .B(w_data_sel[1]), .Y(w_data_sel[0]) );
  NAND2X1 U8 ( .A(op[1]), .B(n3), .Y(w_data_sel[1]) );
  OAI21X1 U9 ( .A(n3), .B(n4), .C(n5), .Y(alu_op[1]) );
  NAND3X1 U10 ( .A(op[0]), .B(n2), .C(op[2]), .Y(n5) );
  NAND2X1 U11 ( .A(op[1]), .B(n1), .Y(n4) );
  NOR2X1 U12 ( .A(op[0]), .B(n3), .Y(alu_op[0]) );
  INVX2 U3 ( .A(op[0]), .Y(n1) );
  INVX2 U4 ( .A(op[1]), .Y(n2) );
  INVX2 U5 ( .A(op[2]), .Y(n3) );
endmodule


module alu_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34,
         n35, n36, n38, n40, n41, n42, n43, n44, n46, n48, n49, n50, n51, n52,
         n54, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n75, n77, n79, n81, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n103, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177;

  XOR2X1 U4 ( .A(n20), .B(n1), .Y(DIFF[14]) );
  OAI21X1 U5 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U6 ( .A(n19), .B(n73), .Y(n1) );
  NOR2X1 U8 ( .A(A[14]), .B(n88), .Y(n18) );
  NAND2X1 U9 ( .A(A[14]), .B(n88), .Y(n19) );
  XNOR2X1 U10 ( .A(n25), .B(n2), .Y(DIFF[13]) );
  AOI21X1 U11 ( .A(n172), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U14 ( .A(n24), .B(n172), .Y(n2) );
  NAND2X1 U17 ( .A(A[13]), .B(n89), .Y(n24) );
  XOR2X1 U18 ( .A(n28), .B(n3), .Y(DIFF[12]) );
  OAI21X1 U19 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U20 ( .A(n27), .B(n75), .Y(n3) );
  NOR2X1 U22 ( .A(A[12]), .B(n90), .Y(n26) );
  NAND2X1 U23 ( .A(A[12]), .B(n90), .Y(n27) );
  XNOR2X1 U24 ( .A(n33), .B(n4), .Y(DIFF[11]) );
  AOI21X1 U25 ( .A(n171), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U28 ( .A(n32), .B(n171), .Y(n4) );
  NAND2X1 U31 ( .A(A[11]), .B(n91), .Y(n32) );
  XOR2X1 U32 ( .A(n36), .B(n5), .Y(DIFF[10]) );
  OAI21X1 U33 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U34 ( .A(n35), .B(n77), .Y(n5) );
  NOR2X1 U36 ( .A(A[10]), .B(n92), .Y(n34) );
  NAND2X1 U37 ( .A(A[10]), .B(n92), .Y(n35) );
  XNOR2X1 U38 ( .A(n41), .B(n6), .Y(DIFF[9]) );
  AOI21X1 U39 ( .A(n168), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U42 ( .A(n40), .B(n168), .Y(n6) );
  NAND2X1 U45 ( .A(A[9]), .B(n93), .Y(n40) );
  XOR2X1 U46 ( .A(n44), .B(n7), .Y(DIFF[8]) );
  OAI21X1 U47 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U48 ( .A(n43), .B(n79), .Y(n7) );
  NOR2X1 U50 ( .A(A[8]), .B(n94), .Y(n42) );
  NAND2X1 U51 ( .A(A[8]), .B(n94), .Y(n43) );
  XNOR2X1 U52 ( .A(n49), .B(n8), .Y(DIFF[7]) );
  AOI21X1 U53 ( .A(n170), .B(n49), .C(n46), .Y(n44) );
  NAND2X1 U56 ( .A(n48), .B(n170), .Y(n8) );
  NAND2X1 U59 ( .A(A[7]), .B(n95), .Y(n48) );
  XOR2X1 U60 ( .A(n52), .B(n9), .Y(DIFF[6]) );
  OAI21X1 U61 ( .A(n52), .B(n50), .C(n51), .Y(n49) );
  NAND2X1 U62 ( .A(n51), .B(n81), .Y(n9) );
  NOR2X1 U64 ( .A(A[6]), .B(n96), .Y(n50) );
  NAND2X1 U65 ( .A(A[6]), .B(n96), .Y(n51) );
  XNOR2X1 U66 ( .A(n57), .B(n10), .Y(DIFF[5]) );
  AOI21X1 U67 ( .A(n169), .B(n57), .C(n54), .Y(n52) );
  NAND2X1 U70 ( .A(n56), .B(n169), .Y(n10) );
  NAND2X1 U73 ( .A(A[5]), .B(n97), .Y(n56) );
  XOR2X1 U74 ( .A(n60), .B(n11), .Y(DIFF[4]) );
  OAI21X1 U75 ( .A(n60), .B(n58), .C(n59), .Y(n57) );
  NAND2X1 U76 ( .A(n59), .B(n83), .Y(n11) );
  NOR2X1 U78 ( .A(A[4]), .B(n98), .Y(n58) );
  NAND2X1 U79 ( .A(A[4]), .B(n98), .Y(n59) );
  XNOR2X1 U80 ( .A(n65), .B(n12), .Y(DIFF[3]) );
  AOI21X1 U81 ( .A(n69), .B(n61), .C(n62), .Y(n60) );
  NOR2X1 U82 ( .A(n63), .B(n66), .Y(n61) );
  OAI21X1 U83 ( .A(n63), .B(n67), .C(n64), .Y(n62) );
  NAND2X1 U84 ( .A(n64), .B(n84), .Y(n12) );
  NAND2X1 U87 ( .A(A[3]), .B(n99), .Y(n64) );
  XOR2X1 U88 ( .A(n68), .B(n13), .Y(DIFF[2]) );
  OAI21X1 U89 ( .A(n68), .B(n66), .C(n67), .Y(n65) );
  NAND2X1 U90 ( .A(n67), .B(n85), .Y(n13) );
  NOR2X1 U92 ( .A(A[2]), .B(n100), .Y(n66) );
  NAND2X1 U93 ( .A(A[2]), .B(n100), .Y(n67) );
  XOR2X1 U94 ( .A(n14), .B(n72), .Y(DIFF[1]) );
  OAI21X1 U96 ( .A(n70), .B(n72), .C(n71), .Y(n69) );
  NAND2X1 U97 ( .A(n71), .B(n86), .Y(n14) );
  NOR2X1 U99 ( .A(A[1]), .B(n101), .Y(n70) );
  NAND2X1 U100 ( .A(A[1]), .B(n101), .Y(n71) );
  XNOR2X1 U101 ( .A(n177), .B(A[0]), .Y(DIFF[0]) );
  INVX1 U123 ( .A(B[13]), .Y(n89) );
  INVX1 U124 ( .A(B[11]), .Y(n91) );
  INVX1 U125 ( .A(B[9]), .Y(n93) );
  INVX1 U126 ( .A(B[10]), .Y(n92) );
  XOR2X1 U127 ( .A(n87), .B(A[15]), .Y(n162) );
  XOR2X1 U128 ( .A(n17), .B(n162), .Y(DIFF[15]) );
  NAND2X1 U129 ( .A(n17), .B(n87), .Y(n163) );
  NAND2X1 U130 ( .A(n17), .B(A[15]), .Y(n164) );
  NAND2X1 U131 ( .A(n87), .B(A[15]), .Y(n165) );
  NAND3X1 U132 ( .A(n164), .B(n163), .C(n165), .Y(n16) );
  INVX2 U133 ( .A(A[3]), .Y(n166) );
  INVX1 U134 ( .A(B[5]), .Y(n97) );
  INVX1 U135 ( .A(n66), .Y(n85) );
  INVX1 U136 ( .A(n70), .Y(n86) );
  INVX1 U137 ( .A(n69), .Y(n68) );
  INVX1 U138 ( .A(B[7]), .Y(n95) );
  AND2X2 U139 ( .A(n166), .B(B[3]), .Y(n63) );
  INVX1 U140 ( .A(B[3]), .Y(n99) );
  INVX1 U141 ( .A(n50), .Y(n81) );
  OR2X2 U142 ( .A(A[5]), .B(n97), .Y(n169) );
  OR2X2 U143 ( .A(A[7]), .B(n95), .Y(n170) );
  OR2X2 U144 ( .A(A[9]), .B(n93), .Y(n168) );
  OR2X2 U145 ( .A(A[11]), .B(n91), .Y(n171) );
  OR2X2 U146 ( .A(A[13]), .B(n89), .Y(n172) );
  XNOR2X1 U147 ( .A(n16), .B(n167), .Y(DIFF[16]) );
  XNOR2X1 U148 ( .A(B[16]), .B(n103), .Y(n167) );
  INVX1 U149 ( .A(A[0]), .Y(n176) );
  INVX1 U150 ( .A(B[4]), .Y(n98) );
  NAND2X1 U151 ( .A(n16), .B(B[16]), .Y(n173) );
  NAND2X1 U152 ( .A(n16), .B(n103), .Y(n174) );
  NAND2X1 U153 ( .A(B[16]), .B(n103), .Y(n175) );
  NAND3X1 U154 ( .A(n174), .B(n173), .C(n175), .Y(n15) );
  INVX1 U155 ( .A(B[2]), .Y(n100) );
  AND2X2 U156 ( .A(n176), .B(B[0]), .Y(n72) );
  INVX1 U157 ( .A(B[0]), .Y(n177) );
  INVX1 U158 ( .A(B[15]), .Y(n87) );
  INVX1 U159 ( .A(n63), .Y(n84) );
  INVX1 U160 ( .A(B[6]), .Y(n96) );
  INVX1 U161 ( .A(B[1]), .Y(n101) );
  INVX2 U162 ( .A(B[8]), .Y(n94) );
  INVX2 U163 ( .A(B[12]), .Y(n90) );
  INVX2 U164 ( .A(B[14]), .Y(n88) );
  INVX2 U165 ( .A(n58), .Y(n83) );
  INVX2 U166 ( .A(n42), .Y(n79) );
  INVX2 U167 ( .A(n34), .Y(n77) );
  INVX2 U168 ( .A(n26), .Y(n75) );
  INVX2 U169 ( .A(n18), .Y(n73) );
  INVX2 U170 ( .A(n56), .Y(n54) );
  INVX2 U171 ( .A(n48), .Y(n46) );
  INVX2 U172 ( .A(n40), .Y(n38) );
  INVX2 U173 ( .A(n32), .Y(n30) );
  INVX2 U174 ( .A(n24), .Y(n22) );
  INVX2 U175 ( .A(A[17]), .Y(n103) );
  INVX2 U176 ( .A(n15), .Y(DIFF[17]) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17,
         n18, n20, n22, n23, n24, n25, n26, n28, n30, n31, n32, n33, n34, n36,
         n38, n39, n40, n41, n42, n44, n46, n47, n48, n49, n50, n52, n54, n55,
         n56, n57, n58, n60, n62, n63, n64, n65, n66, n68, n70, n71, n72, n73,
         n75, n76, n78, n80, n82, n84, n86, n88, n90, n92, n93, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n173;

  XNOR2X1 U5 ( .A(n23), .B(n1), .Y(SUM[14]) );
  AOI21X1 U6 ( .A(n171), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U9 ( .A(n22), .B(n171), .Y(n1) );
  NAND2X1 U12 ( .A(A[14]), .B(B[14]), .Y(n22) );
  XOR2X1 U13 ( .A(n173), .B(n2), .Y(SUM[13]) );
  OAI21X1 U14 ( .A(n26), .B(n24), .C(n25), .Y(n23) );
  NAND2X1 U15 ( .A(n25), .B(n78), .Y(n2) );
  NOR2X1 U17 ( .A(A[13]), .B(B[13]), .Y(n24) );
  NAND2X1 U18 ( .A(A[13]), .B(B[13]), .Y(n25) );
  XNOR2X1 U19 ( .A(n164), .B(n3), .Y(SUM[12]) );
  AOI21X1 U20 ( .A(n170), .B(n31), .C(n28), .Y(n26) );
  NAND2X1 U23 ( .A(n30), .B(n170), .Y(n3) );
  NAND2X1 U26 ( .A(A[12]), .B(B[12]), .Y(n30) );
  XOR2X1 U27 ( .A(n34), .B(n4), .Y(SUM[11]) );
  OAI21X1 U28 ( .A(n34), .B(n32), .C(n33), .Y(n31) );
  NAND2X1 U29 ( .A(n33), .B(n80), .Y(n4) );
  NOR2X1 U31 ( .A(A[11]), .B(B[11]), .Y(n32) );
  NAND2X1 U32 ( .A(A[11]), .B(B[11]), .Y(n33) );
  AOI21X1 U34 ( .A(n169), .B(n39), .C(n36), .Y(n34) );
  NAND2X1 U37 ( .A(n38), .B(n169), .Y(n5) );
  NAND2X1 U40 ( .A(A[10]), .B(B[10]), .Y(n38) );
  OAI21X1 U42 ( .A(n42), .B(n40), .C(n41), .Y(n39) );
  NAND2X1 U43 ( .A(n41), .B(n82), .Y(n6) );
  NOR2X1 U45 ( .A(A[9]), .B(B[9]), .Y(n40) );
  NAND2X1 U46 ( .A(A[9]), .B(B[9]), .Y(n41) );
  AOI21X1 U48 ( .A(n165), .B(n47), .C(n44), .Y(n42) );
  NAND2X1 U51 ( .A(n46), .B(n165), .Y(n7) );
  NAND2X1 U54 ( .A(A[8]), .B(B[8]), .Y(n46) );
  XOR2X1 U55 ( .A(n50), .B(n8), .Y(SUM[7]) );
  OAI21X1 U56 ( .A(n50), .B(n48), .C(n49), .Y(n47) );
  NAND2X1 U57 ( .A(n49), .B(n84), .Y(n8) );
  NOR2X1 U59 ( .A(A[7]), .B(B[7]), .Y(n48) );
  NAND2X1 U60 ( .A(A[7]), .B(B[7]), .Y(n49) );
  XNOR2X1 U61 ( .A(n55), .B(n9), .Y(SUM[6]) );
  AOI21X1 U62 ( .A(n168), .B(n55), .C(n52), .Y(n50) );
  NAND2X1 U65 ( .A(n54), .B(n168), .Y(n9) );
  NAND2X1 U68 ( .A(A[6]), .B(B[6]), .Y(n54) );
  XOR2X1 U69 ( .A(n58), .B(n10), .Y(SUM[5]) );
  OAI21X1 U70 ( .A(n58), .B(n56), .C(n57), .Y(n55) );
  NAND2X1 U71 ( .A(n57), .B(n86), .Y(n10) );
  NOR2X1 U73 ( .A(A[5]), .B(B[5]), .Y(n56) );
  NAND2X1 U74 ( .A(A[5]), .B(B[5]), .Y(n57) );
  XNOR2X1 U75 ( .A(n63), .B(n11), .Y(SUM[4]) );
  AOI21X1 U76 ( .A(n167), .B(n63), .C(n60), .Y(n58) );
  NAND2X1 U79 ( .A(n62), .B(n167), .Y(n11) );
  NAND2X1 U82 ( .A(A[4]), .B(B[4]), .Y(n62) );
  XOR2X1 U83 ( .A(n66), .B(n12), .Y(SUM[3]) );
  OAI21X1 U84 ( .A(n66), .B(n64), .C(n65), .Y(n63) );
  NAND2X1 U85 ( .A(n65), .B(n88), .Y(n12) );
  NOR2X1 U87 ( .A(A[3]), .B(B[3]), .Y(n64) );
  NAND2X1 U88 ( .A(A[3]), .B(B[3]), .Y(n65) );
  XNOR2X1 U89 ( .A(n152), .B(n13), .Y(SUM[2]) );
  AOI21X1 U90 ( .A(n166), .B(n71), .C(n68), .Y(n66) );
  NAND2X1 U93 ( .A(n70), .B(n166), .Y(n13) );
  NAND2X1 U96 ( .A(A[2]), .B(B[2]), .Y(n70) );
  XOR2X1 U97 ( .A(n14), .B(n163), .Y(SUM[1]) );
  OAI21X1 U98 ( .A(n72), .B(n75), .C(n73), .Y(n71) );
  NAND2X1 U99 ( .A(n73), .B(n90), .Y(n14) );
  NOR2X1 U101 ( .A(A[1]), .B(B[1]), .Y(n72) );
  NAND2X1 U102 ( .A(A[1]), .B(B[1]), .Y(n73) );
  NAND2X1 U107 ( .A(A[0]), .B(B[0]), .Y(n75) );
  BUFX2 U113 ( .A(n71), .Y(n152) );
  NAND3X1 U114 ( .A(n155), .B(n156), .C(n157), .Y(n153) );
  XOR2X1 U115 ( .A(A[15]), .B(B[15]), .Y(n154) );
  XOR2X1 U116 ( .A(n154), .B(n76), .Y(SUM[15]) );
  NAND2X1 U117 ( .A(A[15]), .B(B[15]), .Y(n155) );
  NAND2X1 U118 ( .A(A[15]), .B(n76), .Y(n156) );
  NAND2X1 U119 ( .A(B[15]), .B(n76), .Y(n157) );
  NAND3X1 U120 ( .A(n155), .B(n156), .C(n157), .Y(n17) );
  XOR2X1 U121 ( .A(n93), .B(n92), .Y(n158) );
  XOR2X1 U122 ( .A(n158), .B(n153), .Y(SUM[16]) );
  NAND2X1 U123 ( .A(n93), .B(n92), .Y(n159) );
  NAND2X1 U124 ( .A(n93), .B(n17), .Y(n160) );
  NAND2X1 U125 ( .A(n92), .B(n17), .Y(n161) );
  NAND3X1 U126 ( .A(n159), .B(n160), .C(n161), .Y(n16) );
  OR2X2 U127 ( .A(A[0]), .B(B[0]), .Y(n162) );
  OR2X2 U128 ( .A(A[6]), .B(B[6]), .Y(n168) );
  INVX1 U129 ( .A(n72), .Y(n90) );
  NAND2X1 U130 ( .A(A[0]), .B(B[0]), .Y(n163) );
  BUFX2 U131 ( .A(n31), .Y(n164) );
  OR2X2 U132 ( .A(A[10]), .B(B[10]), .Y(n169) );
  OR2X1 U133 ( .A(A[8]), .B(B[8]), .Y(n165) );
  OR2X1 U134 ( .A(A[4]), .B(B[4]), .Y(n167) );
  XNOR2X1 U135 ( .A(n47), .B(n7), .Y(SUM[8]) );
  XNOR2X1 U136 ( .A(n39), .B(n5), .Y(SUM[10]) );
  XOR2X1 U137 ( .A(n42), .B(n6), .Y(SUM[9]) );
  OR2X2 U138 ( .A(A[2]), .B(B[2]), .Y(n166) );
  OR2X2 U139 ( .A(A[12]), .B(B[12]), .Y(n170) );
  OR2X2 U140 ( .A(A[14]), .B(B[14]), .Y(n171) );
  AND2X1 U141 ( .A(n163), .B(n162), .Y(SUM[0]) );
  AOI21X1 U142 ( .A(n170), .B(n164), .C(n28), .Y(n173) );
  INVX2 U143 ( .A(A[17]), .Y(n93) );
  INVX2 U144 ( .A(B[17]), .Y(n92) );
  INVX2 U145 ( .A(n64), .Y(n88) );
  INVX2 U146 ( .A(n56), .Y(n86) );
  INVX2 U147 ( .A(n48), .Y(n84) );
  INVX2 U148 ( .A(n40), .Y(n82) );
  INVX2 U149 ( .A(n32), .Y(n80) );
  INVX2 U150 ( .A(n24), .Y(n78) );
  INVX2 U151 ( .A(n18), .Y(n76) );
  INVX2 U152 ( .A(n70), .Y(n68) );
  INVX2 U153 ( .A(n62), .Y(n60) );
  INVX2 U154 ( .A(n54), .Y(n52) );
  INVX2 U155 ( .A(n46), .Y(n44) );
  INVX2 U156 ( .A(n38), .Y(n36) );
  INVX2 U157 ( .A(n30), .Y(n28) );
  INVX2 U158 ( .A(n22), .Y(n20) );
  INVX2 U159 ( .A(n16), .Y(SUM[17]) );
endmodule


module alu_DW_mult_uns_2 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n7, n13, n19, n24, n25, n28, n30, n31, n37, n42, n48, n49, n51,
         n52, n53, n56, n58, n60, n61, n62, n64, n65, n66, n67, n68, n69, n70,
         n72, n73, n74, n75, n77, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n109, n111, n112, n113,
         n114, n115, n116, n120, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n133, n134, n135, n136, n137, n140, n142, n144, n145,
         n146, n147, n148, n149, n151, n154, n155, n159, n160, n161, n162,
         n163, n164, n165, n166, n169, n170, n171, n172, n173, n174, n177,
         n178, n179, n181, n182, n183, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n197, n198, n199, n200, n201, n202, n205,
         n206, n207, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n248, n249, n250, n251,
         n256, n257, n258, n259, n264, n265, n266, n267, n275, n279, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n545, n548, n549, n551, n554,
         n555, n557, n560, n563, n565, n566, n567, n568, n569, n570, n571,
         n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, n582,
         n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, n594,
         n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605,
         n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n706, n707, n708, n709, n710, n711, n712, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n728,
         n729, n730, n732, n741, n742, n743, n744, n745, n746, n747, n748,
         n749, n750, n751, n752, n753, n754, n755, n756, n757, n758, n759,
         n760, n761, n762, n763, n764, n765, n766, n767, n768, n769, n770,
         n771, n772, n773, n774, n775, n776, n777, n778, n779, n780, n781,
         n782, n783, n784, n785, n786, n787, n788, n789, n790, n791, n792,
         n793, n794, n795, n796, n797, n798, n799, n800, n801, n802, n803,
         n804, n805, n806, n807, n808, n809, n810, n811, n812, n813, n814,
         n815, n816, n817, n818, n819, n820, n821, n822, n823, n824, n825,
         n826, n827, n828, n829, n830, n831, n832, n833, n834, n835, n836,
         n837, n838, n839, n840, n841, n842, n843, n844, n845, n846, n847,
         n848, n849, n850, n851, n852, n853, n854, n855, n856, n857, n858,
         n859, n860, n861, n862, n863, n864, n865, n866, n867, n868, n869,
         n870, n871, n872, n873, n874, n875, n876, n877, n878, n879, n880,
         n881, n882, n883, n884, n885, n886, n887, n888, n889, n890, n891,
         n894, n895, n896, n898, n900, n917, n918, n995, n996, n997, n998,
         n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008,
         n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018,
         n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028,
         n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038,
         n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048,
         n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058,
         n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068,
         n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078,
         n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088,
         n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098,
         n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108,
         n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118,
         n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128,
         n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138,
         n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148,
         n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158,
         n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168,
         n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178,
         n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186, n1187, n1188,
         n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196, n1197, n1198,
         n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206, n1207, n1208,
         n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216, n1217, n1218,
         n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228,
         n1229, n1230, n1231, n1232, n1233, n1234, n1235, n1236, n1237, n1238,
         n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246, n1247, n1248,
         n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256, n1257, n1258,
         n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266, n1267, n1268,
         n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278,
         n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286, n1287, n1288;
  assign n1 = a[16];
  assign n7 = a[18];
  assign n13 = a[20];
  assign n19 = a[22];
  assign n25 = a[24];
  assign n31 = a[26];
  assign n37 = a[28];
  assign n49 = b[0];
  assign n541 = a[30];
  assign n877 = b[15];
  assign n878 = b[14];
  assign n879 = b[13];
  assign n880 = b[12];
  assign n881 = b[11];
  assign n882 = b[10];
  assign n883 = b[9];
  assign n884 = b[8];
  assign n885 = b[7];
  assign n886 = b[6];
  assign n887 = b[5];
  assign n888 = b[4];
  assign n889 = b[3];
  assign n890 = b[2];
  assign n891 = b[1];

  NAND2X1 U58 ( .A(n292), .B(n293), .Y(n72) );
  AOI21X1 U60 ( .A(n1237), .B(n74), .C(n75), .Y(n73) );
  NOR2X1 U61 ( .A(n1166), .B(n1195), .Y(n74) );
  OAI21X1 U62 ( .A(n1199), .B(n1166), .C(n77), .Y(n75) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n82), .B(n104), .Y(n80) );
  AOI21X1 U68 ( .A(n82), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NOR2X1 U73 ( .A(n294), .B(n297), .Y(n84) );
  NAND2X1 U74 ( .A(n294), .B(n297), .Y(n85) );
  XOR2X1 U75 ( .A(n95), .B(n56), .Y(product[44]) );
  AOI21X1 U76 ( .A(n1237), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n89), .B(n1195), .Y(n87) );
  OAI21X1 U78 ( .A(n89), .B(n1199), .C(n90), .Y(n88) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n91), .B(n101), .C(n92), .Y(n90) );
  NAND2X1 U83 ( .A(n94), .B(n91), .Y(n56) );
  NOR2X1 U85 ( .A(n298), .B(n301), .Y(n93) );
  NAND2X1 U86 ( .A(n298), .B(n301), .Y(n94) );
  AOI21X1 U88 ( .A(n1237), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n98), .B(n1195), .Y(n96) );
  OAI21X1 U90 ( .A(n1199), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n102), .B(n1189), .Y(n100) );
  OAI21X1 U94 ( .A(n140), .B(n102), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n106), .B(n130), .Y(n104) );
  OAI21X1 U98 ( .A(n106), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1170), .B(n1014), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1170), .C(n109), .Y(n107) );
  NAND2X1 U106 ( .A(n302), .B(n307), .Y(n111) );
  XOR2X1 U107 ( .A(n123), .B(n58), .Y(product[42]) );
  AOI21X1 U108 ( .A(n1237), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n115), .B(n1195), .Y(n113) );
  OAI21X1 U110 ( .A(n115), .B(n1199), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n1014), .B(n128), .Y(n115) );
  AOI21X1 U112 ( .A(n1014), .B(n129), .C(n120), .Y(n116) );
  NAND2X1 U117 ( .A(n122), .B(n1014), .Y(n58) );
  NAND2X1 U120 ( .A(n308), .B(n313), .Y(n122) );
  AOI21X1 U122 ( .A(n1237), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n126), .B(n1195), .Y(n124) );
  OAI21X1 U124 ( .A(n1199), .B(n126), .C(n127), .Y(n125) );
  NOR2X1 U127 ( .A(n130), .B(n1189), .Y(n128) );
  OAI21X1 U128 ( .A(n140), .B(n130), .C(n133), .Y(n129) );
  NOR2X1 U133 ( .A(n314), .B(n321), .Y(n130) );
  NAND2X1 U134 ( .A(n314), .B(n321), .Y(n133) );
  XOR2X1 U135 ( .A(n145), .B(n60), .Y(product[40]) );
  AOI21X1 U136 ( .A(n1237), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n1189), .B(n1195), .Y(n135) );
  OAI21X1 U138 ( .A(n1199), .B(n1189), .C(n140), .Y(n136) );
  NAND2X1 U141 ( .A(n1167), .B(n1109), .Y(n137) );
  AOI21X1 U142 ( .A(n151), .B(n1167), .C(n142), .Y(n140) );
  NAND2X1 U145 ( .A(n144), .B(n1167), .Y(n60) );
  NAND2X1 U148 ( .A(n322), .B(n329), .Y(n144) );
  XOR2X1 U149 ( .A(n154), .B(n61), .Y(product[39]) );
  AOI21X1 U150 ( .A(n1237), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n1195), .Y(n146) );
  OAI21X1 U152 ( .A(n1199), .B(n148), .C(n149), .Y(n147) );
  NAND2X1 U157 ( .A(n149), .B(n1109), .Y(n61) );
  NAND2X1 U160 ( .A(n330), .B(n339), .Y(n149) );
  XOR2X1 U161 ( .A(n163), .B(n62), .Y(product[38]) );
  AOI21X1 U162 ( .A(n1237), .B(n155), .C(n1198), .Y(n154) );
  NAND2X1 U165 ( .A(n159), .B(n171), .Y(n53) );
  AOI21X1 U166 ( .A(n172), .B(n159), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n161), .B(n166), .Y(n159) );
  OAI21X1 U168 ( .A(n1103), .B(n169), .C(n162), .Y(n160) );
  NAND2X1 U169 ( .A(n162), .B(n282), .Y(n62) );
  NOR2X1 U171 ( .A(n340), .B(n349), .Y(n161) );
  NAND2X1 U172 ( .A(n340), .B(n349), .Y(n162) );
  AOI21X1 U174 ( .A(n1237), .B(n164), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n1156), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n1156), .C(n169), .Y(n165) );
  NOR2X1 U181 ( .A(n361), .B(n350), .Y(n166) );
  NAND2X1 U182 ( .A(n361), .B(n350), .Y(n169) );
  XOR2X1 U183 ( .A(n179), .B(n64), .Y(product[36]) );
  AOI21X1 U184 ( .A(n1237), .B(n171), .C(n172), .Y(n170) );
  NOR2X1 U189 ( .A(n177), .B(n182), .Y(n171) );
  OAI21X1 U190 ( .A(n1032), .B(n183), .C(n178), .Y(n172) );
  NAND2X1 U191 ( .A(n178), .B(n284), .Y(n64) );
  NOR2X1 U193 ( .A(n373), .B(n362), .Y(n177) );
  NAND2X1 U194 ( .A(n373), .B(n362), .Y(n178) );
  XNOR2X1 U195 ( .A(n1237), .B(n65), .Y(product[35]) );
  AOI21X1 U196 ( .A(n285), .B(n1237), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n183), .B(n285), .Y(n65) );
  NOR2X1 U201 ( .A(n387), .B(n374), .Y(n182) );
  NAND2X1 U202 ( .A(n387), .B(n374), .Y(n183) );
  XOR2X1 U203 ( .A(n191), .B(n66), .Y(product[34]) );
  OAI21X1 U204 ( .A(n213), .B(n185), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n187), .B(n199), .Y(n185) );
  AOI21X1 U206 ( .A(n187), .B(n200), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n189), .B(n194), .Y(n187) );
  OAI21X1 U208 ( .A(n1047), .B(n197), .C(n190), .Y(n188) );
  NAND2X1 U209 ( .A(n190), .B(n286), .Y(n66) );
  NOR2X1 U211 ( .A(n401), .B(n388), .Y(n189) );
  NAND2X1 U212 ( .A(n401), .B(n388), .Y(n190) );
  XOR2X1 U213 ( .A(n198), .B(n67), .Y(product[33]) );
  AOI21X1 U214 ( .A(n212), .B(n192), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n1161), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n1161), .C(n197), .Y(n193) );
  NAND2X1 U219 ( .A(n197), .B(n287), .Y(n67) );
  NOR2X1 U221 ( .A(n415), .B(n402), .Y(n194) );
  NAND2X1 U222 ( .A(n415), .B(n402), .Y(n197) );
  XOR2X1 U223 ( .A(n207), .B(n68), .Y(product[32]) );
  AOI21X1 U224 ( .A(n199), .B(n212), .C(n200), .Y(n198) );
  NOR2X1 U229 ( .A(n210), .B(n205), .Y(n199) );
  OAI21X1 U230 ( .A(n205), .B(n211), .C(n206), .Y(n200) );
  NAND2X1 U231 ( .A(n206), .B(n288), .Y(n68) );
  NOR2X1 U233 ( .A(n429), .B(n416), .Y(n205) );
  NAND2X1 U234 ( .A(n429), .B(n416), .Y(n206) );
  XNOR2X1 U235 ( .A(n212), .B(n69), .Y(product[31]) );
  AOI21X1 U236 ( .A(n289), .B(n212), .C(n209), .Y(n207) );
  NAND2X1 U239 ( .A(n211), .B(n289), .Y(n69) );
  NOR2X1 U241 ( .A(n443), .B(n430), .Y(n210) );
  NAND2X1 U242 ( .A(n443), .B(n430), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n219), .B(n216), .Y(n214) );
  OAI21X1 U247 ( .A(n216), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n290), .Y(n70) );
  NOR2X1 U250 ( .A(n457), .B(n444), .Y(n216) );
  NAND2X1 U251 ( .A(n457), .B(n444), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n219), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n469), .B(n458), .Y(n219) );
  NAND2X1 U254 ( .A(n469), .B(n458), .Y(n220) );
  OAI21X1 U256 ( .A(n223), .B(n233), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1173), .B(n1168), .Y(n223) );
  AOI21X1 U258 ( .A(n1172), .B(n1168), .C(n1169), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n238), .B(n236), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n501), .B(n492), .Y(n236) );
  NAND2X1 U271 ( .A(n501), .B(n492), .Y(n237) );
  NOR2X1 U272 ( .A(n509), .B(n502), .Y(n238) );
  NAND2X1 U273 ( .A(n509), .B(n502), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n517), .B(n510), .Y(n241) );
  NAND2X1 U276 ( .A(n517), .B(n510), .Y(n242) );
  AOI21X1 U277 ( .A(n1171), .B(n248), .C(n1174), .Y(n243) );
  OAI21X1 U282 ( .A(n251), .B(n249), .C(n250), .Y(n248) );
  NOR2X1 U283 ( .A(n529), .B(n524), .Y(n249) );
  NAND2X1 U284 ( .A(n529), .B(n524), .Y(n250) );
  AOI21X1 U285 ( .A(n256), .B(n1175), .C(n1178), .Y(n251) );
  OAI21X1 U290 ( .A(n257), .B(n259), .C(n258), .Y(n256) );
  NOR2X1 U291 ( .A(n537), .B(n534), .Y(n257) );
  NAND2X1 U292 ( .A(n537), .B(n534), .Y(n258) );
  AOI21X1 U293 ( .A(n264), .B(n1176), .C(n1180), .Y(n259) );
  OAI21X1 U298 ( .A(n265), .B(n267), .C(n266), .Y(n264) );
  NOR2X1 U299 ( .A(n707), .B(n540), .Y(n265) );
  NAND2X1 U300 ( .A(n707), .B(n540), .Y(n266) );
  AOI21X1 U301 ( .A(n1181), .B(n1177), .C(n1179), .Y(n267) );
  XOR2X1 U308 ( .A(n295), .B(n291), .Y(n292) );
  FAX1 U310 ( .A(n296), .B(n584), .C(n299), .YC(n293), .YS(n294) );
  FAX1 U312 ( .A(n585), .B(n300), .C(n303), .YC(n297), .YS(n298) );
  FAX1 U313 ( .A(n305), .B(n574), .C(n601), .YC(n299), .YS(n300) );
  FAX1 U314 ( .A(n311), .B(n304), .C(n309), .YC(n301), .YS(n302) );
  FAX1 U315 ( .A(n306), .B(n602), .C(n586), .YC(n303), .YS(n304) );
  FAX1 U317 ( .A(n317), .B(n315), .C(n310), .YC(n307), .YS(n308) );
  FAX1 U318 ( .A(n603), .B(n587), .C(n312), .YC(n309), .YS(n310) );
  FAX1 U319 ( .A(n319), .B(n575), .C(n619), .YC(n311), .YS(n312) );
  FAX1 U320 ( .A(n318), .B(n316), .C(n323), .YC(n313), .YS(n314) );
  FAX1 U321 ( .A(n604), .B(n327), .C(n325), .YC(n315), .YS(n316) );
  FAX1 U322 ( .A(n320), .B(n620), .C(n588), .YC(n317), .YS(n318) );
  FAX1 U324 ( .A(n333), .B(n324), .C(n331), .YC(n321), .YS(n322) );
  FAX1 U325 ( .A(n328), .B(n335), .C(n326), .YC(n323), .YS(n324) );
  FAX1 U326 ( .A(n589), .B(n605), .C(n621), .YC(n325), .YS(n326) );
  FAX1 U327 ( .A(n337), .B(n576), .C(n637), .YC(n327), .YS(n328) );
  FAX1 U328 ( .A(n343), .B(n332), .C(n341), .YC(n329), .YS(n330) );
  FAX1 U330 ( .A(n622), .B(n606), .C(n347), .YC(n333), .YS(n334) );
  FAX1 U331 ( .A(n338), .B(n638), .C(n590), .YC(n335), .YS(n336) );
  FAX1 U333 ( .A(n344), .B(n351), .C(n342), .YC(n339), .YS(n340) );
  FAX1 U334 ( .A(n355), .B(n346), .C(n353), .YC(n341), .YS(n342) );
  FAX1 U335 ( .A(n623), .B(n348), .C(n357), .YC(n343), .YS(n344) );
  FAX1 U336 ( .A(n607), .B(n639), .C(n591), .YC(n345), .YS(n346) );
  FAX1 U337 ( .A(n359), .B(n577), .C(n655), .YC(n347), .YS(n348) );
  FAX1 U339 ( .A(n356), .B(n367), .C(n365), .YC(n351), .YS(n352) );
  FAX1 U341 ( .A(n608), .B(n624), .C(n640), .YC(n355), .YS(n356) );
  FAX1 U342 ( .A(n360), .B(n656), .C(n592), .YC(n357), .YS(n358) );
  FAX1 U346 ( .A(n383), .B(n1201), .C(n370), .YC(n365), .YS(n366) );
  FAX1 U348 ( .A(n609), .B(n657), .C(n641), .YC(n369), .YS(n370) );
  FAX1 U349 ( .A(n385), .B(n578), .C(n673), .YC(n371), .YS(n372) );
  FAX1 U350 ( .A(n378), .B(n389), .C(n376), .YC(n373), .YS(n374) );
  FAX1 U352 ( .A(n395), .B(n384), .C(n382), .YC(n377), .YS(n378) );
  FAX1 U354 ( .A(n658), .B(n610), .C(n642), .YC(n381), .YS(n382) );
  FAX1 U355 ( .A(n1202), .B(n674), .C(n594), .YC(n383), .YS(n384) );
  FAX1 U357 ( .A(n392), .B(n403), .C(n390), .YC(n387), .YS(n388) );
  FAX1 U360 ( .A(n997), .B(n411), .C(n409), .YC(n393), .YS(n394) );
  FAX1 U361 ( .A(n659), .B(n627), .C(n643), .YC(n395), .YS(n396) );
  FAX1 U362 ( .A(n611), .B(n595), .C(n675), .YC(n397), .YS(n398) );
  FAX1 U367 ( .A(n427), .B(n414), .C(n425), .YC(n407), .YS(n408) );
  FAX1 U368 ( .A(n644), .B(n612), .C(n660), .YC(n409), .YS(n410) );
  FAX1 U370 ( .A(n563), .B(n580), .C(n692), .YC(n413), .YS(n414) );
  FAX1 U371 ( .A(n420), .B(n431), .C(n418), .YC(n415), .YS(n416) );
  FAX1 U373 ( .A(n1188), .B(n439), .C(n426), .YC(n419), .YS(n420) );
  FAX1 U375 ( .A(n661), .B(n613), .C(n645), .YC(n423), .YS(n424) );
  FAX1 U376 ( .A(n629), .B(n677), .C(n597), .YC(n425), .YS(n426) );
  FAX1 U378 ( .A(n434), .B(n445), .C(n432), .YC(n429), .YS(n430) );
  FAX1 U382 ( .A(n662), .B(n646), .C(n630), .YC(n437), .YS(n438) );
  FAX1 U383 ( .A(n678), .B(n598), .C(n614), .YC(n439), .YS(n440) );
  FAX1 U384 ( .A(n582), .B(n710), .C(n694), .YC(n441), .YS(n442) );
  FAX1 U385 ( .A(n448), .B(n459), .C(n446), .YC(n443), .YS(n444) );
  FAX1 U386 ( .A(n463), .B(n450), .C(n461), .YC(n445), .YS(n446) );
  FAX1 U388 ( .A(n663), .B(n456), .C(n467), .YC(n449), .YS(n450) );
  FAX1 U390 ( .A(n647), .B(n695), .C(n599), .YC(n453), .YS(n454) );
  FAX1 U392 ( .A(n462), .B(n471), .C(n460), .YC(n457), .YS(n458) );
  FAX1 U394 ( .A(n1191), .B(n475), .C(n466), .YC(n461), .YS(n462) );
  FAX1 U395 ( .A(n696), .B(n680), .C(n479), .YC(n463), .YS(n464) );
  FAX1 U396 ( .A(n712), .B(n648), .C(n664), .YC(n465), .YS(n466) );
  FAX1 U397 ( .A(n600), .B(n616), .C(n632), .YC(n467), .YS(n468) );
  FAX1 U401 ( .A(n665), .B(n649), .C(n566), .YC(n475), .YS(n476) );
  FAX1 U402 ( .A(n633), .B(n681), .C(n617), .YC(n477), .YS(n478) );
  FAX1 U404 ( .A(n486), .B(n493), .C(n484), .YC(n481), .YS(n482) );
  FAX1 U405 ( .A(n490), .B(n488), .C(n495), .YC(n483), .YS(n484) );
  FAX1 U407 ( .A(n714), .B(n666), .C(n682), .YC(n487), .YS(n488) );
  FAX1 U408 ( .A(n618), .B(n650), .C(n634), .YC(n489), .YS(n490) );
  FAX1 U409 ( .A(n496), .B(n503), .C(n494), .YC(n491), .YS(n492) );
  FAX1 U410 ( .A(n507), .B(n505), .C(n498), .YC(n493), .YS(n494) );
  FAX1 U411 ( .A(n699), .B(n567), .C(n500), .YC(n495), .YS(n496) );
  HAX1 U413 ( .A(n715), .B(n651), .YC(n499), .YS(n500) );
  FAX1 U414 ( .A(n506), .B(n511), .C(n504), .YC(n501), .YS(n502) );
  FAX1 U415 ( .A(n515), .B(n513), .C(n508), .YC(n503), .YS(n504) );
  FAX1 U416 ( .A(n716), .B(n684), .C(n700), .YC(n505), .YS(n506) );
  FAX1 U417 ( .A(n636), .B(n668), .C(n652), .YC(n507), .YS(n508) );
  FAX1 U418 ( .A(n514), .B(n519), .C(n512), .YC(n509), .YS(n510) );
  FAX1 U419 ( .A(n568), .B(n516), .C(n521), .YC(n511), .YS(n512) );
  FAX1 U420 ( .A(n685), .B(n669), .C(n653), .YC(n513), .YS(n514) );
  HAX1 U421 ( .A(n717), .B(n701), .YC(n515), .YS(n516) );
  FAX1 U422 ( .A(n525), .B(n522), .C(n520), .YC(n517), .YS(n518) );
  FAX1 U423 ( .A(n718), .B(n702), .C(n527), .YC(n519), .YS(n520) );
  FAX1 U424 ( .A(n654), .B(n686), .C(n670), .YC(n521), .YS(n522) );
  FAX1 U425 ( .A(n528), .B(n531), .C(n526), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n719), .B(n569), .C(n671), .YC(n525), .YS(n526) );
  HAX1 U427 ( .A(n703), .B(n687), .YC(n527), .YS(n528) );
  FAX1 U428 ( .A(n704), .B(n535), .C(n532), .YC(n529), .YS(n530) );
  FAX1 U429 ( .A(n672), .B(n720), .C(n688), .YC(n531), .YS(n532) );
  FAX1 U430 ( .A(n570), .B(n689), .C(n536), .YC(n533), .YS(n534) );
  HAX1 U431 ( .A(n705), .B(n721), .YC(n535), .YS(n536) );
  FAX1 U432 ( .A(n690), .B(n722), .C(n706), .YC(n537), .YS(n538) );
  HAX1 U433 ( .A(n723), .B(n571), .YC(n539), .YS(n540) );
  NOR2X1 U434 ( .A(n918), .B(n1266), .Y(n573) );
  NOR2X1 U435 ( .A(n918), .B(n1264), .Y(n295) );
  NOR2X1 U436 ( .A(n918), .B(n728), .Y(n574) );
  NOR2X1 U437 ( .A(n918), .B(n729), .Y(n305) );
  NOR2X1 U438 ( .A(n918), .B(n730), .Y(n575) );
  NOR2X1 U439 ( .A(n918), .B(n1256), .Y(n319) );
  NOR2X1 U440 ( .A(n918), .B(n732), .Y(n576) );
  NOR2X1 U441 ( .A(n918), .B(n1252), .Y(n337) );
  NOR2X1 U442 ( .A(n918), .B(n1250), .Y(n577) );
  NOR2X1 U443 ( .A(n918), .B(n1248), .Y(n359) );
  NOR2X1 U444 ( .A(n918), .B(n1246), .Y(n578) );
  NOR2X1 U446 ( .A(n918), .B(n1242), .Y(n579) );
  NOR2X1 U447 ( .A(n918), .B(n1240), .Y(n580) );
  NOR2X1 U448 ( .A(n918), .B(n1238), .Y(n581) );
  OAI22X1 U466 ( .A(n918), .B(n1235), .C(n1231), .D(n757), .Y(n565) );
  OAI22X1 U469 ( .A(n918), .B(n1232), .C(n1234), .D(n741), .Y(n584) );
  OAI22X1 U470 ( .A(n1234), .B(n742), .C(n1232), .D(n741), .Y(n585) );
  OAI22X1 U471 ( .A(n1234), .B(n743), .C(n1231), .D(n742), .Y(n586) );
  OAI22X1 U472 ( .A(n1234), .B(n744), .C(n1232), .D(n743), .Y(n587) );
  OAI22X1 U473 ( .A(n1234), .B(n745), .C(n1231), .D(n744), .Y(n588) );
  OAI22X1 U474 ( .A(n1234), .B(n746), .C(n1232), .D(n745), .Y(n589) );
  OAI22X1 U475 ( .A(n1234), .B(n747), .C(n1231), .D(n746), .Y(n590) );
  OAI22X1 U476 ( .A(n1234), .B(n748), .C(n1232), .D(n747), .Y(n591) );
  OAI22X1 U477 ( .A(n1234), .B(n749), .C(n1231), .D(n748), .Y(n592) );
  OAI22X1 U478 ( .A(n1234), .B(n750), .C(n1232), .D(n749), .Y(n593) );
  OAI22X1 U479 ( .A(n1235), .B(n751), .C(n1231), .D(n750), .Y(n594) );
  OAI22X1 U480 ( .A(n1235), .B(n752), .C(n1232), .D(n751), .Y(n595) );
  OAI22X1 U481 ( .A(n1235), .B(n753), .C(n1231), .D(n752), .Y(n596) );
  OAI22X1 U482 ( .A(n1234), .B(n754), .C(n1232), .D(n753), .Y(n597) );
  OAI22X1 U483 ( .A(n1235), .B(n755), .C(n1231), .D(n754), .Y(n598) );
  OAI22X1 U484 ( .A(n1232), .B(n755), .C(n1235), .D(n756), .Y(n599) );
  XNOR2X1 U487 ( .A(n1031), .B(n1270), .Y(n741) );
  XNOR2X1 U488 ( .A(n1265), .B(n1270), .Y(n742) );
  XNOR2X1 U489 ( .A(n1263), .B(n1270), .Y(n743) );
  XNOR2X1 U490 ( .A(n1261), .B(n1270), .Y(n744) );
  XNOR2X1 U491 ( .A(n1259), .B(n1270), .Y(n745) );
  XNOR2X1 U492 ( .A(n1257), .B(n1270), .Y(n746) );
  XNOR2X1 U493 ( .A(n1255), .B(n1270), .Y(n747) );
  XNOR2X1 U494 ( .A(n1253), .B(n1269), .Y(n748) );
  XNOR2X1 U495 ( .A(n1251), .B(n1269), .Y(n749) );
  XNOR2X1 U496 ( .A(n1249), .B(n1269), .Y(n750) );
  XNOR2X1 U497 ( .A(n1247), .B(n1269), .Y(n751) );
  XNOR2X1 U498 ( .A(n1245), .B(n1269), .Y(n752) );
  XNOR2X1 U500 ( .A(n1241), .B(n1269), .Y(n754) );
  XNOR2X1 U501 ( .A(n1239), .B(n1269), .Y(n755) );
  XNOR2X1 U502 ( .A(n1271), .B(n1269), .Y(n756) );
  OAI22X1 U505 ( .A(n1065), .B(n1230), .C(n1226), .D(n774), .Y(n566) );
  OAI22X1 U508 ( .A(n1065), .B(n1138), .C(n1230), .D(n758), .Y(n602) );
  OAI22X1 U509 ( .A(n1230), .B(n759), .C(n1138), .D(n758), .Y(n603) );
  OAI22X1 U510 ( .A(n1230), .B(n760), .C(n1226), .D(n759), .Y(n604) );
  OAI22X1 U511 ( .A(n1230), .B(n761), .C(n1138), .D(n760), .Y(n605) );
  OAI22X1 U512 ( .A(n1230), .B(n762), .C(n1226), .D(n761), .Y(n606) );
  OAI22X1 U513 ( .A(n1230), .B(n763), .C(n1138), .D(n762), .Y(n607) );
  OAI22X1 U514 ( .A(n1230), .B(n764), .C(n1226), .D(n763), .Y(n608) );
  OAI22X1 U515 ( .A(n1229), .B(n765), .C(n1138), .D(n764), .Y(n609) );
  OAI22X1 U516 ( .A(n1229), .B(n766), .C(n1226), .D(n765), .Y(n610) );
  OAI22X1 U517 ( .A(n1230), .B(n767), .C(n1138), .D(n766), .Y(n611) );
  OAI22X1 U518 ( .A(n1229), .B(n768), .C(n1226), .D(n767), .Y(n612) );
  OAI22X1 U519 ( .A(n1229), .B(n769), .C(n1138), .D(n768), .Y(n613) );
  OAI22X1 U520 ( .A(n1230), .B(n770), .C(n1226), .D(n769), .Y(n614) );
  OAI22X1 U521 ( .A(n1230), .B(n771), .C(n1138), .D(n770), .Y(n615) );
  OAI22X1 U522 ( .A(n1229), .B(n772), .C(n1226), .D(n771), .Y(n616) );
  OAI22X1 U523 ( .A(n1138), .B(n772), .C(n1230), .D(n773), .Y(n617) );
  AND2X1 U524 ( .A(n1271), .B(n1139), .Y(n618) );
  XNOR2X1 U526 ( .A(n1031), .B(n1164), .Y(n758) );
  XNOR2X1 U527 ( .A(n1265), .B(n996), .Y(n759) );
  XNOR2X1 U528 ( .A(n1263), .B(n1165), .Y(n760) );
  XNOR2X1 U529 ( .A(n1261), .B(n996), .Y(n761) );
  XNOR2X1 U530 ( .A(n1259), .B(n1164), .Y(n762) );
  XNOR2X1 U531 ( .A(n1257), .B(n1165), .Y(n763) );
  XNOR2X1 U532 ( .A(n1255), .B(n1164), .Y(n764) );
  XNOR2X1 U533 ( .A(n1253), .B(n996), .Y(n765) );
  XNOR2X1 U534 ( .A(n1251), .B(n996), .Y(n766) );
  XNOR2X1 U535 ( .A(n1249), .B(n1165), .Y(n767) );
  XNOR2X1 U536 ( .A(n1247), .B(n996), .Y(n768) );
  XNOR2X1 U537 ( .A(n1245), .B(n1165), .Y(n769) );
  XNOR2X1 U538 ( .A(n1243), .B(n1164), .Y(n770) );
  XNOR2X1 U539 ( .A(n998), .B(n1164), .Y(n771) );
  XNOR2X1 U540 ( .A(n1239), .B(n1165), .Y(n772) );
  XNOR2X1 U541 ( .A(n1271), .B(n996), .Y(n773) );
  OR2X1 U542 ( .A(n1271), .B(n1065), .Y(n774) );
  OAI22X1 U544 ( .A(n1090), .B(n1105), .C(n1197), .D(n791), .Y(n567) );
  OAI22X1 U547 ( .A(n1090), .B(n1197), .C(n1108), .D(n775), .Y(n620) );
  OAI22X1 U548 ( .A(n1010), .B(n776), .C(n1197), .D(n775), .Y(n621) );
  OAI22X1 U549 ( .A(n1108), .B(n777), .C(n1197), .D(n776), .Y(n622) );
  OAI22X1 U550 ( .A(n1108), .B(n778), .C(n1197), .D(n777), .Y(n623) );
  OAI22X1 U551 ( .A(n1105), .B(n779), .C(n1197), .D(n778), .Y(n624) );
  OAI22X1 U552 ( .A(n1010), .B(n780), .C(n1197), .D(n779), .Y(n625) );
  OAI22X1 U553 ( .A(n1105), .B(n781), .C(n1197), .D(n780), .Y(n626) );
  OAI22X1 U554 ( .A(n1105), .B(n782), .C(n1196), .D(n781), .Y(n627) );
  OAI22X1 U555 ( .A(n1010), .B(n783), .C(n1197), .D(n782), .Y(n628) );
  OAI22X1 U556 ( .A(n1010), .B(n784), .C(n1196), .D(n783), .Y(n629) );
  OAI22X1 U557 ( .A(n1105), .B(n785), .C(n1197), .D(n784), .Y(n630) );
  OAI22X1 U558 ( .A(n1010), .B(n786), .C(n1196), .D(n785), .Y(n631) );
  OAI22X1 U559 ( .A(n1105), .B(n787), .C(n1196), .D(n786), .Y(n632) );
  OAI22X1 U560 ( .A(n1105), .B(n788), .C(n1196), .D(n787), .Y(n633) );
  OAI22X1 U561 ( .A(n1010), .B(n789), .C(n1197), .D(n788), .Y(n634) );
  AND2X1 U563 ( .A(n1271), .B(n549), .Y(n636) );
  XNOR2X1 U565 ( .A(n1031), .B(n1284), .Y(n775) );
  XNOR2X1 U566 ( .A(n1265), .B(n1284), .Y(n776) );
  XNOR2X1 U567 ( .A(n1263), .B(n1284), .Y(n777) );
  XNOR2X1 U568 ( .A(n1261), .B(n1283), .Y(n778) );
  XNOR2X1 U569 ( .A(n1259), .B(n1283), .Y(n779) );
  XNOR2X1 U570 ( .A(n1257), .B(n1283), .Y(n780) );
  XNOR2X1 U571 ( .A(n1255), .B(n1283), .Y(n781) );
  XNOR2X1 U572 ( .A(n1253), .B(n1283), .Y(n782) );
  XNOR2X1 U573 ( .A(n1251), .B(n1283), .Y(n783) );
  XNOR2X1 U574 ( .A(n1249), .B(n1283), .Y(n784) );
  XNOR2X1 U575 ( .A(n1247), .B(n1283), .Y(n785) );
  XNOR2X1 U576 ( .A(n1245), .B(n1283), .Y(n786) );
  XNOR2X1 U577 ( .A(n1243), .B(n1283), .Y(n787) );
  XNOR2X1 U578 ( .A(n1241), .B(n1283), .Y(n788) );
  XNOR2X1 U579 ( .A(n1239), .B(n1283), .Y(n789) );
  XNOR2X1 U580 ( .A(n1271), .B(n1283), .Y(n790) );
  OR2X1 U581 ( .A(n1271), .B(n1090), .Y(n791) );
  OAI22X1 U583 ( .A(n1282), .B(n1104), .C(n1223), .D(n808), .Y(n568) );
  OAI22X1 U586 ( .A(n1282), .B(n1223), .C(n1104), .D(n792), .Y(n638) );
  OAI22X1 U587 ( .A(n1104), .B(n793), .C(n1223), .D(n792), .Y(n639) );
  OAI22X1 U588 ( .A(n1104), .B(n794), .C(n1223), .D(n793), .Y(n640) );
  OAI22X1 U589 ( .A(n1225), .B(n795), .C(n1223), .D(n794), .Y(n641) );
  OAI22X1 U590 ( .A(n1225), .B(n796), .C(n1223), .D(n795), .Y(n642) );
  OAI22X1 U591 ( .A(n1104), .B(n797), .C(n1223), .D(n796), .Y(n643) );
  OAI22X1 U592 ( .A(n1225), .B(n798), .C(n1223), .D(n797), .Y(n644) );
  OAI22X1 U593 ( .A(n1225), .B(n799), .C(n1223), .D(n798), .Y(n645) );
  OAI22X1 U594 ( .A(n1104), .B(n800), .C(n1223), .D(n799), .Y(n646) );
  OAI22X1 U595 ( .A(n1225), .B(n801), .C(n1223), .D(n800), .Y(n647) );
  OAI22X1 U596 ( .A(n1225), .B(n802), .C(n1223), .D(n801), .Y(n648) );
  OAI22X1 U597 ( .A(n1225), .B(n803), .C(n1223), .D(n802), .Y(n649) );
  OAI22X1 U598 ( .A(n1104), .B(n804), .C(n1223), .D(n803), .Y(n650) );
  OAI22X1 U599 ( .A(n1225), .B(n805), .C(n1223), .D(n804), .Y(n651) );
  OAI22X1 U600 ( .A(n1104), .B(n806), .C(n1223), .D(n805), .Y(n652) );
  OAI22X1 U601 ( .A(n1223), .B(n806), .C(n1104), .D(n807), .Y(n653) );
  AND2X1 U602 ( .A(n1271), .B(n1222), .Y(n654) );
  XNOR2X1 U604 ( .A(n1031), .B(n1068), .Y(n792) );
  XNOR2X1 U605 ( .A(n1265), .B(n1068), .Y(n793) );
  XNOR2X1 U606 ( .A(n1263), .B(n1068), .Y(n794) );
  XNOR2X1 U607 ( .A(n1261), .B(n1281), .Y(n795) );
  XNOR2X1 U608 ( .A(n1259), .B(n1281), .Y(n796) );
  XNOR2X1 U609 ( .A(n1257), .B(n1281), .Y(n797) );
  XNOR2X1 U610 ( .A(n1255), .B(n1281), .Y(n798) );
  XNOR2X1 U611 ( .A(n1253), .B(n1281), .Y(n799) );
  XNOR2X1 U612 ( .A(n1251), .B(n1281), .Y(n800) );
  XNOR2X1 U613 ( .A(n1249), .B(n1281), .Y(n801) );
  XNOR2X1 U614 ( .A(n1247), .B(n1281), .Y(n802) );
  XNOR2X1 U615 ( .A(n1245), .B(n1281), .Y(n803) );
  XNOR2X1 U616 ( .A(n1243), .B(n1281), .Y(n804) );
  XNOR2X1 U617 ( .A(n1241), .B(n1281), .Y(n805) );
  XNOR2X1 U618 ( .A(n1239), .B(n1281), .Y(n806) );
  XNOR2X1 U619 ( .A(n1271), .B(n1281), .Y(n807) );
  OR2X1 U620 ( .A(n1092), .B(n1282), .Y(n808) );
  OAI22X1 U622 ( .A(n1280), .B(n1221), .C(n1218), .D(n825), .Y(n569) );
  OAI22X1 U625 ( .A(n1280), .B(n1219), .C(n1221), .D(n809), .Y(n656) );
  OAI22X1 U626 ( .A(n1221), .B(n810), .C(n1219), .D(n809), .Y(n657) );
  OAI22X1 U627 ( .A(n1221), .B(n811), .C(n1218), .D(n810), .Y(n658) );
  OAI22X1 U628 ( .A(n1221), .B(n812), .C(n1219), .D(n811), .Y(n659) );
  OAI22X1 U629 ( .A(n1221), .B(n813), .C(n1218), .D(n812), .Y(n660) );
  OAI22X1 U630 ( .A(n1221), .B(n814), .C(n1219), .D(n813), .Y(n661) );
  OAI22X1 U631 ( .A(n815), .B(n1221), .C(n1218), .D(n814), .Y(n662) );
  OAI22X1 U632 ( .A(n1221), .B(n816), .C(n1219), .D(n815), .Y(n663) );
  OAI22X1 U633 ( .A(n1221), .B(n817), .C(n1218), .D(n816), .Y(n664) );
  OAI22X1 U634 ( .A(n1066), .B(n818), .C(n1219), .D(n817), .Y(n665) );
  OAI22X1 U635 ( .A(n1221), .B(n819), .C(n1218), .D(n818), .Y(n666) );
  OAI22X1 U636 ( .A(n820), .B(n1066), .C(n1219), .D(n819), .Y(n667) );
  OAI22X1 U637 ( .A(n1221), .B(n821), .C(n1218), .D(n820), .Y(n668) );
  OAI22X1 U638 ( .A(n1221), .B(n822), .C(n1219), .D(n821), .Y(n669) );
  OAI22X1 U639 ( .A(n1221), .B(n823), .C(n1218), .D(n822), .Y(n670) );
  OAI22X1 U640 ( .A(n1219), .B(n823), .C(n1221), .D(n824), .Y(n671) );
  AND2X1 U641 ( .A(n1271), .B(n555), .Y(n672) );
  XNOR2X1 U643 ( .A(n1267), .B(n1279), .Y(n809) );
  XNOR2X1 U644 ( .A(n1265), .B(n1279), .Y(n810) );
  XNOR2X1 U645 ( .A(n1263), .B(n1279), .Y(n811) );
  XNOR2X1 U646 ( .A(n1261), .B(n1279), .Y(n812) );
  XNOR2X1 U647 ( .A(n1259), .B(n19), .Y(n813) );
  XNOR2X1 U649 ( .A(n1255), .B(n1279), .Y(n815) );
  XNOR2X1 U650 ( .A(n1253), .B(n1279), .Y(n816) );
  XNOR2X1 U651 ( .A(n1251), .B(n1279), .Y(n817) );
  XNOR2X1 U652 ( .A(n1249), .B(n1279), .Y(n818) );
  XNOR2X1 U653 ( .A(n1247), .B(n1279), .Y(n819) );
  XNOR2X1 U654 ( .A(n1245), .B(n1279), .Y(n820) );
  XNOR2X1 U655 ( .A(n1243), .B(n1279), .Y(n821) );
  XNOR2X1 U656 ( .A(n1241), .B(n1279), .Y(n822) );
  XNOR2X1 U657 ( .A(n1239), .B(n1279), .Y(n823) );
  XNOR2X1 U658 ( .A(n1271), .B(n1279), .Y(n824) );
  OR2X1 U659 ( .A(n1271), .B(n1280), .Y(n825) );
  OAI22X1 U661 ( .A(n1278), .B(n1216), .C(n1215), .D(n842), .Y(n570) );
  OAI22X1 U664 ( .A(n1278), .B(n1022), .C(n1217), .D(n826), .Y(n674) );
  OAI22X1 U665 ( .A(n1217), .B(n827), .C(n1215), .D(n826), .Y(n675) );
  OAI22X1 U666 ( .A(n1216), .B(n828), .C(n1215), .D(n827), .Y(n676) );
  OAI22X1 U667 ( .A(n1217), .B(n829), .C(n1215), .D(n828), .Y(n677) );
  OAI22X1 U668 ( .A(n1216), .B(n830), .C(n1022), .D(n829), .Y(n678) );
  OAI22X1 U669 ( .A(n1217), .B(n831), .C(n1215), .D(n830), .Y(n679) );
  OAI22X1 U670 ( .A(n1216), .B(n832), .C(n1215), .D(n831), .Y(n680) );
  OAI22X1 U671 ( .A(n1216), .B(n833), .C(n1215), .D(n832), .Y(n681) );
  OAI22X1 U672 ( .A(n1217), .B(n834), .C(n1215), .D(n833), .Y(n682) );
  OAI22X1 U673 ( .A(n1216), .B(n835), .C(n1215), .D(n834), .Y(n683) );
  OAI22X1 U674 ( .A(n1084), .B(n836), .C(n1215), .D(n835), .Y(n684) );
  OAI22X1 U675 ( .A(n1216), .B(n837), .C(n1215), .D(n836), .Y(n685) );
  OAI22X1 U676 ( .A(n1084), .B(n838), .C(n1215), .D(n837), .Y(n686) );
  OAI22X1 U677 ( .A(n1216), .B(n839), .C(n1215), .D(n838), .Y(n687) );
  OAI22X1 U678 ( .A(n1084), .B(n840), .C(n1215), .D(n839), .Y(n688) );
  OAI22X1 U679 ( .A(n1215), .B(n840), .C(n1084), .D(n841), .Y(n689) );
  AND2X1 U680 ( .A(n1092), .B(n1184), .Y(n690) );
  XNOR2X1 U682 ( .A(n1267), .B(n1162), .Y(n826) );
  XNOR2X1 U683 ( .A(n1265), .B(n1276), .Y(n827) );
  XNOR2X1 U684 ( .A(n1263), .B(n1163), .Y(n828) );
  XNOR2X1 U685 ( .A(n1261), .B(n1162), .Y(n829) );
  XNOR2X1 U686 ( .A(n1259), .B(n1163), .Y(n830) );
  XNOR2X1 U687 ( .A(n1257), .B(n1276), .Y(n831) );
  XNOR2X1 U688 ( .A(n1255), .B(n1276), .Y(n832) );
  XNOR2X1 U689 ( .A(n1253), .B(n1162), .Y(n833) );
  XNOR2X1 U690 ( .A(n1251), .B(n1276), .Y(n834) );
  XNOR2X1 U691 ( .A(n1249), .B(n1163), .Y(n835) );
  XNOR2X1 U692 ( .A(n1247), .B(n1163), .Y(n836) );
  XNOR2X1 U693 ( .A(n1245), .B(n1162), .Y(n837) );
  XNOR2X1 U694 ( .A(n1243), .B(n1162), .Y(n838) );
  XNOR2X1 U695 ( .A(n1241), .B(n1163), .Y(n839) );
  XNOR2X1 U696 ( .A(n1239), .B(n1276), .Y(n840) );
  XNOR2X1 U697 ( .A(n1092), .B(n1276), .Y(n841) );
  OR2X1 U698 ( .A(n1092), .B(n1278), .Y(n842) );
  OAI22X1 U700 ( .A(n1275), .B(n1214), .C(n1211), .D(n859), .Y(n571) );
  OAI22X1 U703 ( .A(n1275), .B(n1212), .C(n1213), .D(n843), .Y(n692) );
  OAI22X1 U704 ( .A(n1213), .B(n844), .C(n1212), .D(n843), .Y(n693) );
  OAI22X1 U705 ( .A(n1213), .B(n845), .C(n1211), .D(n844), .Y(n694) );
  OAI22X1 U706 ( .A(n1213), .B(n846), .C(n1212), .D(n845), .Y(n695) );
  OAI22X1 U707 ( .A(n1214), .B(n847), .C(n1211), .D(n846), .Y(n696) );
  OAI22X1 U708 ( .A(n1214), .B(n848), .C(n1212), .D(n847), .Y(n697) );
  OAI22X1 U709 ( .A(n1214), .B(n849), .C(n1211), .D(n848), .Y(n698) );
  OAI22X1 U710 ( .A(n1214), .B(n850), .C(n1212), .D(n849), .Y(n699) );
  OAI22X1 U711 ( .A(n1214), .B(n851), .C(n1211), .D(n850), .Y(n700) );
  OAI22X1 U712 ( .A(n1214), .B(n852), .C(n1212), .D(n851), .Y(n701) );
  OAI22X1 U713 ( .A(n1214), .B(n853), .C(n1211), .D(n852), .Y(n702) );
  OAI22X1 U714 ( .A(n1214), .B(n854), .C(n1212), .D(n853), .Y(n703) );
  OAI22X1 U715 ( .A(n1214), .B(n855), .C(n1211), .D(n854), .Y(n704) );
  OAI22X1 U716 ( .A(n1214), .B(n856), .C(n1212), .D(n855), .Y(n705) );
  OAI22X1 U717 ( .A(n1214), .B(n857), .C(n1211), .D(n856), .Y(n706) );
  OAI22X1 U718 ( .A(n1211), .B(n857), .C(n1214), .D(n858), .Y(n707) );
  XNOR2X1 U721 ( .A(n1267), .B(n1126), .Y(n843) );
  XNOR2X1 U722 ( .A(n1265), .B(n1126), .Y(n844) );
  XNOR2X1 U723 ( .A(n1263), .B(n1126), .Y(n845) );
  XNOR2X1 U724 ( .A(n1261), .B(n1126), .Y(n846) );
  XNOR2X1 U725 ( .A(n1259), .B(n1071), .Y(n847) );
  XNOR2X1 U726 ( .A(n1257), .B(n1071), .Y(n848) );
  XNOR2X1 U727 ( .A(n1255), .B(n1071), .Y(n849) );
  XNOR2X1 U728 ( .A(n1253), .B(n1071), .Y(n850) );
  XNOR2X1 U729 ( .A(n1251), .B(n1071), .Y(n851) );
  XNOR2X1 U730 ( .A(n1249), .B(n1071), .Y(n852) );
  XNOR2X1 U731 ( .A(n1247), .B(n1071), .Y(n853) );
  XNOR2X1 U732 ( .A(n1245), .B(n1071), .Y(n854) );
  XNOR2X1 U733 ( .A(n1243), .B(n1071), .Y(n855) );
  XNOR2X1 U734 ( .A(n1241), .B(n1071), .Y(n856) );
  XNOR2X1 U735 ( .A(n1239), .B(n1071), .Y(n857) );
  XNOR2X1 U736 ( .A(n1092), .B(n1071), .Y(n858) );
  OR2X1 U737 ( .A(n1092), .B(n1275), .Y(n859) );
  OAI22X1 U739 ( .A(n1274), .B(n1209), .C(n917), .D(n876), .Y(n572) );
  OAI22X1 U742 ( .A(n917), .B(n1274), .C(n1210), .D(n860), .Y(n710) );
  OAI22X1 U743 ( .A(n1210), .B(n861), .C(n917), .D(n860), .Y(n711) );
  OAI22X1 U744 ( .A(n1210), .B(n862), .C(n917), .D(n861), .Y(n712) );
  OAI22X1 U745 ( .A(n1210), .B(n863), .C(n917), .D(n862), .Y(n713) );
  OAI22X1 U746 ( .A(n1209), .B(n864), .C(n917), .D(n863), .Y(n714) );
  OAI22X1 U747 ( .A(n1210), .B(n865), .C(n917), .D(n864), .Y(n715) );
  OAI22X1 U748 ( .A(n1209), .B(n866), .C(n917), .D(n865), .Y(n716) );
  OAI22X1 U749 ( .A(n1209), .B(n867), .C(n917), .D(n866), .Y(n717) );
  OAI22X1 U750 ( .A(n1209), .B(n868), .C(n917), .D(n867), .Y(n718) );
  OAI22X1 U751 ( .A(n1209), .B(n869), .C(n917), .D(n868), .Y(n719) );
  OAI22X1 U752 ( .A(n1209), .B(n870), .C(n917), .D(n869), .Y(n720) );
  OAI22X1 U753 ( .A(n1209), .B(n871), .C(n917), .D(n870), .Y(n721) );
  OAI22X1 U754 ( .A(n1209), .B(n872), .C(n917), .D(n871), .Y(n722) );
  OAI22X1 U755 ( .A(n1209), .B(n873), .C(n917), .D(n872), .Y(n723) );
  OAI22X1 U756 ( .A(n1209), .B(n874), .C(n917), .D(n873), .Y(n724) );
  OAI22X1 U757 ( .A(n917), .B(n874), .C(n1209), .D(n875), .Y(n725) );
  XNOR2X1 U759 ( .A(n1265), .B(n1107), .Y(n861) );
  XNOR2X1 U760 ( .A(n1263), .B(n1107), .Y(n862) );
  XNOR2X1 U761 ( .A(n1261), .B(n1192), .Y(n863) );
  XNOR2X1 U762 ( .A(n1259), .B(n1192), .Y(n864) );
  XNOR2X1 U763 ( .A(n1257), .B(n1192), .Y(n865) );
  XNOR2X1 U764 ( .A(n1255), .B(n1194), .Y(n866) );
  XNOR2X1 U765 ( .A(n1253), .B(n1193), .Y(n867) );
  XNOR2X1 U766 ( .A(n1251), .B(n1193), .Y(n868) );
  XNOR2X1 U767 ( .A(n1249), .B(n1194), .Y(n869) );
  XNOR2X1 U768 ( .A(n1247), .B(n1193), .Y(n870) );
  XNOR2X1 U769 ( .A(n1245), .B(n1194), .Y(n871) );
  XNOR2X1 U770 ( .A(n1243), .B(n1194), .Y(n872) );
  XNOR2X1 U771 ( .A(n1241), .B(n1193), .Y(n873) );
  XNOR2X1 U772 ( .A(n1239), .B(n1194), .Y(n874) );
  XNOR2X1 U773 ( .A(n1092), .B(n1193), .Y(n875) );
  OR2X1 U774 ( .A(n1092), .B(n1274), .Y(n876) );
  NAND2X1 U804 ( .A(n894), .B(n1227), .Y(n42) );
  XOR2X1 U805 ( .A(n1287), .B(a[27]), .Y(n894) );
  XOR2X1 U808 ( .A(n1284), .B(a[25]), .Y(n895) );
  NAND2X1 U810 ( .A(n896), .B(n28), .Y(n30) );
  XOR2X1 U811 ( .A(n25), .B(a[23]), .Y(n896) );
  XNOR2X1 U812 ( .A(n19), .B(a[23]), .Y(n28) );
  XOR2X1 U817 ( .A(n1277), .B(a[19]), .Y(n898) );
  XOR2X1 U823 ( .A(a[15]), .B(n1), .Y(n900) );
  INVX4 U828 ( .A(n1013), .Y(n1209) );
  BUFX4 U829 ( .A(n137), .Y(n1189) );
  INVX8 U830 ( .A(n1184), .Y(n1215) );
  INVX4 U831 ( .A(n42), .Y(n1228) );
  INVX4 U832 ( .A(n1266), .Y(n1267) );
  INVX4 U833 ( .A(n1275), .Y(n1126) );
  INVX4 U834 ( .A(n7), .Y(n1275) );
  INVX4 U835 ( .A(n1139), .Y(n1226) );
  INVX4 U836 ( .A(n1204), .Y(n1217) );
  BUFX4 U837 ( .A(n53), .Y(n1195) );
  INVX4 U838 ( .A(n891), .Y(n1238) );
  INVX4 U839 ( .A(n1286), .Y(n995) );
  INVX8 U840 ( .A(n995), .Y(n996) );
  BUFX4 U841 ( .A(n413), .Y(n997) );
  INVX8 U842 ( .A(n1282), .Y(n1281) );
  INVX2 U843 ( .A(n1274), .Y(n1273) );
  INVX2 U844 ( .A(n889), .Y(n1242) );
  BUFX2 U845 ( .A(n1273), .Y(n1192) );
  INVX4 U846 ( .A(n1275), .Y(n1071) );
  INVX2 U847 ( .A(n1036), .Y(n1037) );
  INVX2 U848 ( .A(n881), .Y(n1258) );
  INVX2 U849 ( .A(n1065), .Y(n1286) );
  INVX4 U850 ( .A(n1242), .Y(n1243) );
  INVX2 U851 ( .A(n883), .Y(n1254) );
  INVX2 U852 ( .A(n1106), .Y(n1107) );
  BUFX2 U853 ( .A(n438), .Y(n1190) );
  INVX4 U854 ( .A(n25), .Y(n1282) );
  INVX2 U855 ( .A(n880), .Y(n1260) );
  INVX4 U856 ( .A(n1222), .Y(n1223) );
  INVX4 U857 ( .A(n1233), .Y(n1235) );
  INVX2 U858 ( .A(n364), .Y(n1128) );
  INVX2 U859 ( .A(n366), .Y(n1129) );
  INVX4 U860 ( .A(n1233), .Y(n1234) );
  INVX2 U861 ( .A(n877), .Y(n1266) );
  INVX2 U862 ( .A(n1284), .Y(n1090) );
  INVX1 U863 ( .A(n100), .Y(n98) );
  INVX4 U864 ( .A(n1055), .Y(n563) );
  INVX2 U865 ( .A(n1240), .Y(n998) );
  INVX4 U866 ( .A(n1240), .Y(n1241) );
  XNOR2X1 U867 ( .A(n999), .B(n451), .Y(n436) );
  XNOR2X1 U868 ( .A(n1015), .B(n453), .Y(n999) );
  INVX1 U869 ( .A(n917), .Y(n1000) );
  XOR2X1 U870 ( .A(n417), .B(n406), .Y(n1001) );
  XOR2X1 U871 ( .A(n404), .B(n1001), .Y(n402) );
  NAND2X1 U872 ( .A(n404), .B(n417), .Y(n1002) );
  NAND2X1 U873 ( .A(n404), .B(n406), .Y(n1003) );
  NAND2X1 U874 ( .A(n417), .B(n406), .Y(n1004) );
  NAND3X1 U875 ( .A(n1003), .B(n1002), .C(n1004), .Y(n401) );
  BUFX2 U876 ( .A(n424), .Y(n1188) );
  XOR2X1 U877 ( .A(n713), .B(n697), .Y(n480) );
  INVX2 U878 ( .A(n1005), .Y(n479) );
  NAND2X1 U879 ( .A(n713), .B(n697), .Y(n1005) );
  XOR2X1 U880 ( .A(n428), .B(n441), .Y(n1086) );
  INVX1 U881 ( .A(n441), .Y(n1069) );
  INVX2 U882 ( .A(n879), .Y(n1262) );
  BUFX4 U883 ( .A(n477), .Y(n1191) );
  AND2X2 U884 ( .A(n1092), .B(n1182), .Y(n708) );
  XOR2X1 U885 ( .A(n380), .B(n1037), .Y(n1006) );
  XOR2X1 U886 ( .A(n391), .B(n1006), .Y(n376) );
  NAND2X1 U887 ( .A(n391), .B(n380), .Y(n1007) );
  NAND2X1 U888 ( .A(n391), .B(n1037), .Y(n1008) );
  NAND2X1 U889 ( .A(n380), .B(n1037), .Y(n1009) );
  NAND3X1 U890 ( .A(n1008), .B(n1007), .C(n1009), .Y(n375) );
  INVX2 U891 ( .A(n49), .Y(n1272) );
  NAND2X1 U892 ( .A(n895), .B(n1011), .Y(n1010) );
  XNOR2X1 U893 ( .A(n25), .B(a[25]), .Y(n1011) );
  XOR2X1 U894 ( .A(n13), .B(a[21]), .Y(n1012) );
  AND2X2 U895 ( .A(n917), .B(n900), .Y(n1013) );
  OR2X2 U896 ( .A(n308), .B(n313), .Y(n1014) );
  AND2X2 U897 ( .A(n711), .B(n615), .Y(n1015) );
  INVX2 U898 ( .A(n30), .Y(n1224) );
  AND2X2 U899 ( .A(n169), .B(n283), .Y(n1016) );
  INVX4 U900 ( .A(n1250), .Y(n1251) );
  INVX2 U901 ( .A(n885), .Y(n1250) );
  INVX4 U902 ( .A(n1198), .Y(n1199) );
  INVX2 U903 ( .A(n52), .Y(n1198) );
  INVX2 U904 ( .A(n1227), .Y(n1139) );
  INVX4 U905 ( .A(n1244), .Y(n1245) );
  INVX4 U906 ( .A(n1246), .Y(n1247) );
  INVX2 U907 ( .A(n887), .Y(n1246) );
  INVX4 U908 ( .A(n1248), .Y(n1249) );
  INVX2 U909 ( .A(n886), .Y(n1248) );
  INVX4 U910 ( .A(n1252), .Y(n1253) );
  INVX2 U911 ( .A(n884), .Y(n1252) );
  INVX4 U912 ( .A(n1264), .Y(n1265) );
  INVX2 U913 ( .A(n878), .Y(n1264) );
  OR2X2 U914 ( .A(n292), .B(n293), .Y(n1017) );
  XOR2X1 U915 ( .A(n371), .B(n358), .Y(n1018) );
  XOR2X1 U916 ( .A(n369), .B(n1018), .Y(n354) );
  NAND2X1 U917 ( .A(n369), .B(n371), .Y(n1019) );
  NAND2X1 U918 ( .A(n369), .B(n358), .Y(n1020) );
  NAND2X1 U919 ( .A(n371), .B(n358), .Y(n1021) );
  NAND3X1 U920 ( .A(n1020), .B(n1019), .C(n1021), .Y(n353) );
  INVX2 U921 ( .A(n888), .Y(n1244) );
  INVX2 U922 ( .A(n1224), .Y(n1104) );
  INVX2 U923 ( .A(n1069), .Y(n1070) );
  BUFX2 U924 ( .A(n1011), .Y(n1196) );
  XNOR2X1 U925 ( .A(n7), .B(a[19]), .Y(n1022) );
  INVX2 U926 ( .A(n1022), .Y(n1184) );
  XOR2X1 U927 ( .A(n419), .B(n421), .Y(n1140) );
  XOR2X1 U928 ( .A(n465), .B(n452), .Y(n1023) );
  XOR2X1 U929 ( .A(n1023), .B(n454), .Y(n448) );
  NAND2X1 U930 ( .A(n465), .B(n452), .Y(n1024) );
  NAND2X1 U931 ( .A(n465), .B(n454), .Y(n1025) );
  NAND2X1 U932 ( .A(n452), .B(n454), .Y(n1026) );
  NAND3X1 U933 ( .A(n1024), .B(n1025), .C(n1026), .Y(n447) );
  XOR2X1 U934 ( .A(n449), .B(n436), .Y(n1027) );
  XOR2X1 U935 ( .A(n1027), .B(n447), .Y(n432) );
  NAND2X1 U936 ( .A(n449), .B(n436), .Y(n1028) );
  NAND2X1 U937 ( .A(n449), .B(n447), .Y(n1029) );
  NAND2X1 U938 ( .A(n436), .B(n447), .Y(n1030) );
  NAND3X1 U939 ( .A(n1028), .B(n1029), .C(n1030), .Y(n431) );
  INVX2 U940 ( .A(n1266), .Y(n1031) );
  NOR2X1 U941 ( .A(n373), .B(n362), .Y(n1032) );
  XNOR2X1 U942 ( .A(n1266), .B(n1106), .Y(n860) );
  XOR2X1 U943 ( .A(n1256), .B(n1279), .Y(n814) );
  XNOR2X1 U944 ( .A(n86), .B(n1033), .Y(product[45]) );
  AND2X2 U945 ( .A(n85), .B(n275), .Y(n1033) );
  XNOR2X1 U946 ( .A(n112), .B(n1034), .Y(product[43]) );
  AND2X2 U947 ( .A(n111), .B(n1170), .Y(n1034) );
  XNOR2X1 U948 ( .A(n134), .B(n1035), .Y(product[41]) );
  AND2X2 U949 ( .A(n133), .B(n279), .Y(n1035) );
  INVX2 U950 ( .A(n393), .Y(n1036) );
  XNOR2X1 U951 ( .A(n170), .B(n1016), .Y(product[37]) );
  INVX8 U952 ( .A(n1270), .Y(n918) );
  INVX1 U953 ( .A(n210), .Y(n289) );
  XOR2X1 U954 ( .A(n476), .B(n478), .Y(n1038) );
  XOR2X1 U955 ( .A(n1038), .B(n485), .Y(n472) );
  XOR2X1 U956 ( .A(n474), .B(n483), .Y(n1039) );
  XOR2X1 U957 ( .A(n1039), .B(n472), .Y(n470) );
  NAND2X1 U958 ( .A(n476), .B(n478), .Y(n1040) );
  NAND2X1 U959 ( .A(n476), .B(n485), .Y(n1041) );
  NAND2X1 U960 ( .A(n478), .B(n485), .Y(n1042) );
  NAND3X1 U961 ( .A(n1040), .B(n1041), .C(n1042), .Y(n471) );
  NAND2X1 U962 ( .A(n474), .B(n483), .Y(n1043) );
  NAND2X1 U963 ( .A(n474), .B(n472), .Y(n1044) );
  NAND2X1 U964 ( .A(n483), .B(n472), .Y(n1045) );
  NAND3X1 U965 ( .A(n1043), .B(n1044), .C(n1045), .Y(n469) );
  OR2X2 U966 ( .A(n1046), .B(n1012), .Y(n24) );
  XNOR2X1 U967 ( .A(n19), .B(n1085), .Y(n1046) );
  INVX2 U968 ( .A(n1012), .Y(n1219) );
  XNOR2X1 U969 ( .A(n7), .B(a[17]), .Y(n1187) );
  NOR2X1 U970 ( .A(n401), .B(n388), .Y(n1047) );
  INVX1 U971 ( .A(n128), .Y(n126) );
  XOR2X1 U972 ( .A(n565), .B(n631), .Y(n1048) );
  XOR2X1 U973 ( .A(n1048), .B(n679), .Y(n452) );
  NAND2X1 U974 ( .A(n565), .B(n631), .Y(n1049) );
  NAND2X1 U975 ( .A(n565), .B(n679), .Y(n1050) );
  NAND2X1 U976 ( .A(n631), .B(n679), .Y(n1051) );
  NAND3X1 U977 ( .A(n1049), .B(n1050), .C(n1051), .Y(n451) );
  NAND2X1 U978 ( .A(n1015), .B(n453), .Y(n1052) );
  NAND2X1 U979 ( .A(n1015), .B(n451), .Y(n1053) );
  NAND2X1 U980 ( .A(n453), .B(n451), .Y(n1054) );
  NAND3X1 U981 ( .A(n1052), .B(n1053), .C(n1054), .Y(n435) );
  XOR2X1 U982 ( .A(n399), .B(n626), .Y(n1080) );
  AOI22X1 U983 ( .A(n1000), .B(n1107), .C(n1107), .D(n1056), .Y(n1055) );
  AND2X2 U984 ( .A(n917), .B(n900), .Y(n1056) );
  XOR2X1 U985 ( .A(n442), .B(n1190), .Y(n1057) );
  XOR2X1 U986 ( .A(n1057), .B(n440), .Y(n434) );
  NAND2X1 U987 ( .A(n442), .B(n1190), .Y(n1058) );
  NAND2X1 U988 ( .A(n442), .B(n440), .Y(n1059) );
  NAND2X1 U989 ( .A(n1190), .B(n440), .Y(n1060) );
  NAND3X1 U990 ( .A(n1058), .B(n1059), .C(n1060), .Y(n433) );
  XOR2X1 U991 ( .A(n435), .B(n422), .Y(n1061) );
  XOR2X1 U992 ( .A(n1061), .B(n433), .Y(n418) );
  NAND2X1 U993 ( .A(n435), .B(n422), .Y(n1062) );
  NAND2X1 U994 ( .A(n435), .B(n433), .Y(n1063) );
  NAND2X1 U995 ( .A(n422), .B(n433), .Y(n1064) );
  NAND3X1 U996 ( .A(n1062), .B(n1063), .C(n1064), .Y(n417) );
  INVX4 U997 ( .A(n37), .Y(n1065) );
  INVX2 U998 ( .A(n37), .Y(n1288) );
  INVX1 U999 ( .A(n1220), .Y(n1066) );
  XOR2X1 U1000 ( .A(n37), .B(a[29]), .Y(n1067) );
  BUFX2 U1001 ( .A(n25), .Y(n1068) );
  XNOR2X1 U1002 ( .A(n1242), .B(n1268), .Y(n753) );
  XOR2X1 U1003 ( .A(n464), .B(n468), .Y(n1072) );
  XOR2X1 U1004 ( .A(n473), .B(n1072), .Y(n460) );
  NAND2X1 U1005 ( .A(n473), .B(n464), .Y(n1073) );
  NAND2X1 U1006 ( .A(n473), .B(n468), .Y(n1074) );
  NAND2X1 U1007 ( .A(n464), .B(n468), .Y(n1075) );
  NAND3X1 U1008 ( .A(n1074), .B(n1073), .C(n1075), .Y(n459) );
  XOR2X1 U1009 ( .A(n489), .B(n487), .Y(n1076) );
  XOR2X1 U1010 ( .A(n480), .B(n1076), .Y(n474) );
  NAND2X1 U1011 ( .A(n480), .B(n489), .Y(n1077) );
  NAND2X1 U1012 ( .A(n480), .B(n487), .Y(n1078) );
  NAND2X1 U1013 ( .A(n489), .B(n487), .Y(n1079) );
  NAND3X1 U1014 ( .A(n1078), .B(n1077), .C(n1079), .Y(n473) );
  XOR2X1 U1015 ( .A(n397), .B(n1080), .Y(n380) );
  NAND2X1 U1016 ( .A(n397), .B(n399), .Y(n1081) );
  NAND2X1 U1017 ( .A(n397), .B(n626), .Y(n1082) );
  NAND2X1 U1018 ( .A(n399), .B(n626), .Y(n1083) );
  NAND3X1 U1019 ( .A(n1082), .B(n1081), .C(n1083), .Y(n379) );
  INVX1 U1020 ( .A(n1204), .Y(n1084) );
  BUFX2 U1021 ( .A(a[21]), .Y(n1085) );
  INVX1 U1022 ( .A(n1218), .Y(n555) );
  XOR2X1 U1023 ( .A(n437), .B(n1086), .Y(n422) );
  NAND2X1 U1024 ( .A(n437), .B(n428), .Y(n1087) );
  NAND2X1 U1025 ( .A(n437), .B(n1070), .Y(n1088) );
  NAND2X1 U1026 ( .A(n428), .B(n1070), .Y(n1089) );
  NAND3X1 U1027 ( .A(n1088), .B(n1087), .C(n1089), .Y(n421) );
  INVX2 U1028 ( .A(n1183), .Y(n1227) );
  INVX4 U1029 ( .A(n1285), .Y(n1284) );
  INVX4 U1030 ( .A(n31), .Y(n1285) );
  XNOR2X1 U1031 ( .A(n73), .B(n1091), .Y(product[46]) );
  AND2X2 U1032 ( .A(n72), .B(n1017), .Y(n1091) );
  INVX4 U1033 ( .A(n882), .Y(n1256) );
  BUFX2 U1034 ( .A(n1271), .Y(n1092) );
  OR2X2 U1035 ( .A(n1271), .B(n918), .Y(n757) );
  XOR2X1 U1036 ( .A(n1268), .B(a[29]), .Y(n1127) );
  XOR2X1 U1037 ( .A(n667), .B(n683), .Y(n1093) );
  XOR2X1 U1038 ( .A(n1093), .B(n635), .Y(n498) );
  NAND2X1 U1039 ( .A(n667), .B(n683), .Y(n1094) );
  NAND2X1 U1040 ( .A(n667), .B(n635), .Y(n1095) );
  NAND2X1 U1041 ( .A(n683), .B(n635), .Y(n1096) );
  NAND3X1 U1042 ( .A(n1094), .B(n1095), .C(n1096), .Y(n497) );
  XOR2X1 U1043 ( .A(n698), .B(n499), .Y(n1097) );
  XOR2X1 U1044 ( .A(n1097), .B(n497), .Y(n486) );
  NAND2X1 U1045 ( .A(n698), .B(n499), .Y(n1098) );
  NAND2X1 U1046 ( .A(n698), .B(n497), .Y(n1099) );
  NAND2X1 U1047 ( .A(n499), .B(n497), .Y(n1100) );
  NAND3X1 U1048 ( .A(n1098), .B(n1099), .C(n1100), .Y(n485) );
  OR2X1 U1049 ( .A(n1197), .B(n789), .Y(n1101) );
  OR2X1 U1050 ( .A(n1105), .B(n790), .Y(n1102) );
  NAND2X1 U1051 ( .A(n1101), .B(n1102), .Y(n635) );
  INVX4 U1052 ( .A(n13), .Y(n1278) );
  INVX4 U1053 ( .A(n1228), .Y(n1229) );
  NOR2X1 U1054 ( .A(n340), .B(n349), .Y(n1103) );
  INVX2 U1055 ( .A(n1183), .Y(n1138) );
  INVX8 U1056 ( .A(n1238), .Y(n1239) );
  INVX4 U1057 ( .A(n1185), .Y(n1105) );
  INVX1 U1058 ( .A(n1), .Y(n1106) );
  BUFX2 U1059 ( .A(n1010), .Y(n1108) );
  INVX4 U1060 ( .A(n1228), .Y(n1230) );
  OR2X2 U1061 ( .A(n339), .B(n330), .Y(n1109) );
  INVX1 U1062 ( .A(n1109), .Y(n148) );
  XOR2X1 U1063 ( .A(n579), .B(n691), .Y(n1110) );
  XOR2X1 U1064 ( .A(n1110), .B(n709), .Y(n400) );
  XOR2X1 U1065 ( .A(n396), .B(n398), .Y(n1111) );
  XOR2X1 U1066 ( .A(n1111), .B(n400), .Y(n392) );
  NAND2X1 U1067 ( .A(n579), .B(n691), .Y(n1112) );
  NAND2X1 U1068 ( .A(n579), .B(n709), .Y(n1113) );
  NAND2X1 U1069 ( .A(n691), .B(n709), .Y(n1114) );
  NAND3X1 U1070 ( .A(n1112), .B(n1113), .C(n1114), .Y(n399) );
  NAND2X1 U1071 ( .A(n396), .B(n398), .Y(n1115) );
  NAND2X1 U1072 ( .A(n396), .B(n400), .Y(n1116) );
  NAND2X1 U1073 ( .A(n398), .B(n400), .Y(n1117) );
  NAND3X1 U1074 ( .A(n1115), .B(n1116), .C(n1117), .Y(n391) );
  AND2X2 U1075 ( .A(n1271), .B(n543), .Y(n600) );
  INVX2 U1076 ( .A(n890), .Y(n1240) );
  AND2X2 U1077 ( .A(n1271), .B(n1270), .Y(n582) );
  XOR2X1 U1078 ( .A(n423), .B(n410), .Y(n1118) );
  XOR2X1 U1079 ( .A(n1118), .B(n412), .Y(n406) );
  NAND2X1 U1080 ( .A(n423), .B(n410), .Y(n1119) );
  NAND2X1 U1081 ( .A(n423), .B(n412), .Y(n1120) );
  NAND2X1 U1082 ( .A(n410), .B(n412), .Y(n1121) );
  NAND3X1 U1083 ( .A(n1119), .B(n1120), .C(n1121), .Y(n405) );
  XOR2X1 U1084 ( .A(n407), .B(n394), .Y(n1122) );
  XOR2X1 U1085 ( .A(n1122), .B(n405), .Y(n390) );
  NAND2X1 U1086 ( .A(n407), .B(n394), .Y(n1123) );
  NAND2X1 U1087 ( .A(n407), .B(n405), .Y(n1124) );
  NAND2X1 U1088 ( .A(n394), .B(n405), .Y(n1125) );
  NAND3X1 U1089 ( .A(n1123), .B(n1124), .C(n1125), .Y(n389) );
  OR2X2 U1090 ( .A(n1067), .B(n1127), .Y(n48) );
  INVX2 U1091 ( .A(n1067), .Y(n1232) );
  XNOR2X1 U1092 ( .A(n1131), .B(n1128), .Y(n362) );
  XNOR2X1 U1093 ( .A(n1129), .B(n375), .Y(n1131) );
  XOR2X1 U1094 ( .A(n368), .B(n379), .Y(n1130) );
  XOR2X1 U1095 ( .A(n1130), .B(n377), .Y(n364) );
  NAND2X1 U1096 ( .A(n368), .B(n379), .Y(n1132) );
  NAND2X1 U1097 ( .A(n368), .B(n377), .Y(n1133) );
  NAND2X1 U1098 ( .A(n379), .B(n377), .Y(n1134) );
  NAND3X1 U1099 ( .A(n1132), .B(n1133), .C(n1134), .Y(n363) );
  NAND2X1 U1100 ( .A(n366), .B(n375), .Y(n1135) );
  NAND2X1 U1101 ( .A(n366), .B(n364), .Y(n1136) );
  NAND2X1 U1102 ( .A(n375), .B(n364), .Y(n1137) );
  NAND3X1 U1103 ( .A(n1135), .B(n1136), .C(n1137), .Y(n361) );
  INVX8 U1104 ( .A(n1220), .Y(n1221) );
  INVX8 U1105 ( .A(n1280), .Y(n1279) );
  INVX8 U1106 ( .A(n1272), .Y(n1271) );
  XOR2X1 U1107 ( .A(n408), .B(n1140), .Y(n404) );
  NAND2X1 U1108 ( .A(n408), .B(n419), .Y(n1141) );
  NAND2X1 U1109 ( .A(n408), .B(n421), .Y(n1142) );
  NAND2X1 U1110 ( .A(n419), .B(n421), .Y(n1143) );
  NAND3X1 U1111 ( .A(n1142), .B(n1141), .C(n1143), .Y(n403) );
  XOR2X1 U1112 ( .A(n336), .B(n345), .Y(n1144) );
  XOR2X1 U1113 ( .A(n334), .B(n1144), .Y(n332) );
  NAND2X1 U1114 ( .A(n334), .B(n336), .Y(n1145) );
  NAND2X1 U1115 ( .A(n334), .B(n345), .Y(n1146) );
  NAND2X1 U1116 ( .A(n336), .B(n345), .Y(n1147) );
  NAND3X1 U1117 ( .A(n1146), .B(n1145), .C(n1147), .Y(n331) );
  XOR2X1 U1118 ( .A(n676), .B(n596), .Y(n1148) );
  XOR2X1 U1119 ( .A(n1148), .B(n628), .Y(n412) );
  NAND2X1 U1120 ( .A(n628), .B(n676), .Y(n1149) );
  NAND2X1 U1121 ( .A(n628), .B(n596), .Y(n1150) );
  NAND2X1 U1122 ( .A(n676), .B(n596), .Y(n1151) );
  NAND3X1 U1123 ( .A(n1150), .B(n1149), .C(n1151), .Y(n411) );
  INVX4 U1124 ( .A(n1268), .Y(n1269) );
  XOR2X1 U1125 ( .A(n615), .B(n711), .Y(n456) );
  XOR2X1 U1126 ( .A(n625), .B(n593), .Y(n1152) );
  XOR2X1 U1127 ( .A(n372), .B(n1152), .Y(n368) );
  NAND2X1 U1128 ( .A(n372), .B(n625), .Y(n1153) );
  NAND2X1 U1129 ( .A(n372), .B(n593), .Y(n1154) );
  NAND2X1 U1130 ( .A(n625), .B(n593), .Y(n1155) );
  NAND3X1 U1131 ( .A(n1154), .B(n1153), .C(n1155), .Y(n367) );
  INVX2 U1132 ( .A(n283), .Y(n1156) );
  XOR2X1 U1133 ( .A(n581), .B(n563), .Y(n1157) );
  XOR2X1 U1134 ( .A(n693), .B(n1157), .Y(n428) );
  NAND2X1 U1135 ( .A(n693), .B(n581), .Y(n1158) );
  NAND2X1 U1136 ( .A(n693), .B(n563), .Y(n1159) );
  NAND2X1 U1137 ( .A(n581), .B(n563), .Y(n1160) );
  NAND3X1 U1138 ( .A(n1159), .B(n1158), .C(n1160), .Y(n427) );
  INVX2 U1139 ( .A(n1278), .Y(n1276) );
  INVX2 U1140 ( .A(n1278), .Y(n1162) );
  INVX2 U1141 ( .A(n1278), .Y(n1163) );
  INVX2 U1142 ( .A(n287), .Y(n1161) );
  OR2X2 U1143 ( .A(n1189), .B(n80), .Y(n1166) );
  OR2X2 U1144 ( .A(n322), .B(n329), .Y(n1167) );
  OR2X2 U1145 ( .A(n481), .B(n470), .Y(n1168) );
  INVX1 U1146 ( .A(n94), .Y(n92) );
  OR2X2 U1147 ( .A(n302), .B(n307), .Y(n1170) );
  INVX4 U1148 ( .A(n1013), .Y(n1210) );
  BUFX4 U1149 ( .A(n1011), .Y(n1197) );
  INVX1 U1150 ( .A(n1259), .Y(n730) );
  OR2X2 U1151 ( .A(n918), .B(n1244), .Y(n1202) );
  INVX1 U1152 ( .A(n1255), .Y(n732) );
  INVX1 U1153 ( .A(n1263), .Y(n728) );
  AND2X1 U1154 ( .A(n572), .B(n725), .Y(n1181) );
  INVX2 U1155 ( .A(n1065), .Y(n1164) );
  INVX2 U1156 ( .A(n1288), .Y(n1165) );
  AND2X2 U1157 ( .A(n481), .B(n470), .Y(n1169) );
  OR2X1 U1158 ( .A(n523), .B(n518), .Y(n1171) );
  AND2X2 U1159 ( .A(n491), .B(n482), .Y(n1172) );
  OR2X1 U1160 ( .A(n491), .B(n482), .Y(n1173) );
  AND2X2 U1161 ( .A(n523), .B(n518), .Y(n1174) );
  INVX2 U1162 ( .A(n563), .Y(n709) );
  INVX2 U1163 ( .A(n1202), .Y(n385) );
  BUFX2 U1164 ( .A(n1273), .Y(n1194) );
  BUFX2 U1165 ( .A(n1273), .Y(n1193) );
  OR2X1 U1166 ( .A(n533), .B(n530), .Y(n1175) );
  OR2X1 U1167 ( .A(n539), .B(n538), .Y(n1176) );
  OR2X1 U1168 ( .A(n708), .B(n724), .Y(n1177) );
  AND2X2 U1169 ( .A(n533), .B(n530), .Y(n1178) );
  AND2X2 U1170 ( .A(n708), .B(n724), .Y(n1179) );
  AND2X2 U1171 ( .A(n539), .B(n538), .Y(n1180) );
  XNOR2X1 U1172 ( .A(n542), .B(n573), .Y(n291) );
  INVX2 U1173 ( .A(n551), .Y(n637) );
  INVX2 U1174 ( .A(n545), .Y(n601) );
  INVX2 U1175 ( .A(n1186), .Y(n1214) );
  INVX2 U1176 ( .A(n554), .Y(n655) );
  INVX2 U1177 ( .A(n548), .Y(n619) );
  INVX4 U1178 ( .A(n1224), .Y(n1225) );
  INVX2 U1179 ( .A(n1186), .Y(n1213) );
  INVX2 U1180 ( .A(n1288), .Y(n1287) );
  INVX2 U1181 ( .A(n1278), .Y(n1277) );
  XOR2X1 U1182 ( .A(n1), .B(a[17]), .Y(n1182) );
  XNOR2X1 U1183 ( .A(n1285), .B(a[27]), .Y(n1183) );
  AND2X2 U1184 ( .A(n895), .B(n1011), .Y(n1185) );
  NOR2X1 U1185 ( .A(n1187), .B(n1182), .Y(n1186) );
  INVX4 U1186 ( .A(n1285), .Y(n1283) );
  INVX2 U1187 ( .A(n1012), .Y(n1218) );
  INVX1 U1188 ( .A(n213), .Y(n212) );
  INVX2 U1189 ( .A(n1067), .Y(n1231) );
  INVX2 U1190 ( .A(n1), .Y(n1274) );
  INVX2 U1191 ( .A(n1182), .Y(n1211) );
  INVX1 U1192 ( .A(n216), .Y(n290) );
  INVX1 U1193 ( .A(n205), .Y(n288) );
  INVX1 U1194 ( .A(n1047), .Y(n286) );
  INVX1 U1195 ( .A(n194), .Y(n287) );
  INVX2 U1196 ( .A(n1182), .Y(n1212) );
  INVX2 U1197 ( .A(n381), .Y(n1200) );
  INVX4 U1198 ( .A(n1200), .Y(n1201) );
  INVX2 U1199 ( .A(n28), .Y(n1222) );
  INVX1 U1200 ( .A(n200), .Y(n202) );
  INVX2 U1201 ( .A(n560), .Y(n691) );
  AND2X2 U1202 ( .A(n898), .B(n1022), .Y(n1203) );
  AND2X2 U1203 ( .A(n898), .B(n1022), .Y(n1204) );
  XOR2X1 U1204 ( .A(n352), .B(n354), .Y(n1205) );
  XOR2X1 U1205 ( .A(n363), .B(n1205), .Y(n350) );
  NAND2X1 U1206 ( .A(n363), .B(n352), .Y(n1206) );
  NAND2X1 U1207 ( .A(n363), .B(n354), .Y(n1207) );
  NAND2X1 U1208 ( .A(n352), .B(n354), .Y(n1208) );
  NAND3X1 U1209 ( .A(n1207), .B(n1206), .C(n1208), .Y(n349) );
  INVX4 U1210 ( .A(n1203), .Y(n1216) );
  INVX2 U1211 ( .A(n557), .Y(n673) );
  INVX1 U1212 ( .A(n199), .Y(n201) );
  INVX1 U1213 ( .A(n1032), .Y(n284) );
  INVX1 U1214 ( .A(n172), .Y(n174) );
  INVX1 U1215 ( .A(n161), .Y(n282) );
  INVX1 U1216 ( .A(n166), .Y(n283) );
  INVX1 U1217 ( .A(n171), .Y(n173) );
  INVX4 U1218 ( .A(n48), .Y(n1233) );
  INVX4 U1219 ( .A(n24), .Y(n1220) );
  INVX4 U1220 ( .A(n51), .Y(n1236) );
  INVX1 U1221 ( .A(n1195), .Y(n155) );
  INVX8 U1222 ( .A(a[15]), .Y(n917) );
  INVX8 U1223 ( .A(n1236), .Y(n1237) );
  INVX8 U1224 ( .A(n1254), .Y(n1255) );
  INVX8 U1225 ( .A(n1256), .Y(n1257) );
  INVX8 U1226 ( .A(n1258), .Y(n1259) );
  INVX8 U1227 ( .A(n1260), .Y(n1261) );
  INVX8 U1228 ( .A(n1262), .Y(n1263) );
  INVX8 U1229 ( .A(n541), .Y(n1268) );
  INVX8 U1230 ( .A(n1268), .Y(n1270) );
  INVX8 U1231 ( .A(n19), .Y(n1280) );
  INVX2 U1232 ( .A(n101), .Y(n99) );
  INVX2 U1233 ( .A(n79), .Y(n77) );
  INVX2 U1234 ( .A(n1261), .Y(n729) );
  OAI22X1 U1235 ( .A(n1212), .B(n1275), .C(n1213), .D(n1275), .Y(n560) );
  OAI22X1 U1236 ( .A(n1215), .B(n1278), .C(n1216), .D(n1278), .Y(n557) );
  OAI22X1 U1237 ( .A(n1218), .B(n1280), .C(n1221), .D(n1280), .Y(n554) );
  OAI22X1 U1238 ( .A(n1223), .B(n1282), .C(n1225), .D(n1282), .Y(n551) );
  INVX2 U1239 ( .A(n1196), .Y(n549) );
  OAI22X1 U1240 ( .A(n1197), .B(n1090), .C(n1105), .D(n1090), .Y(n548) );
  OAI22X1 U1241 ( .A(n1226), .B(n1065), .C(n1230), .D(n1065), .Y(n545) );
  INVX2 U1242 ( .A(n1231), .Y(n543) );
  OAI22X1 U1243 ( .A(n1231), .B(n918), .C(n1234), .D(n918), .Y(n542) );
  INVX2 U1244 ( .A(n359), .Y(n360) );
  INVX2 U1245 ( .A(n337), .Y(n338) );
  INVX2 U1246 ( .A(n319), .Y(n320) );
  INVX2 U1247 ( .A(n305), .Y(n306) );
  INVX2 U1248 ( .A(n295), .Y(n296) );
  INVX2 U1249 ( .A(n130), .Y(n279) );
  INVX2 U1250 ( .A(n93), .Y(n91) );
  INVX2 U1251 ( .A(n84), .Y(n275) );
  INVX2 U1252 ( .A(n222), .Y(n221) );
  INVX2 U1253 ( .A(n211), .Y(n209) );
  INVX2 U1254 ( .A(n183), .Y(n181) );
  INVX2 U1255 ( .A(n182), .Y(n285) );
  INVX2 U1256 ( .A(n149), .Y(n151) );
  INVX2 U1257 ( .A(n144), .Y(n142) );
  INVX2 U1258 ( .A(n129), .Y(n127) );
  INVX2 U1259 ( .A(n122), .Y(n120) );
  INVX2 U1260 ( .A(n111), .Y(n109) );
  INVX2 U1261 ( .A(n105), .Y(n103) );
  INVX2 U1262 ( .A(n104), .Y(n102) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_sub_1 sub_44 ( .A({src1_data[16], src1_data[16], n36, src1_data[14], 
        n41, n8, n31, n29, n39, n26, src1_data[7], n25, n37, n23, n35, n24, n9, 
        src1_data[0]}), .B({src2_data[16], src2_data[16], n22, n20, 
        src2_data[13:9], n16, n18, n13, n11, n14, src2_data[3:1], n5}), .CI(
        1'b0), .DIFF(large_dif) );
  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16], n36, src1_data[14], 
        n41, n8, n31, n29, n39, n26, src1_data[7], n25, n37, n23, n35, n24, n9, 
        src1_data[0]}), .B({src2_data[16], src2_data[16], n22, n20, 
        src2_data[13:9], n16, n18, n13, n11, n14, n7, src2_data[2:1], n5}), 
        .CI(1'b0), .SUM(large_sum) );
  alu_DW_mult_uns_2 mult_35 ( .a({src1_data[15:10], n39, src1_data[8:0], 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .b({src2_data[15:1], n5}), .product({N26, 
        full_mult[45:30], SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  BUFX2 U3 ( .A(src1_data[1]), .Y(n9) );
  INVX2 U4 ( .A(n38), .Y(n37) );
  BUFX2 U6 ( .A(src1_data[15]), .Y(n36) );
  NAND2X1 U7 ( .A(n1), .B(n2), .Y(n3) );
  NAND2X1 U9 ( .A(n3), .B(n44), .Y(overflow) );
  INVX1 U10 ( .A(n45), .Y(n1) );
  INVX2 U11 ( .A(n83), .Y(n2) );
  INVX2 U12 ( .A(src2_data[0]), .Y(n4) );
  INVX4 U13 ( .A(n4), .Y(n5) );
  INVX1 U14 ( .A(src2_data[3]), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n7) );
  BUFX2 U16 ( .A(src1_data[12]), .Y(n8) );
  INVX1 U17 ( .A(src2_data[5]), .Y(n10) );
  INVX2 U18 ( .A(n10), .Y(n11) );
  INVX1 U19 ( .A(src2_data[6]), .Y(n12) );
  INVX2 U20 ( .A(n12), .Y(n13) );
  BUFX2 U21 ( .A(src2_data[4]), .Y(n14) );
  INVX1 U22 ( .A(src2_data[8]), .Y(n15) );
  INVX2 U23 ( .A(n15), .Y(n16) );
  INVX1 U24 ( .A(src2_data[7]), .Y(n17) );
  INVX2 U25 ( .A(n17), .Y(n18) );
  INVX1 U26 ( .A(src2_data[14]), .Y(n19) );
  INVX2 U27 ( .A(n19), .Y(n20) );
  INVX1 U28 ( .A(src1_data[13]), .Y(n42) );
  INVX2 U29 ( .A(n42), .Y(n41) );
  INVX1 U30 ( .A(src2_data[15]), .Y(n21) );
  INVX2 U31 ( .A(n21), .Y(n22) );
  BUFX2 U32 ( .A(src1_data[4]), .Y(n23) );
  INVX1 U33 ( .A(src1_data[5]), .Y(n38) );
  BUFX2 U34 ( .A(src1_data[2]), .Y(n24) );
  BUFX2 U35 ( .A(src1_data[6]), .Y(n25) );
  BUFX2 U36 ( .A(src1_data[8]), .Y(n26) );
  BUFX2 U37 ( .A(src1_data[10]), .Y(n29) );
  INVX1 U38 ( .A(src1_data[11]), .Y(n30) );
  INVX2 U39 ( .A(n30), .Y(n31) );
  INVX2 U40 ( .A(n83), .Y(n78) );
  AND2X2 U41 ( .A(n47), .B(n46), .Y(n32) );
  AND2X2 U42 ( .A(alu_op[1]), .B(n46), .Y(n33) );
  AND2X2 U43 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n34) );
  BUFX2 U44 ( .A(src1_data[3]), .Y(n35) );
  INVX4 U45 ( .A(src1_data[9]), .Y(n40) );
  INVX8 U46 ( .A(n40), .Y(n39) );
  INVX2 U47 ( .A(large_sum[16]), .Y(n82) );
  XOR2X1 U48 ( .A(n82), .B(large_sum[17]), .Y(n45) );
  INVX2 U49 ( .A(alu_op[1]), .Y(n47) );
  NAND2X1 U50 ( .A(alu_op[0]), .B(n47), .Y(n83) );
  INVX2 U51 ( .A(alu_op[0]), .Y(n46) );
  XOR2X1 U52 ( .A(large_dif[17]), .B(large_dif[16]), .Y(n43) );
  AOI22X1 U53 ( .A(N26), .B(n34), .C(n33), .D(n43), .Y(n44) );
  AOI22X1 U54 ( .A(src1_data[0]), .B(n32), .C(full_mult[30]), .D(n34), .Y(n49)
         );
  AOI22X1 U55 ( .A(large_dif[0]), .B(n33), .C(large_sum[0]), .D(n78), .Y(n48)
         );
  NAND2X1 U56 ( .A(n49), .B(n48), .Y(result[0]) );
  AOI22X1 U57 ( .A(n9), .B(n32), .C(full_mult[31]), .D(n34), .Y(n51) );
  AOI22X1 U58 ( .A(large_dif[1]), .B(n33), .C(large_sum[1]), .D(n78), .Y(n50)
         );
  NAND2X1 U59 ( .A(n51), .B(n50), .Y(result[1]) );
  AOI22X1 U60 ( .A(n24), .B(n32), .C(full_mult[32]), .D(n34), .Y(n53) );
  AOI22X1 U61 ( .A(large_dif[2]), .B(n33), .C(large_sum[2]), .D(n78), .Y(n52)
         );
  NAND2X1 U62 ( .A(n53), .B(n52), .Y(result[2]) );
  AOI22X1 U63 ( .A(n35), .B(n32), .C(full_mult[33]), .D(n34), .Y(n55) );
  AOI22X1 U64 ( .A(large_dif[3]), .B(n33), .C(large_sum[3]), .D(n78), .Y(n54)
         );
  NAND2X1 U65 ( .A(n55), .B(n54), .Y(result[3]) );
  AOI22X1 U66 ( .A(n23), .B(n32), .C(full_mult[34]), .D(n34), .Y(n57) );
  AOI22X1 U67 ( .A(large_dif[4]), .B(n33), .C(large_sum[4]), .D(n78), .Y(n56)
         );
  NAND2X1 U68 ( .A(n57), .B(n56), .Y(result[4]) );
  AOI22X1 U69 ( .A(n37), .B(n32), .C(full_mult[35]), .D(n34), .Y(n59) );
  AOI22X1 U70 ( .A(large_dif[5]), .B(n33), .C(large_sum[5]), .D(n78), .Y(n58)
         );
  NAND2X1 U71 ( .A(n59), .B(n58), .Y(result[5]) );
  AOI22X1 U72 ( .A(n25), .B(n32), .C(full_mult[36]), .D(n34), .Y(n61) );
  AOI22X1 U73 ( .A(large_dif[6]), .B(n33), .C(large_sum[6]), .D(n78), .Y(n60)
         );
  NAND2X1 U74 ( .A(n60), .B(n61), .Y(result[6]) );
  AOI22X1 U75 ( .A(src1_data[7]), .B(n32), .C(full_mult[37]), .D(n34), .Y(n63)
         );
  AOI22X1 U76 ( .A(large_dif[7]), .B(n33), .C(large_sum[7]), .D(n78), .Y(n62)
         );
  NAND2X1 U77 ( .A(n63), .B(n62), .Y(result[7]) );
  AOI22X1 U78 ( .A(n26), .B(n32), .C(full_mult[38]), .D(n34), .Y(n65) );
  AOI22X1 U79 ( .A(large_dif[8]), .B(n33), .C(large_sum[8]), .D(n78), .Y(n64)
         );
  NAND2X1 U80 ( .A(n65), .B(n64), .Y(result[8]) );
  AOI22X1 U81 ( .A(n39), .B(n32), .C(full_mult[39]), .D(n34), .Y(n67) );
  AOI22X1 U82 ( .A(large_dif[9]), .B(n33), .C(large_sum[9]), .D(n78), .Y(n66)
         );
  NAND2X1 U83 ( .A(n66), .B(n67), .Y(result[9]) );
  AOI22X1 U84 ( .A(n29), .B(n32), .C(full_mult[40]), .D(n34), .Y(n69) );
  AOI22X1 U85 ( .A(large_dif[10]), .B(n33), .C(large_sum[10]), .D(n78), .Y(n68) );
  NAND2X1 U86 ( .A(n69), .B(n68), .Y(result[10]) );
  AOI22X1 U87 ( .A(n31), .B(n32), .C(full_mult[41]), .D(n34), .Y(n71) );
  AOI22X1 U88 ( .A(large_dif[11]), .B(n33), .C(large_sum[11]), .D(n78), .Y(n70) );
  NAND2X1 U89 ( .A(n71), .B(n70), .Y(result[11]) );
  AOI22X1 U90 ( .A(n8), .B(n32), .C(full_mult[42]), .D(n34), .Y(n73) );
  AOI22X1 U91 ( .A(large_dif[12]), .B(n33), .C(large_sum[12]), .D(n78), .Y(n72) );
  NAND2X1 U92 ( .A(n73), .B(n72), .Y(result[12]) );
  AOI22X1 U93 ( .A(n41), .B(n32), .C(full_mult[43]), .D(n34), .Y(n75) );
  AOI22X1 U94 ( .A(large_dif[13]), .B(n33), .C(large_sum[13]), .D(n78), .Y(n74) );
  NAND2X1 U95 ( .A(n75), .B(n74), .Y(result[13]) );
  AOI22X1 U96 ( .A(src1_data[14]), .B(n32), .C(full_mult[44]), .D(n34), .Y(n77) );
  AOI22X1 U97 ( .A(large_dif[14]), .B(n33), .C(large_sum[14]), .D(n78), .Y(n76) );
  NAND2X1 U98 ( .A(n76), .B(n77), .Y(result[14]) );
  AOI22X1 U99 ( .A(n36), .B(n32), .C(full_mult[45]), .D(n34), .Y(n80) );
  AOI22X1 U100 ( .A(large_dif[15]), .B(n33), .C(large_sum[15]), .D(n78), .Y(
        n79) );
  NAND2X1 U101 ( .A(n80), .B(n79), .Y(result[15]) );
  AOI22X1 U102 ( .A(src1_data[16]), .B(n32), .C(large_dif[16]), .D(n33), .Y(
        n81) );
  OAI21X1 U103 ( .A(n83), .B(n82), .C(n81), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n13), .Y(n42) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n16), .Y(n36) );
  INVX1 U6 ( .A(n20), .Y(n30) );
  INVX1 U7 ( .A(n11), .Y(n46) );
  INVX1 U8 ( .A(n14), .Y(n40) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX1 U10 ( .A(n22), .Y(n28) );
  INVX1 U11 ( .A(n18), .Y(n32) );
  INVX2 U12 ( .A(n1), .Y(n2) );
  INVX2 U13 ( .A(write_enable), .Y(n1) );
  INVX2 U14 ( .A(n4), .Y(n3) );
  INVX2 U15 ( .A(n_reset), .Y(n4) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n22), .Y(n28) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n18), .Y(n32) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n17), .Y(n34) );
  INVX1 U7 ( .A(n16), .Y(n36) );
  INVX1 U8 ( .A(n11), .Y(n46) );
  INVX1 U9 ( .A(n14), .Y(n40) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX2 U11 ( .A(n1), .Y(n2) );
  INVX2 U12 ( .A(write_enable), .Y(n1) );
  INVX2 U13 ( .A(n4), .Y(n3) );
  INVX2 U14 ( .A(n_reset), .Y(n4) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n17), .Y(n34) );
  INVX1 U7 ( .A(n11), .Y(n46) );
  INVX1 U8 ( .A(n14), .Y(n40) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n11), .Y(n46) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n12), .Y(n44) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  INVX2 U10 ( .A(write_enable), .Y(n1) );
  INVX2 U11 ( .A(n4), .Y(n3) );
  INVX2 U12 ( .A(n_reset), .Y(n4) );
  MUX2X1 U13 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U14 ( .A(n5), .Y(n55) );
  MUX2X1 U15 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U16 ( .A(n6), .Y(n54) );
  MUX2X1 U17 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U18 ( .A(n7), .Y(n53) );
  MUX2X1 U19 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U20 ( .A(n8), .Y(n52) );
  MUX2X1 U21 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U22 ( .A(n9), .Y(n50) );
  MUX2X1 U23 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U24 ( .A(n10), .Y(n48) );
  MUX2X1 U25 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n11), .Y(n46) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n12), .Y(n44) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  INVX2 U10 ( .A(write_enable), .Y(n1) );
  INVX2 U11 ( .A(n4), .Y(n3) );
  INVX2 U12 ( .A(n_reset), .Y(n4) );
  MUX2X1 U13 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U14 ( .A(n5), .Y(n55) );
  MUX2X1 U15 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U16 ( .A(n6), .Y(n54) );
  MUX2X1 U17 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U18 ( .A(n7), .Y(n53) );
  MUX2X1 U19 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U20 ( .A(n8), .Y(n52) );
  MUX2X1 U21 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U22 ( .A(n9), .Y(n50) );
  MUX2X1 U23 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U24 ( .A(n10), .Y(n48) );
  MUX2X1 U25 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n11), .Y(n46) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n12), .Y(n44) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  INVX2 U10 ( .A(write_enable), .Y(n1) );
  INVX2 U11 ( .A(n4), .Y(n3) );
  INVX2 U12 ( .A(n_reset), .Y(n4) );
  MUX2X1 U13 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U14 ( .A(n5), .Y(n55) );
  MUX2X1 U15 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U16 ( .A(n6), .Y(n54) );
  MUX2X1 U17 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U18 ( .A(n7), .Y(n53) );
  MUX2X1 U19 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U20 ( .A(n8), .Y(n52) );
  MUX2X1 U21 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U22 ( .A(n9), .Y(n50) );
  MUX2X1 U23 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U24 ( .A(n10), .Y(n48) );
  MUX2X1 U25 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n17), .Y(n34) );
  INVX1 U7 ( .A(n11), .Y(n46) );
  INVX1 U8 ( .A(n14), .Y(n40) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n17), .Y(n34) );
  INVX1 U7 ( .A(n11), .Y(n46) );
  INVX1 U8 ( .A(n14), .Y(n40) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n11), .Y(n46) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n12), .Y(n44) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  INVX2 U10 ( .A(write_enable), .Y(n1) );
  INVX2 U11 ( .A(n4), .Y(n3) );
  INVX2 U12 ( .A(n_reset), .Y(n4) );
  MUX2X1 U13 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U14 ( .A(n5), .Y(n55) );
  MUX2X1 U15 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U16 ( .A(n6), .Y(n54) );
  MUX2X1 U17 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U18 ( .A(n7), .Y(n53) );
  MUX2X1 U19 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U20 ( .A(n8), .Y(n52) );
  MUX2X1 U21 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U22 ( .A(n9), .Y(n50) );
  MUX2X1 U23 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U24 ( .A(n10), .Y(n48) );
  MUX2X1 U25 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n22), .Y(n28) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n17), .Y(n34) );
  INVX1 U7 ( .A(n16), .Y(n36) );
  INVX1 U8 ( .A(n11), .Y(n46) );
  INVX1 U9 ( .A(n14), .Y(n40) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX2 U11 ( .A(n1), .Y(n2) );
  INVX2 U12 ( .A(write_enable), .Y(n1) );
  INVX2 U13 ( .A(n4), .Y(n3) );
  INVX2 U14 ( .A(n_reset), .Y(n4) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n17), .Y(n34) );
  INVX1 U7 ( .A(n11), .Y(n46) );
  INVX1 U8 ( .A(n14), .Y(n40) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n11), .Y(n46) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n12), .Y(n44) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  INVX2 U10 ( .A(write_enable), .Y(n1) );
  INVX2 U11 ( .A(n4), .Y(n3) );
  INVX2 U12 ( .A(n_reset), .Y(n4) );
  MUX2X1 U13 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U14 ( .A(n5), .Y(n55) );
  MUX2X1 U15 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U16 ( .A(n6), .Y(n54) );
  MUX2X1 U17 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U18 ( .A(n7), .Y(n53) );
  MUX2X1 U19 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U20 ( .A(n8), .Y(n52) );
  MUX2X1 U21 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U22 ( .A(n9), .Y(n50) );
  MUX2X1 U23 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U24 ( .A(n10), .Y(n48) );
  MUX2X1 U25 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n11), .Y(n46) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n12), .Y(n44) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  INVX2 U10 ( .A(write_enable), .Y(n1) );
  INVX2 U11 ( .A(n4), .Y(n3) );
  INVX2 U12 ( .A(n_reset), .Y(n4) );
  MUX2X1 U13 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U14 ( .A(n5), .Y(n55) );
  MUX2X1 U15 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U16 ( .A(n6), .Y(n54) );
  MUX2X1 U17 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U18 ( .A(n7), .Y(n53) );
  MUX2X1 U19 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U20 ( .A(n8), .Y(n52) );
  MUX2X1 U21 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U22 ( .A(n9), .Y(n50) );
  MUX2X1 U23 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U24 ( .A(n10), .Y(n48) );
  MUX2X1 U25 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n11), .Y(n46) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n12), .Y(n44) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  INVX2 U10 ( .A(write_enable), .Y(n1) );
  INVX2 U11 ( .A(n4), .Y(n3) );
  INVX2 U12 ( .A(n_reset), .Y(n4) );
  MUX2X1 U13 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U14 ( .A(n5), .Y(n55) );
  MUX2X1 U15 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U16 ( .A(n6), .Y(n54) );
  MUX2X1 U17 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U18 ( .A(n7), .Y(n53) );
  MUX2X1 U19 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U20 ( .A(n8), .Y(n52) );
  MUX2X1 U21 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U22 ( .A(n9), .Y(n50) );
  MUX2X1 U23 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U24 ( .A(n10), .Y(n48) );
  MUX2X1 U25 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n11), .Y(n46) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n12), .Y(n44) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  INVX2 U10 ( .A(write_enable), .Y(n1) );
  INVX2 U11 ( .A(n4), .Y(n3) );
  INVX2 U12 ( .A(n_reset), .Y(n4) );
  MUX2X1 U13 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U14 ( .A(n5), .Y(n55) );
  MUX2X1 U15 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U16 ( .A(n6), .Y(n54) );
  MUX2X1 U17 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U18 ( .A(n7), .Y(n53) );
  MUX2X1 U19 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U20 ( .A(n8), .Y(n52) );
  MUX2X1 U21 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U22 ( .A(n9), .Y(n50) );
  MUX2X1 U23 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U24 ( .A(n10), .Y(n48) );
  MUX2X1 U25 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n11), .Y(n46) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n12), .Y(n44) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  INVX2 U10 ( .A(write_enable), .Y(n1) );
  INVX2 U11 ( .A(n4), .Y(n3) );
  INVX2 U12 ( .A(n_reset), .Y(n4) );
  MUX2X1 U13 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U14 ( .A(n5), .Y(n55) );
  MUX2X1 U15 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U16 ( .A(n6), .Y(n54) );
  MUX2X1 U17 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U18 ( .A(n7), .Y(n53) );
  MUX2X1 U19 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U20 ( .A(n8), .Y(n52) );
  MUX2X1 U21 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U22 ( .A(n9), .Y(n50) );
  MUX2X1 U23 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U24 ( .A(n10), .Y(n48) );
  MUX2X1 U25 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n1, n2, n3, n4, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632,
         n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709,
         n710, n711, n712, n713, n714, n715, n716, n717, n718, n719, n720,
         n721, n722, n723, n724, n725, n726, n727, n728, n729;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  NOR2X1 U6 ( .A(n5), .B(n6), .Y(write_enables[9]) );
  NOR2X1 U7 ( .A(n6), .B(n7), .Y(write_enables[8]) );
  NOR2X1 U8 ( .A(n8), .B(n9), .Y(write_enables[7]) );
  NOR2X1 U9 ( .A(n8), .B(n10), .Y(write_enables[6]) );
  NOR2X1 U10 ( .A(n9), .B(n11), .Y(write_enables[5]) );
  NOR2X1 U11 ( .A(n10), .B(n11), .Y(write_enables[4]) );
  NOR2X1 U12 ( .A(n9), .B(n12), .Y(write_enables[3]) );
  NOR2X1 U13 ( .A(n10), .B(n12), .Y(write_enables[2]) );
  NOR2X1 U14 ( .A(n6), .B(n9), .Y(write_enables[1]) );
  NAND3X1 U15 ( .A(w_en), .B(n727), .C(w_sel[0]), .Y(n9) );
  NOR2X1 U16 ( .A(n5), .B(n8), .Y(write_enables[15]) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(write_enables[14]) );
  NAND2X1 U18 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n8) );
  NOR2X1 U19 ( .A(n5), .B(n11), .Y(write_enables[13]) );
  NOR2X1 U20 ( .A(n7), .B(n11), .Y(write_enables[12]) );
  NAND2X1 U21 ( .A(w_sel[2]), .B(n728), .Y(n11) );
  NOR2X1 U22 ( .A(n5), .B(n12), .Y(write_enables[11]) );
  NAND3X1 U23 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n5) );
  NOR2X1 U24 ( .A(n7), .B(n12), .Y(write_enables[10]) );
  NAND2X1 U25 ( .A(w_sel[1]), .B(n729), .Y(n12) );
  NAND2X1 U26 ( .A(n13), .B(w_sel[3]), .Y(n7) );
  NOR2X1 U27 ( .A(n6), .B(n10), .Y(write_enables[0]) );
  NAND2X1 U28 ( .A(n13), .B(n727), .Y(n10) );
  NOR2X1 U29 ( .A(n726), .B(w_sel[0]), .Y(n13) );
  NAND2X1 U30 ( .A(n728), .B(n729), .Y(n6) );
  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n725), 
        .write_enable(write_enables[0]), .new_value({w_data[16], n717, n714, 
        n711, n708, n705, n703, n700, n697, n694, n691, n688, n685, n682, n679, 
        n676, n673}), .current_value(outreg_data) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n718), 
        .write_enable(write_enables[1]), .new_value({w_data[16], n716, n47, 
        n710, n33, n705, n35, n41, n39, n45, n37, n687, n684, n681, n678, n675, 
        n673}), .current_value({\regs_matrix[1][16] , \regs_matrix[1][15] , 
        \regs_matrix[1][14] , \regs_matrix[1][13] , \regs_matrix[1][12] , 
        \regs_matrix[1][11] , \regs_matrix[1][10] , \regs_matrix[1][9] , 
        \regs_matrix[1][8] , \regs_matrix[1][7] , \regs_matrix[1][6] , 
        \regs_matrix[1][5] , \regs_matrix[1][4] , \regs_matrix[1][3] , 
        \regs_matrix[1][2] , \regs_matrix[1][1] , \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n718), 
        .write_enable(write_enables[2]), .new_value({w_data[16], n717, n714, 
        n711, n708, n705, n703, n700, n697, n694, n691, n688, n685, n682, n679, 
        n676, w_data[0]}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n719), 
        .write_enable(write_enables[3]), .new_value({w_data[16], n716, n713, 
        n710, n707, n705, n702, n699, n696, n693, n690, n687, n684, n681, n678, 
        n675, n673}), .current_value({\regs_matrix[3][16] , 
        \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] , 
        \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] , 
        \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] , 
        \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] , 
        \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] , 
        \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n719), 
        .write_enable(write_enables[4]), .new_value({w_data[16], n717, n714, 
        n711, n708, n705, n703, n700, n697, n694, n691, n688, n685, n682, n679, 
        n676, w_data[0]}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n720), 
        .write_enable(write_enables[5]), .new_value({w_data[16], n716, n48, 
        n710, n34, n705, n36, n42, n40, n46, n38, n687, n684, n681, n678, n675, 
        n673}), .current_value({\regs_matrix[5][16] , \regs_matrix[5][15] , 
        \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] , 
        \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] , 
        \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] , 
        \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] , 
        \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n720), 
        .write_enable(write_enables[6]), .new_value({w_data[16], n717, n714, 
        n711, n708, n705, n703, n700, n697, n694, n691, n688, n685, n682, n679, 
        n676, w_data[0]}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n721), 
        .write_enable(write_enables[7]), .new_value({w_data[16], n716, n47, 
        n710, n33, n705, n35, n41, n39, n45, n37, n687, n684, n681, n678, n675, 
        n673}), .current_value({\regs_matrix[7][16] , \regs_matrix[7][15] , 
        \regs_matrix[7][14] , \regs_matrix[7][13] , \regs_matrix[7][12] , 
        \regs_matrix[7][11] , \regs_matrix[7][10] , \regs_matrix[7][9] , 
        \regs_matrix[7][8] , \regs_matrix[7][7] , \regs_matrix[7][6] , 
        \regs_matrix[7][5] , \regs_matrix[7][4] , \regs_matrix[7][3] , 
        \regs_matrix[7][2] , \regs_matrix[7][1] , \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n721), 
        .write_enable(write_enables[8]), .new_value({w_data[16], n717, n48, 
        n711, n34, n705, n36, n42, n40, n46, n38, n688, n685, n682, n679, n676, 
        w_data[0]}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n722), 
        .write_enable(write_enables[9]), .new_value({w_data[16], n716, n713, 
        n710, n707, n705, n702, n699, n696, n693, n690, n687, n684, n681, n678, 
        n675, n673}), .current_value({\regs_matrix[9][16] , 
        \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] , 
        \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] , 
        \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] , 
        \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] , 
        \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] , 
        \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n722), 
        .write_enable(write_enables[10]), .new_value({w_data[16], n717, n47, 
        n711, n33, n705, n35, n41, n39, n45, n37, n688, n685, n682, n679, n676, 
        w_data[0]}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n723), 
        .write_enable(write_enables[11]), .new_value({w_data[16], n716, n48, 
        n710, n34, n705, n36, n42, n40, n46, n38, n687, n684, n681, n678, n675, 
        n673}), .current_value({\regs_matrix[11][16] , \regs_matrix[11][15] , 
        \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] , 
        \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] , 
        \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] , 
        \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] , 
        \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n723), 
        .write_enable(write_enables[12]), .new_value({w_data[16], n717, n713, 
        n711, n707, n705, n702, n699, n696, n693, n690, n688, n685, n682, n679, 
        n676, w_data[0]}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n724), 
        .write_enable(write_enables[13]), .new_value({w_data[16], n716, n47, 
        n710, n33, n705, n35, n41, n39, n45, n37, n687, n684, n681, n678, n675, 
        n673}), .current_value({\regs_matrix[13][16] , \regs_matrix[13][15] , 
        \regs_matrix[13][14] , \regs_matrix[13][13] , \regs_matrix[13][12] , 
        \regs_matrix[13][11] , \regs_matrix[13][10] , \regs_matrix[13][9] , 
        \regs_matrix[13][8] , \regs_matrix[13][7] , \regs_matrix[13][6] , 
        \regs_matrix[13][5] , \regs_matrix[13][4] , \regs_matrix[13][3] , 
        \regs_matrix[13][2] , \regs_matrix[13][1] , \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n724), 
        .write_enable(write_enables[14]), .new_value({w_data[16], n717, n48, 
        n711, n34, n705, n36, n42, n40, n46, n38, n688, n685, n682, n679, n676, 
        w_data[0]}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n725), 
        .write_enable(write_enables[15]), .new_value({w_data[16], n716, n713, 
        n710, n707, n705, n702, n699, n696, n693, n690, n687, n684, n681, n678, 
        n675, n673}), .current_value({\regs_matrix[15][16] , 
        \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] , 
        \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] , 
        \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] , 
        \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] , 
        \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] , 
        \regs_matrix[15][0] }) );
  AND2X1 U2 ( .A(N11), .B(N10), .Y(n57) );
  INVX4 U3 ( .A(n383), .Y(n384) );
  INVX4 U4 ( .A(n77), .Y(n370) );
  INVX8 U5 ( .A(n649), .Y(n652) );
  INVX4 U31 ( .A(w_data[9]), .Y(n698) );
  INVX2 U32 ( .A(n60), .Y(n1) );
  INVX4 U33 ( .A(w_data[6]), .Y(n689) );
  BUFX2 U34 ( .A(n662), .Y(n2) );
  BUFX4 U35 ( .A(n662), .Y(n3) );
  INVX4 U36 ( .A(n653), .Y(n654) );
  INVX4 U37 ( .A(n407), .Y(n653) );
  BUFX4 U38 ( .A(n644), .Y(n646) );
  INVX4 U39 ( .A(w_data[14]), .Y(n712) );
  INVX8 U40 ( .A(n664), .Y(n32) );
  INVX4 U41 ( .A(n664), .Y(n665) );
  INVX8 U42 ( .A(n645), .Y(n648) );
  INVX8 U43 ( .A(n646), .Y(n647) );
  INVX2 U44 ( .A(n161), .Y(r1_data[5]) );
  INVX2 U45 ( .A(n383), .Y(n385) );
  INVX2 U46 ( .A(n29), .Y(n31) );
  INVX2 U47 ( .A(n212), .Y(r1_data[8]) );
  INVX2 U48 ( .A(n246), .Y(r1_data[10]) );
  INVX2 U49 ( .A(n280), .Y(r1_data[12]) );
  INVX2 U50 ( .A(n297), .Y(r1_data[13]) );
  INVX2 U51 ( .A(n76), .Y(n366) );
  INVX1 U52 ( .A(N11), .Y(n4) );
  BUFX2 U53 ( .A(N10), .Y(n14) );
  NOR2X1 U54 ( .A(N16), .B(N14), .Y(n15) );
  NOR2X1 U55 ( .A(n27), .B(n16), .Y(n17) );
  INVX2 U56 ( .A(n15), .Y(n16) );
  BUFX2 U57 ( .A(n17), .Y(n650) );
  INVX4 U58 ( .A(n348), .Y(n81) );
  NAND2X1 U59 ( .A(N16), .B(N14), .Y(n18) );
  AND2X2 U60 ( .A(n19), .B(n639), .Y(n664) );
  INVX2 U61 ( .A(n18), .Y(n19) );
  INVX2 U62 ( .A(n60), .Y(n20) );
  BUFX2 U63 ( .A(n17), .Y(n649) );
  INVX4 U64 ( .A(n56), .Y(n660) );
  INVX4 U65 ( .A(n56), .Y(n53) );
  INVX4 U66 ( .A(n56), .Y(n54) );
  INVX2 U67 ( .A(n348), .Y(n21) );
  INVX1 U68 ( .A(n348), .Y(n22) );
  INVX2 U69 ( .A(n26), .Y(n23) );
  INVX2 U70 ( .A(n26), .Y(n24) );
  INVX1 U71 ( .A(n375), .Y(n376) );
  INVX2 U72 ( .A(n81), .Y(n375) );
  BUFX4 U73 ( .A(n360), .Y(n25) );
  INVX2 U74 ( .A(n408), .Y(n657) );
  INVX2 U75 ( .A(n411), .Y(n661) );
  INVX2 U76 ( .A(n370), .Y(n371) );
  INVX2 U77 ( .A(n383), .Y(n386) );
  INVX2 U78 ( .A(n85), .Y(n383) );
  INVX2 U79 ( .A(n390), .Y(n26) );
  INVX2 U80 ( .A(n366), .Y(n368) );
  INVX4 U81 ( .A(N12), .Y(n359) );
  INVX1 U82 ( .A(N15), .Y(n27) );
  INVX1 U83 ( .A(N10), .Y(n360) );
  BUFX2 U84 ( .A(N11), .Y(n28) );
  INVX8 U85 ( .A(n704), .Y(n705) );
  INVX2 U86 ( .A(n263), .Y(r1_data[11]) );
  INVX2 U87 ( .A(n178), .Y(r1_data[6]) );
  INVX8 U88 ( .A(n650), .Y(n651) );
  INVX4 U89 ( .A(n366), .Y(n369) );
  INVX4 U90 ( .A(n366), .Y(n367) );
  INVX2 U91 ( .A(n394), .Y(n29) );
  INVX2 U92 ( .A(n29), .Y(n30) );
  INVX2 U93 ( .A(n52), .Y(r2_data[15]) );
  INVX4 U94 ( .A(n110), .Y(r1_data[2]) );
  INVX1 U95 ( .A(N16), .Y(n640) );
  INVX4 U96 ( .A(n657), .Y(n659) );
  INVX4 U97 ( .A(n195), .Y(r1_data[7]) );
  INVX4 U98 ( .A(n59), .Y(n373) );
  INVX4 U99 ( .A(n653), .Y(n655) );
  INVX4 U100 ( .A(n653), .Y(n656) );
  INVX2 U101 ( .A(n706), .Y(n33) );
  INVX2 U102 ( .A(n706), .Y(n34) );
  INVX4 U103 ( .A(w_data[12]), .Y(n706) );
  INVX2 U104 ( .A(n701), .Y(n35) );
  INVX2 U105 ( .A(n701), .Y(n36) );
  INVX4 U106 ( .A(w_data[10]), .Y(n701) );
  INVX2 U107 ( .A(n689), .Y(n37) );
  INVX2 U108 ( .A(n689), .Y(n38) );
  INVX2 U109 ( .A(n695), .Y(n39) );
  INVX2 U110 ( .A(n695), .Y(n40) );
  INVX4 U111 ( .A(w_data[8]), .Y(n695) );
  INVX4 U112 ( .A(w_data[11]), .Y(n704) );
  INVX2 U113 ( .A(n698), .Y(n41) );
  INVX2 U114 ( .A(n698), .Y(n42) );
  INVX2 U115 ( .A(n661), .Y(n43) );
  INVX2 U116 ( .A(n661), .Y(n44) );
  INVX2 U117 ( .A(n692), .Y(n45) );
  INVX2 U118 ( .A(n692), .Y(n46) );
  INVX4 U119 ( .A(w_data[7]), .Y(n692) );
  INVX2 U120 ( .A(n712), .Y(n47) );
  INVX2 U121 ( .A(n712), .Y(n48) );
  INVX2 U122 ( .A(n60), .Y(n49) );
  INVX2 U123 ( .A(n671), .Y(n670) );
  NAND2X1 U124 ( .A(n614), .B(n671), .Y(n50) );
  NAND2X1 U125 ( .A(n615), .B(n670), .Y(n51) );
  NAND2X1 U126 ( .A(n50), .B(n51), .Y(n52) );
  INVX8 U127 ( .A(n388), .Y(n389) );
  INVX8 U128 ( .A(n59), .Y(n374) );
  INVX2 U129 ( .A(n60), .Y(n668) );
  BUFX4 U130 ( .A(n58), .Y(n388) );
  AND2X2 U131 ( .A(n61), .B(n640), .Y(n56) );
  INVX8 U132 ( .A(n363), .Y(n365) );
  AND2X1 U133 ( .A(n57), .B(n359), .Y(n58) );
  INVX2 U134 ( .A(N17), .Y(n671) );
  INVX2 U135 ( .A(w_data[3]), .Y(n680) );
  INVX2 U136 ( .A(w_data[2]), .Y(n677) );
  INVX2 U137 ( .A(w_data[4]), .Y(n683) );
  INVX2 U138 ( .A(w_data[5]), .Y(n686) );
  INVX2 U139 ( .A(w_data[1]), .Y(n674) );
  INVX2 U140 ( .A(w_data[0]), .Y(n672) );
  INVX1 U141 ( .A(n388), .Y(n55) );
  BUFX2 U142 ( .A(n644), .Y(n645) );
  INVX2 U143 ( .A(n60), .Y(n666) );
  INVX2 U144 ( .A(n60), .Y(n667) );
  INVX2 U145 ( .A(n661), .Y(n663) );
  INVX2 U146 ( .A(n657), .Y(n658) );
  INVX2 U147 ( .A(n661), .Y(n662) );
  AND2X2 U148 ( .A(N12), .B(n57), .Y(n59) );
  AND2X2 U149 ( .A(N16), .B(n61), .Y(n60) );
  INVX2 U150 ( .A(n671), .Y(n669) );
  AND2X2 U151 ( .A(N14), .B(N15), .Y(n61) );
  INVX4 U152 ( .A(n709), .Y(n711) );
  INVX4 U153 ( .A(n715), .Y(n717) );
  INVX4 U154 ( .A(n709), .Y(n710) );
  INVX4 U155 ( .A(n715), .Y(n716) );
  INVX2 U156 ( .A(n692), .Y(n694) );
  INVX2 U157 ( .A(n698), .Y(n700) );
  INVX2 U158 ( .A(n695), .Y(n697) );
  INVX2 U159 ( .A(n689), .Y(n691) );
  INVX2 U160 ( .A(n701), .Y(n703) );
  INVX2 U161 ( .A(n712), .Y(n714) );
  INVX2 U162 ( .A(n692), .Y(n693) );
  INVX2 U163 ( .A(n695), .Y(n696) );
  INVX2 U164 ( .A(n698), .Y(n699) );
  INVX2 U165 ( .A(n689), .Y(n690) );
  INVX2 U166 ( .A(n701), .Y(n702) );
  INVX2 U167 ( .A(n706), .Y(n708) );
  INVX2 U168 ( .A(n706), .Y(n707) );
  INVX2 U169 ( .A(n712), .Y(n713) );
  INVX2 U170 ( .A(n680), .Y(n682) );
  INVX2 U171 ( .A(n677), .Y(n679) );
  INVX2 U172 ( .A(n680), .Y(n681) );
  INVX2 U173 ( .A(n677), .Y(n678) );
  INVX2 U174 ( .A(n683), .Y(n685) );
  INVX2 U175 ( .A(n683), .Y(n684) );
  INVX2 U176 ( .A(n686), .Y(n688) );
  INVX2 U177 ( .A(n686), .Y(n687) );
  INVX2 U178 ( .A(n674), .Y(n676) );
  INVX2 U179 ( .A(n674), .Y(n675) );
  INVX2 U180 ( .A(n672), .Y(n673) );
  BUFX2 U181 ( .A(n_reset), .Y(n718) );
  BUFX2 U182 ( .A(n_reset), .Y(n719) );
  BUFX2 U183 ( .A(n_reset), .Y(n720) );
  BUFX2 U184 ( .A(n_reset), .Y(n721) );
  BUFX2 U185 ( .A(n_reset), .Y(n722) );
  BUFX2 U186 ( .A(n_reset), .Y(n723) );
  BUFX2 U187 ( .A(n_reset), .Y(n724) );
  BUFX2 U188 ( .A(n_reset), .Y(n725) );
  AOI22X1 U189 ( .A(n65), .B(n64), .C(n63), .D(n62), .Y(n66) );
  INVX2 U190 ( .A(N13), .Y(n67) );
  INVX2 U191 ( .A(n66), .Y(r1_data[16]) );
  AOI22X1 U192 ( .A(n69), .B(n70), .C(n71), .D(n72), .Y(n68) );
  NOR2X1 U193 ( .A(n73), .B(n74), .Y(n72) );
  OAI22X1 U194 ( .A(\regs_matrix[6][0] ), .B(n364), .C(outreg_data[0]), .D(
        n369), .Y(n74) );
  OAI21X1 U195 ( .A(\regs_matrix[4][0] ), .B(n372), .C(n67), .Y(n73) );
  NOR2X1 U196 ( .A(n78), .B(n79), .Y(n71) );
  OAI21X1 U197 ( .A(\regs_matrix[7][0] ), .B(n374), .C(n80), .Y(n79) );
  AOI22X1 U198 ( .A(n21), .B(n82), .C(n388), .D(n83), .Y(n80) );
  INVX2 U199 ( .A(\regs_matrix[3][0] ), .Y(n83) );
  INVX2 U200 ( .A(\regs_matrix[1][0] ), .Y(n82) );
  OAI22X1 U201 ( .A(\regs_matrix[2][0] ), .B(n381), .C(\regs_matrix[5][0] ), 
        .D(n384), .Y(n78) );
  NOR2X1 U202 ( .A(n86), .B(n87), .Y(n70) );
  OAI22X1 U203 ( .A(\regs_matrix[14][0] ), .B(n365), .C(\regs_matrix[8][0] ), 
        .D(n368), .Y(n87) );
  OAI21X1 U204 ( .A(\regs_matrix[12][0] ), .B(n371), .C(N13), .Y(n86) );
  NOR2X1 U205 ( .A(n88), .B(n89), .Y(n69) );
  OAI21X1 U206 ( .A(\regs_matrix[15][0] ), .B(n374), .C(n90), .Y(n89) );
  AOI22X1 U207 ( .A(n26), .B(n91), .C(n388), .D(n92), .Y(n90) );
  INVX2 U208 ( .A(\regs_matrix[11][0] ), .Y(n92) );
  INVX2 U209 ( .A(\regs_matrix[9][0] ), .Y(n91) );
  OAI22X1 U210 ( .A(\regs_matrix[10][0] ), .B(n381), .C(\regs_matrix[13][0] ), 
        .D(n386), .Y(n88) );
  AOI22X1 U211 ( .A(n94), .B(n95), .C(n96), .D(n97), .Y(n93) );
  NOR2X1 U212 ( .A(n99), .B(n98), .Y(n97) );
  OAI22X1 U213 ( .A(outreg_data[1]), .B(n369), .C(\regs_matrix[2][1] ), .D(
        n382), .Y(n99) );
  OAI22X1 U214 ( .A(\regs_matrix[4][1] ), .B(n372), .C(\regs_matrix[6][1] ), 
        .D(n364), .Y(n98) );
  NOR2X1 U215 ( .A(n100), .B(n101), .Y(n96) );
  OAI21X1 U216 ( .A(\regs_matrix[3][1] ), .B(n389), .C(n102), .Y(n101) );
  AOI21X1 U217 ( .A(n22), .B(n103), .C(N13), .Y(n102) );
  INVX2 U218 ( .A(\regs_matrix[1][1] ), .Y(n103) );
  OAI22X1 U219 ( .A(\regs_matrix[5][1] ), .B(n31), .C(\regs_matrix[7][1] ), 
        .D(n373), .Y(n100) );
  NOR2X1 U220 ( .A(n104), .B(n105), .Y(n95) );
  OAI22X1 U221 ( .A(\regs_matrix[8][1] ), .B(n368), .C(\regs_matrix[10][1] ), 
        .D(n393), .Y(n105) );
  OAI22X1 U222 ( .A(\regs_matrix[12][1] ), .B(n371), .C(\regs_matrix[14][1] ), 
        .D(n365), .Y(n104) );
  NOR2X1 U223 ( .A(n106), .B(n107), .Y(n94) );
  OAI21X1 U224 ( .A(\regs_matrix[11][1] ), .B(n392), .C(n108), .Y(n107) );
  AOI21X1 U225 ( .A(n26), .B(n109), .C(n67), .Y(n108) );
  INVX2 U226 ( .A(\regs_matrix[9][1] ), .Y(n109) );
  OAI22X1 U227 ( .A(\regs_matrix[13][1] ), .B(n386), .C(\regs_matrix[15][1] ), 
        .D(n374), .Y(n106) );
  AOI22X1 U228 ( .A(n111), .B(n112), .C(n113), .D(n114), .Y(n110) );
  NOR2X1 U229 ( .A(n115), .B(n116), .Y(n114) );
  OAI22X1 U230 ( .A(outreg_data[2]), .B(n369), .C(\regs_matrix[2][2] ), .D(
        n382), .Y(n116) );
  OAI22X1 U231 ( .A(\regs_matrix[4][2] ), .B(n372), .C(\regs_matrix[6][2] ), 
        .D(n364), .Y(n115) );
  NOR2X1 U232 ( .A(n117), .B(n118), .Y(n113) );
  OAI21X1 U233 ( .A(\regs_matrix[3][2] ), .B(n391), .C(n119), .Y(n118) );
  AOI21X1 U234 ( .A(n81), .B(n120), .C(N13), .Y(n119) );
  INVX2 U235 ( .A(\regs_matrix[1][2] ), .Y(n120) );
  OAI22X1 U236 ( .A(\regs_matrix[5][2] ), .B(n385), .C(\regs_matrix[7][2] ), 
        .D(n374), .Y(n117) );
  NOR2X1 U237 ( .A(n121), .B(n122), .Y(n112) );
  OAI22X1 U238 ( .A(\regs_matrix[8][2] ), .B(n368), .C(\regs_matrix[10][2] ), 
        .D(n393), .Y(n122) );
  OAI22X1 U239 ( .A(\regs_matrix[12][2] ), .B(n371), .C(\regs_matrix[14][2] ), 
        .D(n365), .Y(n121) );
  NOR2X1 U240 ( .A(n123), .B(n124), .Y(n111) );
  OAI21X1 U241 ( .A(\regs_matrix[11][2] ), .B(n392), .C(n125), .Y(n124) );
  AOI21X1 U242 ( .A(n26), .B(n126), .C(n67), .Y(n125) );
  INVX2 U243 ( .A(\regs_matrix[9][2] ), .Y(n126) );
  OAI22X1 U244 ( .A(\regs_matrix[13][2] ), .B(n386), .C(\regs_matrix[15][2] ), 
        .D(n374), .Y(n123) );
  AOI22X1 U245 ( .A(n128), .B(n129), .C(n130), .D(n131), .Y(n127) );
  NOR2X1 U246 ( .A(n132), .B(n133), .Y(n131) );
  OAI22X1 U247 ( .A(outreg_data[3]), .B(n367), .C(\regs_matrix[2][3] ), .D(
        n382), .Y(n133) );
  OAI22X1 U248 ( .A(\regs_matrix[4][3] ), .B(n372), .C(\regs_matrix[6][3] ), 
        .D(n364), .Y(n132) );
  NOR2X1 U249 ( .A(n134), .B(n135), .Y(n130) );
  OAI21X1 U250 ( .A(\regs_matrix[3][3] ), .B(n391), .C(n136), .Y(n135) );
  AOI21X1 U251 ( .A(n21), .B(n137), .C(N13), .Y(n136) );
  INVX2 U252 ( .A(\regs_matrix[1][3] ), .Y(n137) );
  OAI22X1 U253 ( .A(\regs_matrix[5][3] ), .B(n30), .C(\regs_matrix[7][3] ), 
        .D(n373), .Y(n134) );
  NOR2X1 U254 ( .A(n138), .B(n139), .Y(n129) );
  OAI22X1 U255 ( .A(\regs_matrix[8][3] ), .B(n368), .C(\regs_matrix[10][3] ), 
        .D(n393), .Y(n139) );
  OAI22X1 U256 ( .A(\regs_matrix[12][3] ), .B(n371), .C(\regs_matrix[14][3] ), 
        .D(n365), .Y(n138) );
  NOR2X1 U257 ( .A(n140), .B(n141), .Y(n128) );
  OAI21X1 U258 ( .A(\regs_matrix[11][3] ), .B(n392), .C(n142), .Y(n141) );
  AOI21X1 U259 ( .A(n26), .B(n143), .C(n67), .Y(n142) );
  INVX2 U260 ( .A(\regs_matrix[9][3] ), .Y(n143) );
  OAI22X1 U261 ( .A(\regs_matrix[13][3] ), .B(n386), .C(\regs_matrix[15][3] ), 
        .D(n374), .Y(n140) );
  AOI22X1 U262 ( .A(n145), .B(n146), .C(n147), .D(n148), .Y(n144) );
  NOR2X1 U263 ( .A(n149), .B(n150), .Y(n148) );
  OAI22X1 U264 ( .A(outreg_data[4]), .B(n369), .C(\regs_matrix[2][4] ), .D(
        n382), .Y(n150) );
  OAI22X1 U265 ( .A(\regs_matrix[4][4] ), .B(n372), .C(\regs_matrix[6][4] ), 
        .D(n365), .Y(n149) );
  NOR2X1 U266 ( .A(n151), .B(n152), .Y(n147) );
  OAI21X1 U267 ( .A(\regs_matrix[3][4] ), .B(n391), .C(n153), .Y(n152) );
  AOI21X1 U268 ( .A(n81), .B(n154), .C(N13), .Y(n153) );
  INVX2 U269 ( .A(\regs_matrix[1][4] ), .Y(n154) );
  OAI22X1 U270 ( .A(\regs_matrix[5][4] ), .B(n385), .C(\regs_matrix[7][4] ), 
        .D(n373), .Y(n151) );
  NOR2X1 U271 ( .A(n155), .B(n156), .Y(n146) );
  OAI22X1 U272 ( .A(\regs_matrix[8][4] ), .B(n368), .C(\regs_matrix[10][4] ), 
        .D(n393), .Y(n156) );
  OAI22X1 U273 ( .A(\regs_matrix[12][4] ), .B(n371), .C(\regs_matrix[14][4] ), 
        .D(n365), .Y(n155) );
  NOR2X1 U274 ( .A(n157), .B(n158), .Y(n145) );
  OAI21X1 U275 ( .A(\regs_matrix[11][4] ), .B(n392), .C(n159), .Y(n158) );
  AOI21X1 U276 ( .A(n26), .B(n160), .C(n67), .Y(n159) );
  INVX2 U277 ( .A(\regs_matrix[9][4] ), .Y(n160) );
  OAI22X1 U278 ( .A(\regs_matrix[13][4] ), .B(n386), .C(\regs_matrix[15][4] ), 
        .D(n374), .Y(n157) );
  AOI22X1 U279 ( .A(n162), .B(n163), .C(n164), .D(n165), .Y(n161) );
  NOR2X1 U280 ( .A(n166), .B(n167), .Y(n165) );
  OAI22X1 U281 ( .A(outreg_data[5]), .B(n367), .C(\regs_matrix[2][5] ), .D(
        n381), .Y(n167) );
  OAI22X1 U282 ( .A(\regs_matrix[4][5] ), .B(n372), .C(\regs_matrix[6][5] ), 
        .D(n364), .Y(n166) );
  NOR2X1 U283 ( .A(n168), .B(n169), .Y(n164) );
  OAI21X1 U284 ( .A(\regs_matrix[3][5] ), .B(n391), .C(n170), .Y(n169) );
  AOI21X1 U285 ( .A(n22), .B(n171), .C(N13), .Y(n170) );
  INVX2 U286 ( .A(\regs_matrix[1][5] ), .Y(n171) );
  OAI22X1 U287 ( .A(\regs_matrix[5][5] ), .B(n31), .C(\regs_matrix[7][5] ), 
        .D(n373), .Y(n168) );
  NOR2X1 U288 ( .A(n172), .B(n173), .Y(n163) );
  OAI22X1 U289 ( .A(\regs_matrix[8][5] ), .B(n368), .C(\regs_matrix[10][5] ), 
        .D(n393), .Y(n173) );
  OAI22X1 U290 ( .A(\regs_matrix[12][5] ), .B(n371), .C(\regs_matrix[14][5] ), 
        .D(n365), .Y(n172) );
  NOR2X1 U291 ( .A(n174), .B(n175), .Y(n162) );
  OAI21X1 U292 ( .A(\regs_matrix[11][5] ), .B(n392), .C(n176), .Y(n175) );
  AOI21X1 U293 ( .A(n26), .B(n177), .C(n67), .Y(n176) );
  INVX2 U294 ( .A(\regs_matrix[9][5] ), .Y(n177) );
  OAI22X1 U295 ( .A(\regs_matrix[13][5] ), .B(n386), .C(\regs_matrix[15][5] ), 
        .D(n374), .Y(n174) );
  AOI22X1 U296 ( .A(n179), .B(n180), .C(n181), .D(n182), .Y(n178) );
  NOR2X1 U297 ( .A(n183), .B(n184), .Y(n182) );
  OAI22X1 U298 ( .A(outreg_data[6]), .B(n367), .C(\regs_matrix[2][6] ), .D(
        n381), .Y(n184) );
  OAI22X1 U299 ( .A(\regs_matrix[4][6] ), .B(n372), .C(\regs_matrix[6][6] ), 
        .D(n364), .Y(n183) );
  NOR2X1 U300 ( .A(n185), .B(n186), .Y(n181) );
  OAI21X1 U301 ( .A(\regs_matrix[3][6] ), .B(n391), .C(n187), .Y(n186) );
  AOI21X1 U302 ( .A(n81), .B(n188), .C(N13), .Y(n187) );
  INVX2 U303 ( .A(\regs_matrix[1][6] ), .Y(n188) );
  OAI22X1 U304 ( .A(\regs_matrix[5][6] ), .B(n384), .C(\regs_matrix[7][6] ), 
        .D(n373), .Y(n185) );
  NOR2X1 U305 ( .A(n189), .B(n190), .Y(n180) );
  OAI22X1 U306 ( .A(\regs_matrix[8][6] ), .B(n368), .C(\regs_matrix[10][6] ), 
        .D(n393), .Y(n190) );
  OAI22X1 U307 ( .A(\regs_matrix[12][6] ), .B(n371), .C(\regs_matrix[14][6] ), 
        .D(n365), .Y(n189) );
  NOR2X1 U308 ( .A(n191), .B(n192), .Y(n179) );
  OAI21X1 U309 ( .A(\regs_matrix[11][6] ), .B(n392), .C(n193), .Y(n192) );
  AOI21X1 U310 ( .A(n26), .B(n194), .C(n67), .Y(n193) );
  INVX2 U311 ( .A(\regs_matrix[9][6] ), .Y(n194) );
  OAI22X1 U312 ( .A(\regs_matrix[13][6] ), .B(n384), .C(\regs_matrix[15][6] ), 
        .D(n374), .Y(n191) );
  AOI22X1 U313 ( .A(n196), .B(n197), .C(n198), .D(n199), .Y(n195) );
  NOR2X1 U314 ( .A(n200), .B(n201), .Y(n199) );
  OAI22X1 U315 ( .A(outreg_data[7]), .B(n369), .C(\regs_matrix[2][7] ), .D(
        n381), .Y(n201) );
  OAI22X1 U316 ( .A(\regs_matrix[4][7] ), .B(n372), .C(\regs_matrix[6][7] ), 
        .D(n364), .Y(n200) );
  NOR2X1 U317 ( .A(n202), .B(n203), .Y(n198) );
  OAI21X1 U318 ( .A(\regs_matrix[3][7] ), .B(n389), .C(n204), .Y(n203) );
  AOI21X1 U319 ( .A(n21), .B(n205), .C(N13), .Y(n204) );
  INVX2 U320 ( .A(\regs_matrix[1][7] ), .Y(n205) );
  OAI22X1 U321 ( .A(\regs_matrix[5][7] ), .B(n384), .C(\regs_matrix[7][7] ), 
        .D(n373), .Y(n202) );
  NOR2X1 U322 ( .A(n206), .B(n207), .Y(n197) );
  OAI22X1 U323 ( .A(\regs_matrix[8][7] ), .B(n368), .C(\regs_matrix[10][7] ), 
        .D(n393), .Y(n207) );
  OAI22X1 U324 ( .A(\regs_matrix[12][7] ), .B(n371), .C(\regs_matrix[14][7] ), 
        .D(n365), .Y(n206) );
  NOR2X1 U325 ( .A(n208), .B(n209), .Y(n196) );
  OAI21X1 U326 ( .A(\regs_matrix[11][7] ), .B(n392), .C(n210), .Y(n209) );
  AOI21X1 U327 ( .A(n26), .B(n211), .C(n67), .Y(n210) );
  INVX2 U328 ( .A(\regs_matrix[9][7] ), .Y(n211) );
  OAI22X1 U329 ( .A(\regs_matrix[13][7] ), .B(n31), .C(\regs_matrix[15][7] ), 
        .D(n374), .Y(n208) );
  AOI22X1 U330 ( .A(n213), .B(n214), .C(n215), .D(n216), .Y(n212) );
  NOR2X1 U331 ( .A(n217), .B(n218), .Y(n216) );
  OAI22X1 U332 ( .A(outreg_data[8]), .B(n369), .C(\regs_matrix[2][8] ), .D(
        n382), .Y(n218) );
  OAI22X1 U333 ( .A(\regs_matrix[4][8] ), .B(n372), .C(\regs_matrix[6][8] ), 
        .D(n365), .Y(n217) );
  NOR2X1 U334 ( .A(n219), .B(n220), .Y(n215) );
  OAI21X1 U335 ( .A(\regs_matrix[3][8] ), .B(n389), .C(n221), .Y(n220) );
  AOI21X1 U336 ( .A(n377), .B(n222), .C(N13), .Y(n221) );
  INVX2 U337 ( .A(\regs_matrix[1][8] ), .Y(n222) );
  OAI22X1 U338 ( .A(\regs_matrix[5][8] ), .B(n384), .C(\regs_matrix[7][8] ), 
        .D(n374), .Y(n219) );
  NOR2X1 U339 ( .A(n223), .B(n224), .Y(n214) );
  OAI22X1 U340 ( .A(\regs_matrix[8][8] ), .B(n368), .C(\regs_matrix[10][8] ), 
        .D(n393), .Y(n224) );
  OAI22X1 U341 ( .A(\regs_matrix[12][8] ), .B(n371), .C(\regs_matrix[14][8] ), 
        .D(n365), .Y(n223) );
  NOR2X1 U342 ( .A(n225), .B(n226), .Y(n213) );
  OAI21X1 U343 ( .A(\regs_matrix[11][8] ), .B(n392), .C(n227), .Y(n226) );
  AOI21X1 U344 ( .A(n26), .B(n228), .C(n67), .Y(n227) );
  INVX2 U345 ( .A(\regs_matrix[9][8] ), .Y(n228) );
  OAI22X1 U346 ( .A(\regs_matrix[13][8] ), .B(n386), .C(\regs_matrix[15][8] ), 
        .D(n374), .Y(n225) );
  INVX2 U347 ( .A(n229), .Y(r1_data[9]) );
  AOI22X1 U348 ( .A(n230), .B(n231), .C(n232), .D(n233), .Y(n229) );
  NOR2X1 U349 ( .A(n234), .B(n235), .Y(n233) );
  OAI22X1 U350 ( .A(outreg_data[9]), .B(n367), .C(\regs_matrix[2][9] ), .D(
        n382), .Y(n235) );
  OAI22X1 U351 ( .A(\regs_matrix[4][9] ), .B(n372), .C(\regs_matrix[6][9] ), 
        .D(n364), .Y(n234) );
  NOR2X1 U352 ( .A(n236), .B(n237), .Y(n232) );
  OAI21X1 U353 ( .A(\regs_matrix[3][9] ), .B(n391), .C(n238), .Y(n237) );
  AOI21X1 U354 ( .A(n81), .B(n239), .C(N13), .Y(n238) );
  INVX2 U355 ( .A(\regs_matrix[1][9] ), .Y(n239) );
  OAI22X1 U356 ( .A(\regs_matrix[5][9] ), .B(n31), .C(\regs_matrix[7][9] ), 
        .D(n373), .Y(n236) );
  NOR2X1 U357 ( .A(n240), .B(n241), .Y(n231) );
  OAI22X1 U358 ( .A(\regs_matrix[8][9] ), .B(n368), .C(\regs_matrix[10][9] ), 
        .D(n393), .Y(n241) );
  OAI22X1 U359 ( .A(\regs_matrix[12][9] ), .B(n371), .C(\regs_matrix[14][9] ), 
        .D(n365), .Y(n240) );
  NOR2X1 U360 ( .A(n242), .B(n243), .Y(n230) );
  OAI21X1 U361 ( .A(\regs_matrix[11][9] ), .B(n392), .C(n244), .Y(n243) );
  AOI21X1 U362 ( .A(n26), .B(n245), .C(n67), .Y(n244) );
  INVX2 U363 ( .A(\regs_matrix[9][9] ), .Y(n245) );
  OAI22X1 U364 ( .A(\regs_matrix[13][9] ), .B(n386), .C(\regs_matrix[15][9] ), 
        .D(n374), .Y(n242) );
  AOI22X1 U365 ( .A(n247), .B(n248), .C(n249), .D(n250), .Y(n246) );
  NOR2X1 U366 ( .A(n251), .B(n252), .Y(n250) );
  OAI22X1 U367 ( .A(outreg_data[10]), .B(n369), .C(\regs_matrix[2][10] ), .D(
        n382), .Y(n252) );
  OAI22X1 U368 ( .A(\regs_matrix[4][10] ), .B(n372), .C(\regs_matrix[6][10] ), 
        .D(n365), .Y(n251) );
  NOR2X1 U369 ( .A(n253), .B(n254), .Y(n249) );
  OAI21X1 U370 ( .A(\regs_matrix[3][10] ), .B(n389), .C(n255), .Y(n254) );
  AOI21X1 U371 ( .A(n376), .B(n256), .C(N13), .Y(n255) );
  INVX2 U372 ( .A(\regs_matrix[1][10] ), .Y(n256) );
  OAI22X1 U373 ( .A(\regs_matrix[5][10] ), .B(n384), .C(\regs_matrix[7][10] ), 
        .D(n374), .Y(n253) );
  NOR2X1 U374 ( .A(n257), .B(n258), .Y(n248) );
  OAI22X1 U375 ( .A(\regs_matrix[8][10] ), .B(n368), .C(\regs_matrix[10][10] ), 
        .D(n393), .Y(n258) );
  OAI22X1 U376 ( .A(\regs_matrix[12][10] ), .B(n371), .C(\regs_matrix[14][10] ), .D(n365), .Y(n257) );
  NOR2X1 U377 ( .A(n259), .B(n260), .Y(n247) );
  OAI21X1 U378 ( .A(\regs_matrix[11][10] ), .B(n392), .C(n261), .Y(n260) );
  AOI21X1 U379 ( .A(n26), .B(n262), .C(n67), .Y(n261) );
  INVX2 U380 ( .A(\regs_matrix[9][10] ), .Y(n262) );
  OAI22X1 U381 ( .A(\regs_matrix[13][10] ), .B(n386), .C(\regs_matrix[15][10] ), .D(n374), .Y(n259) );
  AOI22X1 U382 ( .A(n264), .B(n265), .C(n266), .D(n267), .Y(n263) );
  NOR2X1 U383 ( .A(n268), .B(n269), .Y(n267) );
  OAI22X1 U384 ( .A(outreg_data[11]), .B(n367), .C(\regs_matrix[2][11] ), .D(
        n382), .Y(n269) );
  OAI22X1 U385 ( .A(\regs_matrix[4][11] ), .B(n372), .C(\regs_matrix[6][11] ), 
        .D(n364), .Y(n268) );
  NOR2X1 U386 ( .A(n270), .B(n271), .Y(n266) );
  OAI21X1 U387 ( .A(\regs_matrix[3][11] ), .B(n389), .C(n272), .Y(n271) );
  AOI21X1 U388 ( .A(n21), .B(n273), .C(N13), .Y(n272) );
  INVX2 U389 ( .A(\regs_matrix[1][11] ), .Y(n273) );
  OAI22X1 U390 ( .A(\regs_matrix[5][11] ), .B(n30), .C(\regs_matrix[7][11] ), 
        .D(n373), .Y(n270) );
  NOR2X1 U391 ( .A(n274), .B(n275), .Y(n265) );
  OAI22X1 U392 ( .A(\regs_matrix[8][11] ), .B(n368), .C(\regs_matrix[10][11] ), 
        .D(n393), .Y(n275) );
  OAI22X1 U393 ( .A(\regs_matrix[12][11] ), .B(n371), .C(\regs_matrix[14][11] ), .D(n365), .Y(n274) );
  NOR2X1 U394 ( .A(n276), .B(n277), .Y(n264) );
  OAI21X1 U395 ( .A(\regs_matrix[11][11] ), .B(n392), .C(n278), .Y(n277) );
  AOI21X1 U396 ( .A(n26), .B(n279), .C(n67), .Y(n278) );
  INVX2 U397 ( .A(\regs_matrix[9][11] ), .Y(n279) );
  OAI22X1 U398 ( .A(\regs_matrix[13][11] ), .B(n386), .C(\regs_matrix[15][11] ), .D(n374), .Y(n276) );
  AOI22X1 U399 ( .A(n281), .B(n282), .C(n283), .D(n284), .Y(n280) );
  NOR2X1 U400 ( .A(n285), .B(n286), .Y(n284) );
  OAI22X1 U401 ( .A(outreg_data[12]), .B(n369), .C(\regs_matrix[2][12] ), .D(
        n382), .Y(n286) );
  OAI22X1 U402 ( .A(\regs_matrix[4][12] ), .B(n372), .C(\regs_matrix[6][12] ), 
        .D(n364), .Y(n285) );
  NOR2X1 U403 ( .A(n287), .B(n288), .Y(n283) );
  OAI21X1 U404 ( .A(\regs_matrix[3][12] ), .B(n389), .C(n289), .Y(n288) );
  AOI21X1 U405 ( .A(n21), .B(n290), .C(N13), .Y(n289) );
  INVX2 U406 ( .A(\regs_matrix[1][12] ), .Y(n290) );
  OAI22X1 U407 ( .A(\regs_matrix[5][12] ), .B(n385), .C(\regs_matrix[7][12] ), 
        .D(n374), .Y(n287) );
  NOR2X1 U408 ( .A(n291), .B(n292), .Y(n282) );
  OAI22X1 U409 ( .A(\regs_matrix[8][12] ), .B(n368), .C(\regs_matrix[10][12] ), 
        .D(n393), .Y(n292) );
  OAI22X1 U410 ( .A(\regs_matrix[12][12] ), .B(n371), .C(\regs_matrix[14][12] ), .D(n365), .Y(n291) );
  NOR2X1 U411 ( .A(n293), .B(n294), .Y(n281) );
  OAI21X1 U412 ( .A(\regs_matrix[11][12] ), .B(n55), .C(n295), .Y(n294) );
  AOI21X1 U413 ( .A(n26), .B(n296), .C(n67), .Y(n295) );
  INVX2 U414 ( .A(\regs_matrix[9][12] ), .Y(n296) );
  OAI22X1 U415 ( .A(\regs_matrix[13][12] ), .B(n386), .C(\regs_matrix[15][12] ), .D(n374), .Y(n293) );
  AOI22X1 U416 ( .A(n298), .B(n299), .C(n300), .D(n301), .Y(n297) );
  NOR2X1 U417 ( .A(n302), .B(n303), .Y(n301) );
  OAI22X1 U418 ( .A(outreg_data[13]), .B(n367), .C(\regs_matrix[2][13] ), .D(
        n381), .Y(n303) );
  OAI22X1 U419 ( .A(\regs_matrix[4][13] ), .B(n372), .C(\regs_matrix[6][13] ), 
        .D(n364), .Y(n302) );
  NOR2X1 U420 ( .A(n304), .B(n305), .Y(n300) );
  OAI21X1 U421 ( .A(\regs_matrix[3][13] ), .B(n389), .C(n306), .Y(n305) );
  AOI21X1 U422 ( .A(n81), .B(n307), .C(N13), .Y(n306) );
  INVX2 U423 ( .A(\regs_matrix[1][13] ), .Y(n307) );
  OAI22X1 U424 ( .A(\regs_matrix[5][13] ), .B(n31), .C(\regs_matrix[7][13] ), 
        .D(n373), .Y(n304) );
  NOR2X1 U425 ( .A(n308), .B(n309), .Y(n299) );
  OAI22X1 U426 ( .A(\regs_matrix[8][13] ), .B(n368), .C(\regs_matrix[10][13] ), 
        .D(n381), .Y(n309) );
  OAI22X1 U427 ( .A(\regs_matrix[12][13] ), .B(n371), .C(\regs_matrix[14][13] ), .D(n365), .Y(n308) );
  NOR2X1 U428 ( .A(n310), .B(n311), .Y(n298) );
  OAI21X1 U429 ( .A(\regs_matrix[11][13] ), .B(n55), .C(n312), .Y(n311) );
  AOI21X1 U430 ( .A(n26), .B(n313), .C(n67), .Y(n312) );
  INVX2 U431 ( .A(\regs_matrix[9][13] ), .Y(n313) );
  OAI22X1 U432 ( .A(\regs_matrix[13][13] ), .B(n386), .C(\regs_matrix[15][13] ), .D(n374), .Y(n310) );
  AOI22X1 U433 ( .A(n315), .B(n316), .C(n317), .D(n318), .Y(n314) );
  NOR2X1 U434 ( .A(n319), .B(n320), .Y(n318) );
  OAI22X1 U435 ( .A(outreg_data[14]), .B(n367), .C(\regs_matrix[2][14] ), .D(
        n381), .Y(n320) );
  OAI22X1 U436 ( .A(\regs_matrix[4][14] ), .B(n372), .C(\regs_matrix[6][14] ), 
        .D(n364), .Y(n319) );
  NOR2X1 U437 ( .A(n321), .B(n322), .Y(n317) );
  OAI21X1 U438 ( .A(\regs_matrix[3][14] ), .B(n389), .C(n323), .Y(n322) );
  AOI21X1 U439 ( .A(n21), .B(n324), .C(N13), .Y(n323) );
  INVX2 U440 ( .A(\regs_matrix[1][14] ), .Y(n324) );
  OAI22X1 U441 ( .A(\regs_matrix[5][14] ), .B(n31), .C(\regs_matrix[7][14] ), 
        .D(n373), .Y(n321) );
  NOR2X1 U442 ( .A(n325), .B(n326), .Y(n316) );
  OAI22X1 U443 ( .A(\regs_matrix[8][14] ), .B(n368), .C(\regs_matrix[10][14] ), 
        .D(n381), .Y(n326) );
  OAI22X1 U444 ( .A(\regs_matrix[12][14] ), .B(n371), .C(\regs_matrix[14][14] ), .D(n365), .Y(n325) );
  NOR2X1 U445 ( .A(n327), .B(n328), .Y(n315) );
  OAI21X1 U446 ( .A(\regs_matrix[11][14] ), .B(n55), .C(n329), .Y(n328) );
  AOI21X1 U447 ( .A(n26), .B(n330), .C(n67), .Y(n329) );
  INVX2 U448 ( .A(\regs_matrix[9][14] ), .Y(n330) );
  OAI22X1 U449 ( .A(\regs_matrix[13][14] ), .B(n386), .C(\regs_matrix[15][14] ), .D(n374), .Y(n327) );
  AOI22X1 U450 ( .A(n332), .B(n333), .C(n334), .D(n335), .Y(n331) );
  NOR2X1 U451 ( .A(n336), .B(n337), .Y(n335) );
  OAI22X1 U452 ( .A(outreg_data[15]), .B(n369), .C(\regs_matrix[2][15] ), .D(
        n381), .Y(n337) );
  OAI22X1 U453 ( .A(\regs_matrix[4][15] ), .B(n372), .C(\regs_matrix[6][15] ), 
        .D(n364), .Y(n336) );
  NOR2X1 U454 ( .A(n338), .B(n339), .Y(n334) );
  OAI21X1 U455 ( .A(\regs_matrix[3][15] ), .B(n389), .C(n340), .Y(n339) );
  AOI21X1 U456 ( .A(n81), .B(n341), .C(N13), .Y(n340) );
  INVX2 U457 ( .A(\regs_matrix[1][15] ), .Y(n341) );
  OAI22X1 U458 ( .A(\regs_matrix[5][15] ), .B(n385), .C(\regs_matrix[7][15] ), 
        .D(n374), .Y(n338) );
  NOR2X1 U459 ( .A(n342), .B(n343), .Y(n333) );
  OAI22X1 U460 ( .A(\regs_matrix[8][15] ), .B(n368), .C(\regs_matrix[10][15] ), 
        .D(n381), .Y(n343) );
  OAI22X1 U461 ( .A(\regs_matrix[12][15] ), .B(n371), .C(\regs_matrix[14][15] ), .D(n365), .Y(n342) );
  NOR2X1 U462 ( .A(n344), .B(n345), .Y(n332) );
  OAI21X1 U463 ( .A(\regs_matrix[11][15] ), .B(n55), .C(n346), .Y(n345) );
  AOI21X1 U464 ( .A(n26), .B(n347), .C(n67), .Y(n346) );
  INVX2 U465 ( .A(\regs_matrix[9][15] ), .Y(n347) );
  OAI22X1 U466 ( .A(\regs_matrix[13][15] ), .B(n386), .C(\regs_matrix[15][15] ), .D(n374), .Y(n344) );
  NOR2X1 U467 ( .A(n349), .B(n350), .Y(n62) );
  OAI21X1 U468 ( .A(outreg_data[16]), .B(n369), .C(n351), .Y(n350) );
  AOI21X1 U469 ( .A(n379), .B(n352), .C(N13), .Y(n351) );
  INVX2 U470 ( .A(\regs_matrix[2][16] ), .Y(n352) );
  OAI22X1 U471 ( .A(\regs_matrix[4][16] ), .B(n372), .C(\regs_matrix[6][16] ), 
        .D(n365), .Y(n349) );
  NOR2X1 U472 ( .A(n353), .B(n354), .Y(n63) );
  OAI22X1 U473 ( .A(\regs_matrix[3][16] ), .B(n55), .C(\regs_matrix[1][16] ), 
        .D(n23), .Y(n354) );
  OAI22X1 U474 ( .A(\regs_matrix[5][16] ), .B(n384), .C(\regs_matrix[7][16] ), 
        .D(n374), .Y(n353) );
  NOR3X1 U475 ( .A(n355), .B(n356), .C(n357), .Y(n64) );
  OAI22X1 U476 ( .A(\regs_matrix[10][16] ), .B(n381), .C(\regs_matrix[8][16] ), 
        .D(n368), .Y(n357) );
  NAND3X1 U477 ( .A(n358), .B(n359), .C(n25), .Y(n76) );
  NAND3X1 U478 ( .A(n28), .B(n359), .C(n25), .Y(n84) );
  NOR2X1 U479 ( .A(\regs_matrix[12][16] ), .B(n371), .Y(n356) );
  NAND3X1 U480 ( .A(N12), .B(n358), .C(n25), .Y(n77) );
  OAI22X1 U481 ( .A(\regs_matrix[9][16] ), .B(n24), .C(\regs_matrix[14][16] ), 
        .D(n365), .Y(n355) );
  NAND3X1 U482 ( .A(N12), .B(n28), .C(n25), .Y(n75) );
  NAND3X1 U483 ( .A(n14), .B(n359), .C(n4), .Y(n348) );
  NOR2X1 U484 ( .A(n361), .B(n362), .Y(n65) );
  OAI21X1 U485 ( .A(\regs_matrix[11][16] ), .B(n392), .C(N13), .Y(n362) );
  OAI22X1 U486 ( .A(\regs_matrix[15][16] ), .B(n374), .C(\regs_matrix[13][16] ), .D(n386), .Y(n361) );
  NAND3X1 U487 ( .A(N12), .B(n358), .C(n14), .Y(n85) );
  INVX2 U488 ( .A(N11), .Y(n358) );
  INVX8 U489 ( .A(n363), .Y(n364) );
  INVX8 U490 ( .A(n370), .Y(n372) );
  BUFX4 U491 ( .A(n378), .Y(n379) );
  INVX8 U492 ( .A(n380), .Y(n381) );
  INVX2 U493 ( .A(n84), .Y(n378) );
  INVX4 U494 ( .A(n93), .Y(r1_data[1]) );
  INVX2 U495 ( .A(n375), .Y(n377) );
  INVX1 U496 ( .A(n81), .Y(n390) );
  INVX4 U497 ( .A(n68), .Y(r1_data[0]) );
  INVX4 U498 ( .A(n75), .Y(n363) );
  INVX4 U499 ( .A(n331), .Y(r1_data[15]) );
  BUFX2 U500 ( .A(n58), .Y(n387) );
  INVX4 U501 ( .A(n387), .Y(n391) );
  INVX1 U502 ( .A(n387), .Y(n392) );
  INVX4 U503 ( .A(n127), .Y(r1_data[3]) );
  BUFX4 U504 ( .A(n378), .Y(n380) );
  INVX1 U505 ( .A(n380), .Y(n393) );
  INVX4 U506 ( .A(n144), .Y(r1_data[4]) );
  NAND3X1 U507 ( .A(N12), .B(n14), .C(n358), .Y(n394) );
  INVX4 U508 ( .A(n314), .Y(r1_data[14]) );
  INVX8 U509 ( .A(n379), .Y(n382) );
  AOI22X1 U510 ( .A(n398), .B(n397), .C(n396), .D(n395), .Y(n399) );
  INVX2 U511 ( .A(n399), .Y(r2_data[16]) );
  MUX2X1 U512 ( .B(n400), .A(n401), .S(n669), .Y(r2_data[0]) );
  NAND2X1 U513 ( .A(n402), .B(n403), .Y(n401) );
  NOR2X1 U514 ( .A(n404), .B(n405), .Y(n403) );
  OAI22X1 U515 ( .A(\regs_matrix[8][0] ), .B(n647), .C(\regs_matrix[10][0] ), 
        .D(n651), .Y(n405) );
  OAI22X1 U516 ( .A(\regs_matrix[12][0] ), .B(n654), .C(\regs_matrix[14][0] ), 
        .D(n659), .Y(n404) );
  NOR2X1 U517 ( .A(n409), .B(n410), .Y(n402) );
  OAI22X1 U518 ( .A(\regs_matrix[11][0] ), .B(n53), .C(\regs_matrix[9][0] ), 
        .D(n44), .Y(n410) );
  OAI22X1 U519 ( .A(\regs_matrix[13][0] ), .B(n665), .C(\regs_matrix[15][0] ), 
        .D(n666), .Y(n409) );
  NAND2X1 U520 ( .A(n412), .B(n413), .Y(n400) );
  NOR2X1 U521 ( .A(n414), .B(n415), .Y(n413) );
  OAI22X1 U522 ( .A(outreg_data[0]), .B(n647), .C(\regs_matrix[2][0] ), .D(
        n651), .Y(n415) );
  OAI22X1 U523 ( .A(\regs_matrix[4][0] ), .B(n654), .C(\regs_matrix[6][0] ), 
        .D(n659), .Y(n414) );
  NOR2X1 U524 ( .A(n417), .B(n416), .Y(n412) );
  OAI22X1 U525 ( .A(\regs_matrix[3][0] ), .B(n660), .C(\regs_matrix[1][0] ), 
        .D(n2), .Y(n417) );
  OAI22X1 U526 ( .A(\regs_matrix[5][0] ), .B(n665), .C(\regs_matrix[7][0] ), 
        .D(n49), .Y(n416) );
  MUX2X1 U527 ( .B(n418), .A(n419), .S(n670), .Y(r2_data[1]) );
  NAND2X1 U528 ( .A(n420), .B(n421), .Y(n419) );
  NOR2X1 U529 ( .A(n422), .B(n423), .Y(n421) );
  OAI22X1 U530 ( .A(\regs_matrix[8][1] ), .B(n647), .C(\regs_matrix[10][1] ), 
        .D(n651), .Y(n423) );
  OAI22X1 U531 ( .A(\regs_matrix[12][1] ), .B(n654), .C(\regs_matrix[14][1] ), 
        .D(n659), .Y(n422) );
  NOR2X1 U532 ( .A(n424), .B(n425), .Y(n420) );
  OAI22X1 U533 ( .A(\regs_matrix[11][1] ), .B(n54), .C(\regs_matrix[9][1] ), 
        .D(n44), .Y(n425) );
  OAI22X1 U534 ( .A(\regs_matrix[13][1] ), .B(n32), .C(\regs_matrix[15][1] ), 
        .D(n668), .Y(n424) );
  NAND2X1 U535 ( .A(n426), .B(n427), .Y(n418) );
  NOR2X1 U536 ( .A(n428), .B(n429), .Y(n427) );
  OAI22X1 U537 ( .A(outreg_data[1]), .B(n647), .C(\regs_matrix[2][1] ), .D(
        n651), .Y(n429) );
  OAI22X1 U538 ( .A(\regs_matrix[4][1] ), .B(n654), .C(\regs_matrix[6][1] ), 
        .D(n659), .Y(n428) );
  NOR2X1 U539 ( .A(n430), .B(n431), .Y(n426) );
  OAI22X1 U540 ( .A(\regs_matrix[3][1] ), .B(n660), .C(\regs_matrix[1][1] ), 
        .D(n43), .Y(n431) );
  OAI22X1 U541 ( .A(\regs_matrix[5][1] ), .B(n32), .C(\regs_matrix[7][1] ), 
        .D(n668), .Y(n430) );
  MUX2X1 U542 ( .B(n432), .A(n433), .S(n669), .Y(r2_data[2]) );
  NAND2X1 U543 ( .A(n434), .B(n435), .Y(n433) );
  NOR2X1 U544 ( .A(n436), .B(n437), .Y(n435) );
  OAI22X1 U545 ( .A(\regs_matrix[8][2] ), .B(n647), .C(\regs_matrix[10][2] ), 
        .D(n651), .Y(n437) );
  OAI22X1 U546 ( .A(\regs_matrix[12][2] ), .B(n654), .C(\regs_matrix[14][2] ), 
        .D(n659), .Y(n436) );
  NOR2X1 U547 ( .A(n438), .B(n439), .Y(n434) );
  OAI22X1 U548 ( .A(\regs_matrix[11][2] ), .B(n53), .C(\regs_matrix[9][2] ), 
        .D(n663), .Y(n439) );
  OAI22X1 U549 ( .A(\regs_matrix[13][2] ), .B(n32), .C(\regs_matrix[15][2] ), 
        .D(n49), .Y(n438) );
  NAND2X1 U550 ( .A(n440), .B(n441), .Y(n432) );
  NOR2X1 U551 ( .A(n442), .B(n443), .Y(n441) );
  OAI22X1 U552 ( .A(outreg_data[2]), .B(n647), .C(\regs_matrix[2][2] ), .D(
        n651), .Y(n443) );
  OAI22X1 U553 ( .A(\regs_matrix[4][2] ), .B(n654), .C(\regs_matrix[6][2] ), 
        .D(n659), .Y(n442) );
  NOR2X1 U554 ( .A(n444), .B(n445), .Y(n440) );
  OAI22X1 U555 ( .A(\regs_matrix[3][2] ), .B(n660), .C(\regs_matrix[1][2] ), 
        .D(n663), .Y(n445) );
  OAI22X1 U556 ( .A(\regs_matrix[5][2] ), .B(n32), .C(\regs_matrix[7][2] ), 
        .D(n20), .Y(n444) );
  MUX2X1 U557 ( .B(n446), .A(n447), .S(n670), .Y(r2_data[3]) );
  NAND2X1 U558 ( .A(n448), .B(n449), .Y(n447) );
  NOR2X1 U559 ( .A(n450), .B(n451), .Y(n449) );
  OAI22X1 U560 ( .A(\regs_matrix[8][3] ), .B(n647), .C(\regs_matrix[10][3] ), 
        .D(n651), .Y(n451) );
  OAI22X1 U561 ( .A(\regs_matrix[12][3] ), .B(n654), .C(\regs_matrix[14][3] ), 
        .D(n659), .Y(n450) );
  NOR2X1 U562 ( .A(n452), .B(n453), .Y(n448) );
  OAI22X1 U563 ( .A(\regs_matrix[11][3] ), .B(n53), .C(\regs_matrix[9][3] ), 
        .D(n44), .Y(n453) );
  OAI22X1 U564 ( .A(\regs_matrix[13][3] ), .B(n665), .C(\regs_matrix[15][3] ), 
        .D(n666), .Y(n452) );
  NAND2X1 U565 ( .A(n454), .B(n455), .Y(n446) );
  NOR2X1 U566 ( .A(n456), .B(n457), .Y(n455) );
  OAI22X1 U567 ( .A(outreg_data[3]), .B(n647), .C(\regs_matrix[2][3] ), .D(
        n651), .Y(n457) );
  OAI22X1 U568 ( .A(\regs_matrix[4][3] ), .B(n654), .C(\regs_matrix[6][3] ), 
        .D(n659), .Y(n456) );
  NOR2X1 U569 ( .A(n458), .B(n459), .Y(n454) );
  OAI22X1 U570 ( .A(\regs_matrix[3][3] ), .B(n54), .C(\regs_matrix[1][3] ), 
        .D(n2), .Y(n459) );
  OAI22X1 U571 ( .A(\regs_matrix[5][3] ), .B(n665), .C(\regs_matrix[7][3] ), 
        .D(n20), .Y(n458) );
  MUX2X1 U572 ( .B(n460), .A(n461), .S(n669), .Y(r2_data[4]) );
  NAND2X1 U573 ( .A(n462), .B(n463), .Y(n461) );
  NOR2X1 U574 ( .A(n464), .B(n465), .Y(n463) );
  OAI22X1 U575 ( .A(\regs_matrix[8][4] ), .B(n648), .C(\regs_matrix[10][4] ), 
        .D(n651), .Y(n465) );
  OAI22X1 U576 ( .A(\regs_matrix[12][4] ), .B(n655), .C(\regs_matrix[14][4] ), 
        .D(n659), .Y(n464) );
  NOR2X1 U577 ( .A(n466), .B(n467), .Y(n462) );
  OAI22X1 U578 ( .A(\regs_matrix[11][4] ), .B(n53), .C(\regs_matrix[9][4] ), 
        .D(n3), .Y(n467) );
  OAI22X1 U579 ( .A(\regs_matrix[13][4] ), .B(n32), .C(\regs_matrix[15][4] ), 
        .D(n20), .Y(n466) );
  NAND2X1 U580 ( .A(n468), .B(n469), .Y(n460) );
  NOR2X1 U581 ( .A(n470), .B(n471), .Y(n469) );
  OAI22X1 U582 ( .A(outreg_data[4]), .B(n648), .C(\regs_matrix[2][4] ), .D(
        n651), .Y(n471) );
  OAI22X1 U583 ( .A(\regs_matrix[4][4] ), .B(n655), .C(\regs_matrix[6][4] ), 
        .D(n659), .Y(n470) );
  NOR2X1 U584 ( .A(n472), .B(n473), .Y(n468) );
  OAI22X1 U585 ( .A(\regs_matrix[3][4] ), .B(n53), .C(\regs_matrix[1][4] ), 
        .D(n663), .Y(n473) );
  OAI22X1 U586 ( .A(\regs_matrix[5][4] ), .B(n32), .C(\regs_matrix[7][4] ), 
        .D(n667), .Y(n472) );
  MUX2X1 U587 ( .B(n474), .A(n475), .S(n670), .Y(r2_data[5]) );
  NAND2X1 U588 ( .A(n476), .B(n477), .Y(n475) );
  NOR2X1 U589 ( .A(n478), .B(n479), .Y(n477) );
  OAI22X1 U590 ( .A(\regs_matrix[8][5] ), .B(n648), .C(\regs_matrix[10][5] ), 
        .D(n652), .Y(n479) );
  OAI22X1 U591 ( .A(\regs_matrix[12][5] ), .B(n655), .C(\regs_matrix[14][5] ), 
        .D(n659), .Y(n478) );
  NOR2X1 U592 ( .A(n480), .B(n481), .Y(n476) );
  OAI22X1 U593 ( .A(\regs_matrix[11][5] ), .B(n54), .C(\regs_matrix[9][5] ), 
        .D(n3), .Y(n481) );
  OAI22X1 U594 ( .A(\regs_matrix[13][5] ), .B(n32), .C(\regs_matrix[15][5] ), 
        .D(n20), .Y(n480) );
  NAND2X1 U595 ( .A(n482), .B(n483), .Y(n474) );
  NOR2X1 U596 ( .A(n484), .B(n485), .Y(n483) );
  OAI22X1 U597 ( .A(outreg_data[5]), .B(n648), .C(\regs_matrix[2][5] ), .D(
        n651), .Y(n485) );
  OAI22X1 U598 ( .A(\regs_matrix[4][5] ), .B(n655), .C(\regs_matrix[6][5] ), 
        .D(n659), .Y(n484) );
  NOR2X1 U599 ( .A(n486), .B(n487), .Y(n482) );
  OAI22X1 U600 ( .A(\regs_matrix[3][5] ), .B(n660), .C(\regs_matrix[1][5] ), 
        .D(n663), .Y(n487) );
  OAI22X1 U601 ( .A(\regs_matrix[5][5] ), .B(n665), .C(\regs_matrix[7][5] ), 
        .D(n668), .Y(n486) );
  MUX2X1 U602 ( .B(n488), .A(n489), .S(n669), .Y(r2_data[6]) );
  NAND2X1 U603 ( .A(n490), .B(n491), .Y(n489) );
  NOR2X1 U604 ( .A(n492), .B(n493), .Y(n491) );
  OAI22X1 U605 ( .A(\regs_matrix[8][6] ), .B(n648), .C(\regs_matrix[10][6] ), 
        .D(n652), .Y(n493) );
  OAI22X1 U606 ( .A(\regs_matrix[12][6] ), .B(n655), .C(\regs_matrix[14][6] ), 
        .D(n659), .Y(n492) );
  NOR2X1 U607 ( .A(n494), .B(n495), .Y(n490) );
  OAI22X1 U608 ( .A(\regs_matrix[11][6] ), .B(n54), .C(\regs_matrix[9][6] ), 
        .D(n663), .Y(n495) );
  OAI22X1 U609 ( .A(\regs_matrix[13][6] ), .B(n665), .C(\regs_matrix[15][6] ), 
        .D(n667), .Y(n494) );
  NAND2X1 U610 ( .A(n496), .B(n497), .Y(n488) );
  NOR2X1 U611 ( .A(n498), .B(n499), .Y(n497) );
  OAI22X1 U612 ( .A(outreg_data[6]), .B(n648), .C(\regs_matrix[2][6] ), .D(
        n651), .Y(n499) );
  OAI22X1 U613 ( .A(\regs_matrix[4][6] ), .B(n655), .C(\regs_matrix[6][6] ), 
        .D(n659), .Y(n498) );
  NOR2X1 U614 ( .A(n500), .B(n501), .Y(n496) );
  OAI22X1 U615 ( .A(\regs_matrix[3][6] ), .B(n54), .C(\regs_matrix[1][6] ), 
        .D(n43), .Y(n501) );
  OAI22X1 U616 ( .A(\regs_matrix[5][6] ), .B(n32), .C(\regs_matrix[7][6] ), 
        .D(n49), .Y(n500) );
  MUX2X1 U617 ( .B(n502), .A(n503), .S(n670), .Y(r2_data[7]) );
  NAND2X1 U618 ( .A(n504), .B(n505), .Y(n503) );
  NOR2X1 U619 ( .A(n506), .B(n507), .Y(n505) );
  OAI22X1 U620 ( .A(\regs_matrix[8][7] ), .B(n648), .C(\regs_matrix[10][7] ), 
        .D(n652), .Y(n507) );
  OAI22X1 U621 ( .A(\regs_matrix[12][7] ), .B(n655), .C(\regs_matrix[14][7] ), 
        .D(n659), .Y(n506) );
  NOR2X1 U622 ( .A(n508), .B(n509), .Y(n504) );
  OAI22X1 U623 ( .A(\regs_matrix[11][7] ), .B(n53), .C(\regs_matrix[9][7] ), 
        .D(n3), .Y(n509) );
  OAI22X1 U624 ( .A(\regs_matrix[13][7] ), .B(n665), .C(\regs_matrix[15][7] ), 
        .D(n668), .Y(n508) );
  NAND2X1 U625 ( .A(n510), .B(n511), .Y(n502) );
  NOR2X1 U626 ( .A(n512), .B(n513), .Y(n511) );
  OAI22X1 U627 ( .A(outreg_data[7]), .B(n648), .C(\regs_matrix[2][7] ), .D(
        n651), .Y(n513) );
  OAI22X1 U628 ( .A(\regs_matrix[4][7] ), .B(n655), .C(\regs_matrix[6][7] ), 
        .D(n659), .Y(n512) );
  NOR2X1 U629 ( .A(n514), .B(n515), .Y(n510) );
  OAI22X1 U630 ( .A(\regs_matrix[3][7] ), .B(n54), .C(\regs_matrix[1][7] ), 
        .D(n663), .Y(n515) );
  OAI22X1 U631 ( .A(\regs_matrix[5][7] ), .B(n32), .C(\regs_matrix[7][7] ), 
        .D(n666), .Y(n514) );
  MUX2X1 U632 ( .B(n516), .A(n517), .S(n669), .Y(r2_data[8]) );
  NAND2X1 U633 ( .A(n518), .B(n519), .Y(n517) );
  NOR2X1 U634 ( .A(n520), .B(n521), .Y(n519) );
  OAI22X1 U635 ( .A(\regs_matrix[8][8] ), .B(n648), .C(\regs_matrix[10][8] ), 
        .D(n651), .Y(n521) );
  OAI22X1 U636 ( .A(\regs_matrix[12][8] ), .B(n655), .C(\regs_matrix[14][8] ), 
        .D(n659), .Y(n520) );
  NOR2X1 U637 ( .A(n522), .B(n523), .Y(n518) );
  OAI22X1 U638 ( .A(\regs_matrix[11][8] ), .B(n53), .C(\regs_matrix[9][8] ), 
        .D(n3), .Y(n523) );
  OAI22X1 U639 ( .A(\regs_matrix[13][8] ), .B(n32), .C(\regs_matrix[15][8] ), 
        .D(n20), .Y(n522) );
  NAND2X1 U640 ( .A(n524), .B(n525), .Y(n516) );
  NOR2X1 U641 ( .A(n526), .B(n527), .Y(n525) );
  OAI22X1 U642 ( .A(outreg_data[8]), .B(n648), .C(\regs_matrix[2][8] ), .D(
        n651), .Y(n527) );
  OAI22X1 U643 ( .A(\regs_matrix[4][8] ), .B(n655), .C(\regs_matrix[6][8] ), 
        .D(n659), .Y(n526) );
  NOR2X1 U644 ( .A(n528), .B(n529), .Y(n524) );
  OAI22X1 U645 ( .A(\regs_matrix[3][8] ), .B(n54), .C(\regs_matrix[1][8] ), 
        .D(n663), .Y(n529) );
  OAI22X1 U646 ( .A(\regs_matrix[5][8] ), .B(n32), .C(\regs_matrix[7][8] ), 
        .D(n1), .Y(n528) );
  MUX2X1 U647 ( .B(n530), .A(n531), .S(n670), .Y(r2_data[9]) );
  NAND2X1 U648 ( .A(n532), .B(n533), .Y(n531) );
  NOR2X1 U649 ( .A(n534), .B(n535), .Y(n533) );
  OAI22X1 U650 ( .A(\regs_matrix[8][9] ), .B(n648), .C(\regs_matrix[10][9] ), 
        .D(n652), .Y(n535) );
  OAI22X1 U651 ( .A(\regs_matrix[12][9] ), .B(n655), .C(\regs_matrix[14][9] ), 
        .D(n659), .Y(n534) );
  NOR2X1 U652 ( .A(n536), .B(n537), .Y(n532) );
  OAI22X1 U653 ( .A(\regs_matrix[11][9] ), .B(n54), .C(\regs_matrix[9][9] ), 
        .D(n43), .Y(n537) );
  OAI22X1 U654 ( .A(\regs_matrix[13][9] ), .B(n32), .C(\regs_matrix[15][9] ), 
        .D(n49), .Y(n536) );
  NAND2X1 U655 ( .A(n538), .B(n539), .Y(n530) );
  NOR2X1 U656 ( .A(n540), .B(n541), .Y(n539) );
  OAI22X1 U657 ( .A(outreg_data[9]), .B(n648), .C(\regs_matrix[2][9] ), .D(
        n651), .Y(n541) );
  OAI22X1 U658 ( .A(\regs_matrix[4][9] ), .B(n655), .C(\regs_matrix[6][9] ), 
        .D(n659), .Y(n540) );
  NOR2X1 U659 ( .A(n542), .B(n543), .Y(n538) );
  OAI22X1 U660 ( .A(\regs_matrix[3][9] ), .B(n660), .C(\regs_matrix[1][9] ), 
        .D(n44), .Y(n543) );
  OAI22X1 U661 ( .A(\regs_matrix[5][9] ), .B(n32), .C(\regs_matrix[7][9] ), 
        .D(n666), .Y(n542) );
  MUX2X1 U662 ( .B(n544), .A(n545), .S(n669), .Y(r2_data[10]) );
  NAND2X1 U663 ( .A(n546), .B(n547), .Y(n545) );
  NOR2X1 U664 ( .A(n548), .B(n549), .Y(n547) );
  OAI22X1 U665 ( .A(\regs_matrix[8][10] ), .B(n647), .C(\regs_matrix[10][10] ), 
        .D(n652), .Y(n549) );
  OAI22X1 U666 ( .A(\regs_matrix[12][10] ), .B(n655), .C(\regs_matrix[14][10] ), .D(n659), .Y(n548) );
  NOR2X1 U667 ( .A(n550), .B(n551), .Y(n546) );
  OAI22X1 U668 ( .A(\regs_matrix[11][10] ), .B(n660), .C(\regs_matrix[9][10] ), 
        .D(n44), .Y(n551) );
  OAI22X1 U669 ( .A(\regs_matrix[13][10] ), .B(n32), .C(\regs_matrix[15][10] ), 
        .D(n1), .Y(n550) );
  NAND2X1 U670 ( .A(n552), .B(n553), .Y(n544) );
  NOR2X1 U671 ( .A(n554), .B(n555), .Y(n553) );
  OAI22X1 U672 ( .A(outreg_data[10]), .B(n648), .C(\regs_matrix[2][10] ), .D(
        n652), .Y(n555) );
  OAI22X1 U673 ( .A(\regs_matrix[4][10] ), .B(n656), .C(\regs_matrix[6][10] ), 
        .D(n659), .Y(n554) );
  NOR2X1 U674 ( .A(n556), .B(n557), .Y(n552) );
  OAI22X1 U675 ( .A(\regs_matrix[3][10] ), .B(n54), .C(\regs_matrix[1][10] ), 
        .D(n43), .Y(n557) );
  OAI22X1 U676 ( .A(\regs_matrix[5][10] ), .B(n665), .C(\regs_matrix[7][10] ), 
        .D(n49), .Y(n556) );
  MUX2X1 U677 ( .B(n558), .A(n559), .S(n670), .Y(r2_data[11]) );
  NAND2X1 U678 ( .A(n560), .B(n561), .Y(n559) );
  NOR2X1 U679 ( .A(n562), .B(n563), .Y(n561) );
  OAI22X1 U680 ( .A(\regs_matrix[8][11] ), .B(n647), .C(\regs_matrix[10][11] ), 
        .D(n652), .Y(n563) );
  OAI22X1 U681 ( .A(\regs_matrix[12][11] ), .B(n656), .C(\regs_matrix[14][11] ), .D(n659), .Y(n562) );
  NOR2X1 U682 ( .A(n564), .B(n565), .Y(n560) );
  OAI22X1 U683 ( .A(\regs_matrix[11][11] ), .B(n53), .C(\regs_matrix[9][11] ), 
        .D(n44), .Y(n565) );
  OAI22X1 U684 ( .A(\regs_matrix[13][11] ), .B(n32), .C(\regs_matrix[15][11] ), 
        .D(n668), .Y(n564) );
  NAND2X1 U685 ( .A(n567), .B(n566), .Y(n558) );
  NOR2X1 U686 ( .A(n568), .B(n569), .Y(n567) );
  OAI22X1 U687 ( .A(outreg_data[11]), .B(n647), .C(\regs_matrix[2][11] ), .D(
        n652), .Y(n569) );
  OAI22X1 U688 ( .A(\regs_matrix[4][11] ), .B(n656), .C(\regs_matrix[6][11] ), 
        .D(n658), .Y(n568) );
  NOR2X1 U689 ( .A(n570), .B(n571), .Y(n566) );
  OAI22X1 U690 ( .A(\regs_matrix[3][11] ), .B(n660), .C(\regs_matrix[1][11] ), 
        .D(n43), .Y(n571) );
  OAI22X1 U691 ( .A(\regs_matrix[5][11] ), .B(n665), .C(\regs_matrix[7][11] ), 
        .D(n1), .Y(n570) );
  MUX2X1 U692 ( .B(n572), .A(n573), .S(n669), .Y(r2_data[12]) );
  NAND2X1 U693 ( .A(n574), .B(n575), .Y(n573) );
  NOR2X1 U694 ( .A(n576), .B(n577), .Y(n575) );
  OAI22X1 U695 ( .A(\regs_matrix[8][12] ), .B(n647), .C(\regs_matrix[10][12] ), 
        .D(n652), .Y(n577) );
  OAI22X1 U696 ( .A(\regs_matrix[12][12] ), .B(n656), .C(\regs_matrix[14][12] ), .D(n658), .Y(n576) );
  NOR2X1 U697 ( .A(n578), .B(n579), .Y(n574) );
  OAI22X1 U698 ( .A(\regs_matrix[11][12] ), .B(n660), .C(\regs_matrix[9][12] ), 
        .D(n3), .Y(n579) );
  OAI22X1 U699 ( .A(\regs_matrix[13][12] ), .B(n32), .C(\regs_matrix[15][12] ), 
        .D(n666), .Y(n578) );
  NAND2X1 U700 ( .A(n580), .B(n581), .Y(n572) );
  NOR2X1 U701 ( .A(n582), .B(n583), .Y(n581) );
  OAI22X1 U702 ( .A(outreg_data[12]), .B(n648), .C(\regs_matrix[2][12] ), .D(
        n652), .Y(n583) );
  OAI22X1 U703 ( .A(\regs_matrix[4][12] ), .B(n656), .C(\regs_matrix[6][12] ), 
        .D(n658), .Y(n582) );
  NOR2X1 U704 ( .A(n584), .B(n585), .Y(n580) );
  OAI22X1 U705 ( .A(\regs_matrix[3][12] ), .B(n54), .C(\regs_matrix[1][12] ), 
        .D(n44), .Y(n585) );
  OAI22X1 U706 ( .A(\regs_matrix[5][12] ), .B(n32), .C(\regs_matrix[7][12] ), 
        .D(n667), .Y(n584) );
  MUX2X1 U707 ( .B(n586), .A(n587), .S(n670), .Y(r2_data[13]) );
  NAND2X1 U708 ( .A(n588), .B(n589), .Y(n587) );
  NOR2X1 U709 ( .A(n590), .B(n591), .Y(n589) );
  OAI22X1 U710 ( .A(\regs_matrix[8][13] ), .B(n647), .C(\regs_matrix[10][13] ), 
        .D(n652), .Y(n591) );
  OAI22X1 U711 ( .A(\regs_matrix[12][13] ), .B(n656), .C(\regs_matrix[14][13] ), .D(n658), .Y(n590) );
  NOR2X1 U712 ( .A(n592), .B(n593), .Y(n588) );
  OAI22X1 U713 ( .A(\regs_matrix[11][13] ), .B(n660), .C(\regs_matrix[9][13] ), 
        .D(n663), .Y(n593) );
  OAI22X1 U714 ( .A(\regs_matrix[13][13] ), .B(n32), .C(\regs_matrix[15][13] ), 
        .D(n667), .Y(n592) );
  NAND2X1 U715 ( .A(n594), .B(n595), .Y(n586) );
  NOR2X1 U716 ( .A(n596), .B(n597), .Y(n595) );
  OAI22X1 U717 ( .A(outreg_data[13]), .B(n647), .C(\regs_matrix[2][13] ), .D(
        n652), .Y(n597) );
  OAI22X1 U718 ( .A(\regs_matrix[4][13] ), .B(n656), .C(\regs_matrix[6][13] ), 
        .D(n658), .Y(n596) );
  NOR2X1 U719 ( .A(n598), .B(n599), .Y(n594) );
  OAI22X1 U720 ( .A(\regs_matrix[3][13] ), .B(n53), .C(\regs_matrix[1][13] ), 
        .D(n663), .Y(n599) );
  OAI22X1 U721 ( .A(\regs_matrix[5][13] ), .B(n32), .C(\regs_matrix[7][13] ), 
        .D(n667), .Y(n598) );
  MUX2X1 U722 ( .B(n600), .A(n601), .S(n669), .Y(r2_data[14]) );
  NAND2X1 U723 ( .A(n602), .B(n603), .Y(n601) );
  NOR2X1 U724 ( .A(n604), .B(n605), .Y(n603) );
  OAI22X1 U725 ( .A(\regs_matrix[8][14] ), .B(n648), .C(\regs_matrix[10][14] ), 
        .D(n652), .Y(n605) );
  OAI22X1 U726 ( .A(\regs_matrix[12][14] ), .B(n656), .C(\regs_matrix[14][14] ), .D(n658), .Y(n604) );
  NOR2X1 U727 ( .A(n606), .B(n607), .Y(n602) );
  OAI22X1 U728 ( .A(\regs_matrix[11][14] ), .B(n53), .C(\regs_matrix[9][14] ), 
        .D(n3), .Y(n607) );
  OAI22X1 U729 ( .A(\regs_matrix[13][14] ), .B(n32), .C(\regs_matrix[15][14] ), 
        .D(n667), .Y(n606) );
  NAND2X1 U730 ( .A(n608), .B(n609), .Y(n600) );
  NOR2X1 U731 ( .A(n610), .B(n611), .Y(n609) );
  OAI22X1 U732 ( .A(outreg_data[14]), .B(n648), .C(\regs_matrix[2][14] ), .D(
        n652), .Y(n611) );
  OAI22X1 U733 ( .A(\regs_matrix[4][14] ), .B(n656), .C(\regs_matrix[6][14] ), 
        .D(n658), .Y(n610) );
  NOR2X1 U734 ( .A(n612), .B(n613), .Y(n608) );
  OAI22X1 U735 ( .A(\regs_matrix[3][14] ), .B(n660), .C(\regs_matrix[1][14] ), 
        .D(n43), .Y(n613) );
  OAI22X1 U736 ( .A(\regs_matrix[5][14] ), .B(n32), .C(\regs_matrix[7][14] ), 
        .D(n668), .Y(n612) );
  NAND2X1 U737 ( .A(n617), .B(n616), .Y(n615) );
  NOR2X1 U738 ( .A(n618), .B(n619), .Y(n617) );
  OAI22X1 U739 ( .A(\regs_matrix[8][15] ), .B(n648), .C(\regs_matrix[10][15] ), 
        .D(n652), .Y(n619) );
  OAI22X1 U740 ( .A(\regs_matrix[12][15] ), .B(n656), .C(\regs_matrix[14][15] ), .D(n658), .Y(n618) );
  NOR2X1 U741 ( .A(n621), .B(n620), .Y(n616) );
  OAI22X1 U742 ( .A(\regs_matrix[11][15] ), .B(n53), .C(\regs_matrix[9][15] ), 
        .D(n2), .Y(n621) );
  OAI22X1 U743 ( .A(\regs_matrix[13][15] ), .B(n665), .C(\regs_matrix[15][15] ), .D(n49), .Y(n620) );
  NAND2X1 U744 ( .A(n622), .B(n623), .Y(n614) );
  NOR2X1 U745 ( .A(n624), .B(n625), .Y(n623) );
  OAI22X1 U746 ( .A(outreg_data[15]), .B(n647), .C(\regs_matrix[2][15] ), .D(
        n652), .Y(n625) );
  OAI22X1 U747 ( .A(\regs_matrix[4][15] ), .B(n656), .C(\regs_matrix[6][15] ), 
        .D(n658), .Y(n624) );
  NOR2X1 U748 ( .A(n626), .B(n627), .Y(n622) );
  OAI22X1 U749 ( .A(\regs_matrix[3][15] ), .B(n660), .C(\regs_matrix[1][15] ), 
        .D(n43), .Y(n627) );
  OAI22X1 U750 ( .A(\regs_matrix[5][15] ), .B(n32), .C(\regs_matrix[7][15] ), 
        .D(n1), .Y(n626) );
  NOR2X1 U751 ( .A(n628), .B(n629), .Y(n395) );
  OAI21X1 U752 ( .A(\regs_matrix[6][16] ), .B(n658), .C(n630), .Y(n629) );
  AOI22X1 U753 ( .A(n650), .B(n352), .C(n646), .D(n631), .Y(n630) );
  INVX2 U754 ( .A(outreg_data[16]), .Y(n631) );
  OAI21X1 U755 ( .A(\regs_matrix[4][16] ), .B(n656), .C(n671), .Y(n628) );
  NOR2X1 U756 ( .A(n632), .B(n633), .Y(n396) );
  OAI22X1 U757 ( .A(\regs_matrix[3][16] ), .B(n660), .C(\regs_matrix[1][16] ), 
        .D(n43), .Y(n633) );
  OAI22X1 U758 ( .A(\regs_matrix[5][16] ), .B(n665), .C(\regs_matrix[7][16] ), 
        .D(n1), .Y(n632) );
  NOR2X1 U759 ( .A(n634), .B(n635), .Y(n397) );
  OAI21X1 U760 ( .A(\regs_matrix[12][16] ), .B(n656), .C(n636), .Y(n635) );
  AOI22X1 U761 ( .A(n650), .B(n637), .C(n646), .D(n638), .Y(n636) );
  INVX2 U762 ( .A(\regs_matrix[8][16] ), .Y(n638) );
  NAND3X1 U763 ( .A(n641), .B(n640), .C(n639), .Y(n406) );
  INVX2 U764 ( .A(\regs_matrix[10][16] ), .Y(n637) );
  NAND3X1 U765 ( .A(N16), .B(n639), .C(n641), .Y(n407) );
  OAI22X1 U766 ( .A(\regs_matrix[9][16] ), .B(n44), .C(\regs_matrix[14][16] ), 
        .D(n659), .Y(n634) );
  NAND3X1 U767 ( .A(N16), .B(N15), .C(n641), .Y(n408) );
  NAND3X1 U768 ( .A(N14), .B(n640), .C(n639), .Y(n411) );
  NOR2X1 U769 ( .A(n642), .B(n643), .Y(n398) );
  OAI21X1 U770 ( .A(\regs_matrix[11][16] ), .B(n54), .C(n669), .Y(n643) );
  OAI22X1 U771 ( .A(\regs_matrix[15][16] ), .B(n666), .C(\regs_matrix[13][16] ), .D(n32), .Y(n642) );
  INVX2 U772 ( .A(N15), .Y(n639) );
  INVX1 U773 ( .A(N14), .Y(n641) );
  INVX2 U774 ( .A(n406), .Y(n644) );
  INVX4 U775 ( .A(w_data[15]), .Y(n715) );
  INVX4 U776 ( .A(w_data[13]), .Y(n709) );
  INVX2 U777 ( .A(w_en), .Y(n726) );
  INVX2 U778 ( .A(w_sel[3]), .Y(n727) );
  INVX2 U779 ( .A(w_sel[1]), .Y(n728) );
  INVX2 U780 ( .A(w_sel[2]), .Y(n729) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data(src1_data), .src2_data(src2_data), .alu_op(alu_op), 
        .result(alu_result), .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data(dest_data), .r1_data(src1_data), 
        .r2_data(src2_data), .outreg_data(outreg_data) );
  INVX2 U2 ( .A(w_data_sel[1]), .Y(n36) );
  AND2X2 U3 ( .A(n36), .B(n3), .Y(n1) );
  AND2X2 U4 ( .A(w_data_sel[0]), .B(n36), .Y(n2) );
  AND2X2 U5 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  INVX2 U6 ( .A(alu_result[15]), .Y(n5) );
  INVX2 U7 ( .A(w_data_sel[0]), .Y(n3) );
  AOI22X1 U8 ( .A(ext_data2[15]), .B(n2), .C(ext_data1[15]), .D(n1), .Y(n4) );
  OAI21X1 U9 ( .A(n36), .B(n5), .C(n4), .Y(dest_data[15]) );
  INVX2 U10 ( .A(alu_result[14]), .Y(n7) );
  AOI22X1 U11 ( .A(ext_data2[14]), .B(n2), .C(ext_data1[14]), .D(n1), .Y(n6)
         );
  OAI21X1 U12 ( .A(n36), .B(n7), .C(n6), .Y(dest_data[14]) );
  INVX2 U13 ( .A(alu_result[13]), .Y(n9) );
  AOI22X1 U14 ( .A(ext_data2[13]), .B(n2), .C(ext_data1[13]), .D(n1), .Y(n8)
         );
  OAI21X1 U15 ( .A(n36), .B(n9), .C(n8), .Y(dest_data[13]) );
  INVX2 U16 ( .A(alu_result[12]), .Y(n11) );
  AOI22X1 U17 ( .A(ext_data2[12]), .B(n2), .C(ext_data1[12]), .D(n1), .Y(n10)
         );
  OAI21X1 U18 ( .A(n36), .B(n11), .C(n10), .Y(dest_data[12]) );
  INVX2 U19 ( .A(alu_result[11]), .Y(n13) );
  AOI22X1 U20 ( .A(ext_data2[11]), .B(n2), .C(ext_data1[11]), .D(n1), .Y(n12)
         );
  OAI21X1 U21 ( .A(n36), .B(n13), .C(n12), .Y(dest_data[11]) );
  INVX2 U22 ( .A(alu_result[10]), .Y(n15) );
  AOI22X1 U23 ( .A(ext_data2[10]), .B(n2), .C(ext_data1[10]), .D(n1), .Y(n14)
         );
  OAI21X1 U24 ( .A(n36), .B(n15), .C(n14), .Y(dest_data[10]) );
  INVX2 U25 ( .A(alu_result[9]), .Y(n17) );
  AOI22X1 U26 ( .A(ext_data2[9]), .B(n2), .C(ext_data1[9]), .D(n1), .Y(n16) );
  OAI21X1 U27 ( .A(n36), .B(n17), .C(n16), .Y(dest_data[9]) );
  INVX2 U28 ( .A(alu_result[8]), .Y(n19) );
  AOI22X1 U29 ( .A(ext_data2[8]), .B(n2), .C(ext_data1[8]), .D(n1), .Y(n18) );
  OAI21X1 U30 ( .A(n36), .B(n19), .C(n18), .Y(dest_data[8]) );
  INVX2 U31 ( .A(alu_result[7]), .Y(n21) );
  AOI22X1 U32 ( .A(ext_data2[7]), .B(n2), .C(ext_data1[7]), .D(n1), .Y(n20) );
  OAI21X1 U33 ( .A(n36), .B(n21), .C(n20), .Y(dest_data[7]) );
  INVX2 U34 ( .A(alu_result[6]), .Y(n23) );
  AOI22X1 U35 ( .A(ext_data2[6]), .B(n2), .C(ext_data1[6]), .D(n1), .Y(n22) );
  OAI21X1 U36 ( .A(n36), .B(n23), .C(n22), .Y(dest_data[6]) );
  INVX2 U37 ( .A(alu_result[5]), .Y(n25) );
  AOI22X1 U38 ( .A(ext_data2[5]), .B(n2), .C(ext_data1[5]), .D(n1), .Y(n24) );
  OAI21X1 U39 ( .A(n36), .B(n25), .C(n24), .Y(dest_data[5]) );
  INVX2 U40 ( .A(alu_result[4]), .Y(n27) );
  AOI22X1 U41 ( .A(ext_data2[4]), .B(n2), .C(ext_data1[4]), .D(n1), .Y(n26) );
  OAI21X1 U42 ( .A(n36), .B(n27), .C(n26), .Y(dest_data[4]) );
  INVX2 U43 ( .A(alu_result[3]), .Y(n29) );
  AOI22X1 U44 ( .A(ext_data2[3]), .B(n2), .C(ext_data1[3]), .D(n1), .Y(n28) );
  OAI21X1 U45 ( .A(n36), .B(n29), .C(n28), .Y(dest_data[3]) );
  INVX2 U46 ( .A(alu_result[2]), .Y(n31) );
  AOI22X1 U47 ( .A(ext_data2[2]), .B(n2), .C(ext_data1[2]), .D(n1), .Y(n30) );
  OAI21X1 U48 ( .A(n36), .B(n31), .C(n30), .Y(dest_data[2]) );
  INVX2 U49 ( .A(alu_result[1]), .Y(n33) );
  AOI22X1 U50 ( .A(ext_data2[1]), .B(n2), .C(ext_data1[1]), .D(n1), .Y(n32) );
  OAI21X1 U51 ( .A(n36), .B(n33), .C(n32), .Y(dest_data[1]) );
  INVX2 U52 ( .A(alu_result[0]), .Y(n35) );
  AOI22X1 U53 ( .A(ext_data2[0]), .B(n2), .C(ext_data1[0]), .D(n1), .Y(n34) );
  OAI21X1 U54 ( .A(n36), .B(n35), .C(n34), .Y(dest_data[0]) );
endmodule


module magnitude_DW01_dec_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;
  wire   n1, n2, n3, n5, n7, n9, n11, n13, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;

  INVX2 U1 ( .A(A[13]), .Y(n1) );
  INVX2 U2 ( .A(n32), .Y(n2) );
  INVX2 U3 ( .A(A[12]), .Y(n3) );
  INVX2 U4 ( .A(n34), .Y(SUM[11]) );
  INVX2 U5 ( .A(A[10]), .Y(n5) );
  INVX2 U6 ( .A(n16), .Y(SUM[9]) );
  INVX2 U7 ( .A(A[8]), .Y(n7) );
  INVX2 U8 ( .A(n20), .Y(SUM[7]) );
  INVX2 U9 ( .A(A[6]), .Y(n9) );
  INVX2 U10 ( .A(n23), .Y(SUM[5]) );
  INVX2 U11 ( .A(A[4]), .Y(n11) );
  INVX2 U12 ( .A(n26), .Y(SUM[3]) );
  INVX2 U13 ( .A(A[2]), .Y(n13) );
  INVX2 U14 ( .A(n29), .Y(SUM[1]) );
  INVX2 U15 ( .A(A[0]), .Y(SUM[0]) );
  AOI21X1 U16 ( .A(n17), .B(A[9]), .C(n18), .Y(n16) );
  OAI21X1 U17 ( .A(n19), .B(n7), .C(n17), .Y(SUM[8]) );
  AOI21X1 U18 ( .A(n21), .B(A[7]), .C(n19), .Y(n20) );
  OAI21X1 U19 ( .A(n22), .B(n9), .C(n21), .Y(SUM[6]) );
  AOI21X1 U20 ( .A(n24), .B(A[5]), .C(n22), .Y(n23) );
  OAI21X1 U21 ( .A(n25), .B(n11), .C(n24), .Y(SUM[4]) );
  AOI21X1 U22 ( .A(n27), .B(A[3]), .C(n25), .Y(n26) );
  OAI21X1 U23 ( .A(n28), .B(n13), .C(n27), .Y(SUM[2]) );
  AOI21X1 U24 ( .A(A[0]), .B(A[1]), .C(n28), .Y(n29) );
  XOR2X1 U25 ( .A(A[15]), .B(n30), .Y(SUM[15]) );
  NOR2X1 U26 ( .A(A[14]), .B(n31), .Y(n30) );
  XNOR2X1 U27 ( .A(A[14]), .B(n31), .Y(SUM[14]) );
  OAI21X1 U28 ( .A(n2), .B(n1), .C(n31), .Y(SUM[13]) );
  NAND2X1 U29 ( .A(n2), .B(n1), .Y(n31) );
  OAI21X1 U30 ( .A(n33), .B(n3), .C(n32), .Y(SUM[12]) );
  NAND2X1 U31 ( .A(n33), .B(n3), .Y(n32) );
  AOI21X1 U32 ( .A(n35), .B(A[11]), .C(n33), .Y(n34) );
  NOR2X1 U33 ( .A(n35), .B(A[11]), .Y(n33) );
  OAI21X1 U34 ( .A(n18), .B(n5), .C(n35), .Y(SUM[10]) );
  NAND2X1 U35 ( .A(n18), .B(n5), .Y(n35) );
  NOR2X1 U36 ( .A(n17), .B(A[9]), .Y(n18) );
  NAND2X1 U37 ( .A(n19), .B(n7), .Y(n17) );
  NOR2X1 U38 ( .A(n21), .B(A[7]), .Y(n19) );
  NAND2X1 U39 ( .A(n22), .B(n9), .Y(n21) );
  NOR2X1 U40 ( .A(n24), .B(A[5]), .Y(n22) );
  NAND2X1 U41 ( .A(n25), .B(n11), .Y(n24) );
  NOR2X1 U42 ( .A(n27), .B(A[3]), .Y(n25) );
  NAND2X1 U43 ( .A(n28), .B(n13), .Y(n27) );
  NOR2X1 U44 ( .A(A[1]), .B(A[0]), .Y(n28) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n1;

  OAI21X1 U3 ( .A(N11), .B(n1), .C(n2), .Y(out[9]) );
  NAND2X1 U4 ( .A(in[9]), .B(n1), .Y(n2) );
  OAI21X1 U5 ( .A(N10), .B(n1), .C(n3), .Y(out[8]) );
  NAND2X1 U6 ( .A(in[8]), .B(n1), .Y(n3) );
  OAI21X1 U7 ( .A(N9), .B(n1), .C(n4), .Y(out[7]) );
  NAND2X1 U8 ( .A(in[7]), .B(n1), .Y(n4) );
  OAI21X1 U9 ( .A(N8), .B(n1), .C(n5), .Y(out[6]) );
  NAND2X1 U10 ( .A(in[6]), .B(n1), .Y(n5) );
  OAI21X1 U11 ( .A(N7), .B(n1), .C(n6), .Y(out[5]) );
  NAND2X1 U12 ( .A(in[5]), .B(n1), .Y(n6) );
  OAI21X1 U13 ( .A(N6), .B(n1), .C(n7), .Y(out[4]) );
  NAND2X1 U14 ( .A(in[4]), .B(n1), .Y(n7) );
  OAI21X1 U15 ( .A(N5), .B(n1), .C(n8), .Y(out[3]) );
  NAND2X1 U16 ( .A(in[3]), .B(n1), .Y(n8) );
  OAI21X1 U17 ( .A(N4), .B(n1), .C(n9), .Y(out[2]) );
  NAND2X1 U18 ( .A(in[2]), .B(n1), .Y(n9) );
  OAI21X1 U19 ( .A(N3), .B(n1), .C(n10), .Y(out[1]) );
  NAND2X1 U20 ( .A(in[1]), .B(n1), .Y(n10) );
  OAI21X1 U21 ( .A(N17), .B(n1), .C(n11), .Y(out[15]) );
  NAND2X1 U22 ( .A(in[15]), .B(n1), .Y(n11) );
  OAI21X1 U23 ( .A(N16), .B(n1), .C(n12), .Y(out[14]) );
  NAND2X1 U24 ( .A(in[14]), .B(n1), .Y(n12) );
  OAI21X1 U25 ( .A(N15), .B(n1), .C(n13), .Y(out[13]) );
  NAND2X1 U26 ( .A(in[13]), .B(n1), .Y(n13) );
  OAI21X1 U27 ( .A(N14), .B(n1), .C(n14), .Y(out[12]) );
  NAND2X1 U28 ( .A(in[12]), .B(n1), .Y(n14) );
  OAI21X1 U29 ( .A(N13), .B(n1), .C(n15), .Y(out[11]) );
  NAND2X1 U30 ( .A(in[11]), .B(n1), .Y(n15) );
  OAI21X1 U31 ( .A(N12), .B(n1), .C(n16), .Y(out[10]) );
  NAND2X1 U32 ( .A(in[10]), .B(n1), .Y(n16) );
  OAI21X1 U33 ( .A(N2), .B(n1), .C(n17), .Y(out[0]) );
  NAND2X1 U34 ( .A(in[0]), .B(n1), .Y(n17) );
  magnitude_DW01_dec_0 sub_19 ( .A(in[15:0]), .SUM({N17, N16, N15, N14, N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2}) );
  INVX2 U2 ( .A(in[16]), .Y(n1) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   input_flag, N5, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, N30, N29, N28, N27, N26, N25, N24, N23, N22, N21, n1, n2, n3, n4,
         n5, n6, n7, n8, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31;

  DFFSR output_flag_reg ( .D(input_flag), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \output_count_reg[9]  ( .D(n84), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \output_count_reg[8]  ( .D(n83), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \output_count_reg[7]  ( .D(n82), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \output_count_reg[6]  ( .D(n81), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \output_count_reg[5]  ( .D(n80), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \output_count_reg[4]  ( .D(n79), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \output_count_reg[3]  ( .D(n78), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \output_count_reg[2]  ( .D(n77), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \output_count_reg[1]  ( .D(n76), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \output_count_reg[0]  ( .D(n75), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  AND2X2 U14 ( .A(n43), .B(n44), .Y(input_flag) );
  OAI22X1 U36 ( .A(n41), .B(n30), .C(n42), .D(N21), .Y(n75) );
  OAI22X1 U37 ( .A(n41), .B(n29), .C(n42), .D(n21), .Y(n76) );
  OAI22X1 U38 ( .A(n41), .B(n28), .C(n42), .D(n20), .Y(n77) );
  OAI22X1 U39 ( .A(n41), .B(n27), .C(n42), .D(n8), .Y(n78) );
  OAI22X1 U40 ( .A(n41), .B(n26), .C(n42), .D(n7), .Y(n79) );
  OAI22X1 U41 ( .A(n41), .B(n25), .C(n42), .D(n6), .Y(n80) );
  OAI22X1 U42 ( .A(n41), .B(n24), .C(n42), .D(n5), .Y(n81) );
  OAI22X1 U43 ( .A(n41), .B(n23), .C(n42), .D(n4), .Y(n82) );
  OAI22X1 U44 ( .A(n41), .B(n22), .C(n42), .D(n3), .Y(n83) );
  OAI22X1 U45 ( .A(n41), .B(n2), .C(n42), .D(n1), .Y(n84) );
  NAND2X1 U46 ( .A(n41), .B(n31), .Y(n42) );
  NOR2X1 U48 ( .A(n45), .B(n46), .Y(n44) );
  NAND3X1 U49 ( .A(n47), .B(n48), .C(n49), .Y(n46) );
  XNOR2X1 U50 ( .A(N14), .B(rollover_val[7]), .Y(n49) );
  XNOR2X1 U51 ( .A(N16), .B(rollover_val[9]), .Y(n48) );
  XNOR2X1 U52 ( .A(N10), .B(rollover_val[3]), .Y(n47) );
  NAND3X1 U53 ( .A(count_enable), .B(n31), .C(n50), .Y(n45) );
  XNOR2X1 U54 ( .A(N15), .B(rollover_val[8]), .Y(n50) );
  NOR2X1 U55 ( .A(n51), .B(n52), .Y(n43) );
  NAND3X1 U56 ( .A(n53), .B(n54), .C(n55), .Y(n52) );
  XNOR2X1 U57 ( .A(N8), .B(rollover_val[1]), .Y(n55) );
  XNOR2X1 U58 ( .A(N7), .B(rollover_val[0]), .Y(n54) );
  XNOR2X1 U59 ( .A(N11), .B(rollover_val[4]), .Y(n53) );
  NAND3X1 U60 ( .A(n56), .B(n57), .C(n58), .Y(n51) );
  XNOR2X1 U61 ( .A(N12), .B(rollover_val[5]), .Y(n58) );
  XNOR2X1 U62 ( .A(N9), .B(rollover_val[2]), .Y(n57) );
  XNOR2X1 U63 ( .A(N13), .B(rollover_val[6]), .Y(n56) );
  NAND3X1 U64 ( .A(n59), .B(n60), .C(n61), .Y(N5) );
  NOR2X1 U65 ( .A(n62), .B(n63), .Y(n61) );
  NAND2X1 U66 ( .A(n64), .B(n65), .Y(n63) );
  XNOR2X1 U67 ( .A(count_out[9]), .B(rollover_val[9]), .Y(n65) );
  XNOR2X1 U68 ( .A(count_out[6]), .B(rollover_val[6]), .Y(n64) );
  NAND3X1 U69 ( .A(n66), .B(n67), .C(n68), .Y(n62) );
  XNOR2X1 U70 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n68) );
  XNOR2X1 U71 ( .A(count_out[7]), .B(rollover_val[7]), .Y(n67) );
  XNOR2X1 U72 ( .A(count_out[8]), .B(rollover_val[8]), .Y(n66) );
  NOR2X1 U73 ( .A(n69), .B(n70), .Y(n60) );
  NAND2X1 U74 ( .A(n71), .B(n72), .Y(n70) );
  XNOR2X1 U75 ( .A(count_out[4]), .B(rollover_val[4]), .Y(n72) );
  XNOR2X1 U76 ( .A(count_out[5]), .B(rollover_val[5]), .Y(n71) );
  XNOR2X1 U77 ( .A(rollover_val[2]), .B(n28), .Y(n69) );
  NOR2X1 U78 ( .A(n73), .B(n74), .Y(n59) );
  XNOR2X1 U79 ( .A(rollover_val[0]), .B(n30), .Y(n74) );
  XNOR2X1 U80 ( .A(rollover_val[1]), .B(n29), .Y(n73) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_61_aco ( .A({N30, N29, N28, N27, 
        N26, N25, N24, N23, N22, N21}), .SUM({N16, N15, N14, N13, N12, N11, 
        N10, N9, N8, N7}) );
  OR2X2 U15 ( .A(count_enable), .B(clear), .Y(n41) );
  AND2X1 U16 ( .A(count_out[0]), .B(N5), .Y(N21) );
  AND2X1 U17 ( .A(count_out[1]), .B(N5), .Y(N22) );
  AND2X1 U18 ( .A(count_out[2]), .B(N5), .Y(N23) );
  AND2X1 U19 ( .A(count_out[3]), .B(N5), .Y(N24) );
  AND2X1 U20 ( .A(count_out[4]), .B(N5), .Y(N25) );
  AND2X1 U21 ( .A(count_out[5]), .B(N5), .Y(N26) );
  AND2X1 U22 ( .A(count_out[6]), .B(N5), .Y(N27) );
  AND2X1 U23 ( .A(count_out[7]), .B(N5), .Y(N28) );
  AND2X1 U24 ( .A(count_out[8]), .B(N5), .Y(N29) );
  AND2X1 U25 ( .A(N5), .B(count_out[9]), .Y(N30) );
  INVX2 U26 ( .A(N16), .Y(n1) );
  INVX2 U27 ( .A(count_out[9]), .Y(n2) );
  INVX2 U28 ( .A(N15), .Y(n3) );
  INVX2 U29 ( .A(N14), .Y(n4) );
  INVX2 U30 ( .A(N13), .Y(n5) );
  INVX2 U31 ( .A(N12), .Y(n6) );
  INVX2 U32 ( .A(N11), .Y(n7) );
  INVX2 U33 ( .A(N10), .Y(n8) );
  INVX2 U34 ( .A(N9), .Y(n20) );
  INVX2 U35 ( .A(N8), .Y(n21) );
  INVX2 U47 ( .A(count_out[8]), .Y(n22) );
  INVX2 U81 ( .A(count_out[7]), .Y(n23) );
  INVX2 U82 ( .A(count_out[6]), .Y(n24) );
  INVX2 U83 ( .A(count_out[5]), .Y(n25) );
  INVX2 U84 ( .A(count_out[4]), .Y(n26) );
  INVX2 U85 ( .A(count_out[3]), .Y(n27) );
  INVX2 U86 ( .A(count_out[2]), .Y(n28) );
  INVX2 U87 ( .A(count_out[1]), .Y(n29) );
  INVX2 U88 ( .A(count_out[0]), .Y(n30) );
  INVX2 U89 ( .A(clear), .Y(n31) );
endmodule


module counter ( clk, n_reset, cnt_up, clear, one_k_samples );
  input clk, n_reset, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 counter ( .clk(clk), .n_rst(n_reset), .clear(
        clear), .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module fir_filter ( clk, n_reset, sample_data, fir_coefficient, data_ready, 
        load_coeff, one_k_samples, modwait, fir_out, err );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, data_ready, load_coeff;
  output one_k_samples, modwait, err;
  wire   drd, lcd, overflowd, cnt_upd, cleard;
  wire   [2:0] opd;
  wire   [3:0] src1d;
  wire   [3:0] src2d;
  wire   [3:0] destd;
  wire   [16:0] outd;
  wire   SYNOPSYS_UNCONNECTED__0;

  sync_low_1 dr_sync ( .clk(clk), .n_rst(n_reset), .async_in(data_ready), 
        .sync_out(drd) );
  sync_low_0 lc_sync ( .clk(clk), .n_rst(n_reset), .async_in(load_coeff), 
        .sync_out(lcd) );
  controller control ( .clk(clk), .n_reset(n_reset), .dr(drd), .lc(lcd), 
        .overflow(overflowd), .cnt_up(cnt_upd), .clear(cleard), .modwait(
        modwait), .op(opd), .src1({SYNOPSYS_UNCONNECTED__0, src1d[2:0]}), 
        .src2(src2d), .dest(destd), .err(err) );
  datapath path ( .clk(clk), .n_reset(n_reset), .op(opd), .src1({1'b0, 
        src1d[2:0]}), .src2(src2d), .dest(destd), .ext_data1(sample_data), 
        .ext_data2(fir_coefficient), .outreg_data(outd), .overflow(overflowd)
         );
  magnitude positive ( .in(outd), .out(fir_out) );
  counter once ( .clk(clk), .n_reset(n_reset), .cnt_up(cnt_upd), .clear(cleard), .one_k_samples(one_k_samples) );
endmodule

