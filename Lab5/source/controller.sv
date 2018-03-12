// $Id: $
// File name:   controller.sv
// Created:     2/15/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .

module controller
(
	input wire clk,
	input wire n_reset,
	input wire dr,
	input wire lc,
	input wire overflow,
	output reg cnt_up,
	output reg clear,
	output wire modwait,
	output reg [2:0] op,
	output reg [3:0] src1,
	output reg [3:0] src2,
	output reg [3:0] dest,
	output reg err
);

reg curr_modwait, next_modwait;
assign modwait = curr_modwait;

typedef enum bit [4:0] {
	IDLE,STORE,ZERO,
	SORT1,SORT2,SORT3,SORT4,
	MUL1,SUB1,MUL2,ADD1,MUL3,SUB2,MUL4,ADD2,
	LOAD1,LOAD2,LOAD3,LOAD4,MODWAIT1,MODWAIT2,MODWAIT3,
	EIDLE
} stateType;

stateType state, next_state;

always_ff @ (posedge clk, negedge n_reset)
begin
	if(n_reset == 0) 
	begin
		state <= IDLE;
		curr_modwait <= 0;
	end
	
	else
	begin
		state <= next_state;
		curr_modwait <= next_modwait;
	end
end

always_comb
begin
	next_state = state;
	
	case(state)
		IDLE:
		begin
			if(lc == 1'b1)
				next_state = LOAD1;
			else if(dr == 1'b1)
				next_state = STORE;
			else
				next_state = IDLE;
		end

		LOAD1:
		begin
			next_state = MODWAIT1;
		end

		MODWAIT1:
		begin
			if(lc == 1) 
				next_state = LOAD2;
			else
				next_state = MODWAIT1;
		end

		LOAD2:
		begin
			next_state = MODWAIT2;
		end

		MODWAIT2:
		begin
			if(lc == 1)
				next_state = LOAD3;
			else
				next_state = MODWAIT2;
		end

		LOAD3:
		begin
			next_state = MODWAIT3;
		end

		MODWAIT3:
		begin
			if (lc == 1)
				next_state = LOAD4;
			else
				next_state = MODWAIT3;
		end

		LOAD4:
		begin
			next_state = IDLE;
		end

		STORE:
		begin
			if(dr == 1)
				next_state = ZERO;
			else
				next_state = EIDLE;
		end

		ZERO: next_state = SORT1;

		SORT1: next_state = SORT2;

		SORT2: next_state = SORT3;

		SORT3: next_state = SORT4;

		SORT4: next_state = MUL1;

		MUL1: next_state = SUB1;

		SUB1:
		begin
			//next_state = MUL2;
			if(overflow == 1)
				next_state = EIDLE;
			else
				next_state = MUL2;
		end

	        MUL2: next_state = ADD1;
	  

		ADD1:
		begin
			//next_state = MUL3;
			if(overflow == 1)
				next_state = EIDLE;
			else
				next_state = MUL3;
		end

		MUL3: next_state = SUB2;

		SUB2:
		begin
			//next_state = MUL4;
			if(overflow == 1)
				next_state = EIDLE;
			else
				next_state = MUL4;
		end

		MUL4: next_state = ADD2;

		ADD2:
		begin
			if(overflow == 1)
				next_state = EIDLE;
			else
				next_state = IDLE;
		end

		EIDLE:
		begin
			if(dr == 1)
				next_state = STORE;
			else if(lc == 1)
				next_state = LOAD1;
			else
				next_state = EIDLE;
		end
	endcase
end



always_comb
begin
	cnt_up = 0;
	err    = 0;
	clear  = 0;
	dest   = 0;
	src1   = 0;
	src2   = 0;
	op     = 0;
	next_modwait = 1;

	case(state)
		IDLE:
		begin
			next_modwait = 0;
		end

		LOAD1:
		begin
			dest  = 6;
			clear = 1;
			op    = 3'b011;
		end

		LOAD2:
		begin
			dest  = 7;
			clear = 1;
			op    = 3'b011;
		end

		LOAD3:
		begin
			dest  = 8;
			clear = 1;
			op    = 3'b011;
		end

		LOAD4:
		begin
			dest  = 9;
			clear = 1;
			op    = 3'b011;
		end

		MODWAIT1:
		begin
			next_modwait = 0;
		end

		MODWAIT2:
		begin
			next_modwait = 0;
		end

		MODWAIT3:
		begin
			next_modwait = 0;
		end

		STORE:
		begin
			dest = 5;
			op = 3'b010;
		end

		ZERO:
		begin
			cnt_up = 1;
			op = 3'b101;
			src1 = 0;
			src2 = 0;
			dest = 0;
		   
		   
		end

		SORT1:
		begin
			op = 3'b001;
			src1 = 2;
			dest = 1;
		end

		SORT2:
		begin
			op = 3'b001;
			src1 = 3;
			dest = 2;
		end

		SORT3:
		begin
			op = 3'b001;
			src1 = 4;
			dest = 3;
		end

		SORT4:
		begin
			op = 3'b001;
			src1 = 5;
			dest = 4;
		end

		MUL1:
		begin
			op = 3'b110;
			src1 = 1;
			src2 = 9;
			dest = 10;
		end

		SUB1:
		begin
			op = 3'b101;
			src1 = 0;
			src2 = 10;
			dest = 0;
		end

		MUL2:
		begin
		        op = 3'b110;
			src1 = 2;
			src2 = 8;
			dest = 10;
		end

		ADD1:
		begin
			op = 3'b100;
			src1 = 0;
			src2 = 10;
			dest = 0;
		end

		MUL3:
		begin
			op = 3'b110;
			src1 = 3;
			src2 = 7;
			dest = 10;
		end

		SUB2:
		begin
			op = 3'b101;
			src1 = 0;
			src2 = 10;
			dest = 0;
		end

		MUL4:
		begin
			op = 3'b110;
			src1 = 4;
			src2 = 6;
			dest = 10;
		end

		ADD2:
		begin
			op = 3'b100;
			src1 = 0;
			src2 = 10;
			dest = 0;
		end

		EIDLE:
		begin
			err  = 1;
			next_modwait = 0;
		end

	endcase
end

endmodule

















