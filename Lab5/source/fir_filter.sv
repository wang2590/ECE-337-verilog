// $Id: $
// File name:   fir_filter.sv
// Created:     2/15/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

module fir_filter
(
	input wire clk,
	input wire n_reset,
	input wire [15:0] sample_data,
	input wire [15:0] fir_coefficient,
	input wire data_ready,
	input wire load_coeff,
	
	output wire one_k_samples,
	output wire modwait,
	output wire [15:0] fir_out,
	output wire err
);

wire drd;
wire lcd;
wire cnt_upd;
wire cleard;
wire overflowd;
wire [2:0] opd;
wire [3:0] src1d, src2d, destd;
wire [16:0] outd;


sync_low  dr_sync(
	.clk(clk), 
	.n_rst(n_reset), 
	.async_in(data_ready), 
	.sync_out(drd)
);

sync_low  lc_sync(
	.clk(clk), 
	.n_rst(n_reset), 
	.async_in(load_coeff), 
	.sync_out(lcd)
);

controller control(
	.clk(clk), 
	.n_reset(n_reset), 
	.dr(drd), 
	.lc(lcd), 
	.overflow(overflowd), 
	.cnt_up(cnt_upd), 
	.clear(cleard), 
	.modwait(modwait), 
	.op(opd), 
	.src1(src1d), 
	.src2(src2d), 
	.dest(destd), 
	.err(err)
);

datapath path(
	.clk(clk), 
	.n_reset(n_reset), 
	.op(opd), 
	.src1(src1d), 
	.src2(src2d), 
	.dest(destd), 
	.ext_data1(sample_data), 
	.ext_data2(fir_coefficient), 
	.outreg_data(outd), 
	.overflow(overflowd)
);

magnitude positive(
	.in(outd), 
	.out(fir_out)
);

counter once(
	.clk(clk), 
	.n_reset(n_reset), 
	.cnt_up(cnt_upd), 
	.clear(cleard), 
	.one_k_samples(one_k_samples)
);

endmodule
