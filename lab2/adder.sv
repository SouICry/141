`timescale 1ns / 1ps
/*
 * CSE141L Lab1: Tools of the Trade
 * University of California, San Diego
 */

module adder #(parameter W = 8)
(
 input          clk,
 input  [W-1:0] a_i, b_i,
 output [W  :0] sum_o,
 output         is_odd_o
);

  logic [W-1:0] a_r, b_r;	     // input registers
  logic [W  :0] sum_r;		     // output register
  logic         is_odd_r;
  logic [W  :0] sum_next;

  assign sum_next = a_r + b_r;	 // note = (blocking)
  assign sum_o    = sum_r;
  assign is_odd_o = is_odd_r;

  always_ff @(posedge clk)       // always_ff looks for pos/negedge 
    begin
      a_r      <= a_i;		     // note <= (nonblocking)
      b_r      <= b_i;
      sum_r    <= sum_next;
      is_odd_r <= sum_o[0]? 1'b1: 1'b0;
    end

endmodule
 
