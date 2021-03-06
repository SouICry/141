`timescale 1ns / 1ps

module test;

  bit         clk;
  logic[ 7:0] a, b;
  logic[ 8:0] sum;
  logic is_odd;
  
  adder testAdder(.clk(clk), 
	.a_i(a), 
	.b_i(b), 
	.sum_o(sum),
	.is_odd_o(is_odd));

  initial begin

	#15ns
	a = 8'd0;
	b = 8'd1;	
	#10ns
	a = 8'd2;
	b = 8'd2;	
	#10ns
	a = 8'd9;
	b = 8'd10;	
	#10ns
	a = 8'd15;
	b = 8'd5;	
	#10ns
	a = 8'd4;
	b = 8'd7;	
	#10ns

    #10ns $stop;
  end
  always begin
    #5ns clk = 1;
	#5ns clk = 0;
  end

endmodule 