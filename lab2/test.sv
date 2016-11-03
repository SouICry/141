`timescale 1ns / 1ps
import definitions::*;
module test;

	

logic[3:0] op;
logic[7:0] a,b, out;
logic flag;


ALU test(.operation(op),
.A(a),
.B(b),
.out(out),
.flag(flag)
);
  initial begin
	op = strMatch;
	
	a = 8'b1111;
	b = 8'b1110;	
	#1ns
	a = 8'b1111;
	b = 8'b1111;	
	#1ns
	a = 8'b1111;
	b = 8'b11111;	
	
	a = 8'b1111;
	b = 8'b1100111;	
	#1ns
	a = 8'b1111;
	b = 8'b11110000;	
	#1ns
	a = 8'b0000;
	b = 8'b11000011;	
	#1ns

    #1ns $stop;
  end

endmodule 