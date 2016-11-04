`timescale 1ns / 1ps
import definitions::*;
module test;

	

logic[3:0] op;
logic[7:0] a,b, out;
logic flag;
logic flagIn;


alu test(.operation(op),
.A(a),
.B(b),
.flagIn(flagIn),
.out(out),
.flag(flag)
);
  initial 
  begin
	//Reset
	op = doNothing;;
	a = 8'bX;
	b = 8'bX;
	flag = 8'bX;
	#1ns
	//End reset
	
	op = absDiff;
	a = 8'd5;
	b = 8'd127;	
	#1ns
	a = 8'd5;
	b = -8'd50;	
	#1ns
	a = -8'd5;
	b = 8'd50;	
	#1ns
	a = -8'd5;
	b = -8'd127;	
	#1ns
	a = 8'd127;
	b = -8'd128;	
	#1ns
	a = 8'd100;
	b = -8'd100;	
	#1ns
	
	//Reset
	op = doNothing;;
	a = 8'bX;
	b = 8'bX;
	flag = 8'bX;
	#1ns
	//End reset
	
	op = LSR1;
	b = 8'bX;
	
	a = 8'b11111111;	
	#1ns
	a = 8'b11111110;	
	#1ns
	a = 8'b00001111;	
	#1ns
	a = 8'b00000000;	
	#1ns
	
	//Reset
	op = doNothing;;
	a = 8'bX;
	b = 8'bX;
	flag = 8'bX;
	#1ns
	//End reset
	
	op = oneLSL;
	b = 8'bX;
	a = 8'd1;	
	#1ns
	a = 8'd5;	
	#1ns
	a = 8'd20;	
	#1ns
	a = 8'd0;	
	#1ns
	a = -8'd3;	
	#1ns
	
	//Reset
	op = doNothing;
	a = 8'bX;
	b = 8'bX;
	flag = 8'bX;
	#1ns
	//End reset
	
	op = oneLSLMinus1;
	b = 8'bX;
	a = 8'd1;	
	#1ns
	a = 8'd5;	
	#1ns
	a = 8'd20;	
	#1ns
	a = 8'd0;	
	#1ns
	a = -8'd3;	
	#1ns
	
	//Reset
	op = doNothing;
	a = 8'bX;
	b = 8'bX;
	flag = 8'bX;
	#1ns
	//End reset
	
	op = strMatch;
	a = 8'b1111;
	b = 8'b00001111;	
	#1ns
	a = 8'b1111;
	b = 8'b00011110;
	#1ns
	a = 8'b1111;
	b = 8'b00111100;
	#1ns
	a = 8'b1111;
	b = 8'b01111000;	
	#1ns
	a = 8'b1111;
	b = 8'b11110000;		
	#1ns
	a = 8'b0000;
	b = 8'b11000011;		
	#1ns
	a = 8'b0000;
	b = 8'b11000001;	
	#1ns
	a = 8'b0000;
	b = 8'b01000001;	
	#1ns
	a = 8'b0000;
	b = 8'b0001001;
	#1ns
	a = 8'b1010;
	b = 8'b0001001;
	#1ns
	a = 8'b11111010;
	b = 8'b00001010;
	#1ns
	a = 8'b11111010;
	b = 8'b00101000;
   #1ns $stop;
	
	//Reset
	op = doNothing;
	a = 8'bX;
	b = 8'bX;
	flag = 8'bX;
	#1ns
	//End reset
	
	op = addu;
	a = 8'd5;
	b = 8'd16;
	#1ns
	a = 8'd5;
	b = -8'd16;
	#1ns
	a = 8'd5;
	b = 8'd129;
	#1ns
	a = 8'd180;
	b = 8'd180;
	#1ns
	
	//Reset
	op = doNothing;
	a = 8'bX;
	b = 8'bX;
	flag = 8'bX;
	#1ns
	//End reset
	
	op = incrementIfSet;
	b = 8'bX;
	
	a = 8'd6;
	flagIn = 1'b1;
	#1ns
	a = 8'd6;
	flagIn = 1'b0;
	#1ns
	a = -8'd6;
	flagIn = 1'b1;
	#1ns
	a = 8'd127;
	flagIn = 1'b1;
	#1ns
	a = 8'd255;
	flagIn = 1'b1;
	#1ns
	
	//Reset
	op = doNothing;
	a = 8'bX;
	b = 8'bX;
	flag = 8'bX;
	#1ns
	//End reset
	
	op = setNegative;
	b = 8'bX;
	
	a = 8'd6;
	flag = 8'bX;
	#1ns
	a = -8'd6;
	flag = 8'bX;
	#1ns
	a = 8'd0;
	flag = 8'bX;
	#1ns
	a = 8'd127;
	flag = 8'bX;
	#1ns
	a = 8'd128;
	flag = 8'bX;
	#1ns
	a = 8'd255;
	flag = 8'bX;
	#1ns
	
	//Reset
	op = doNothing;
	a = 8'bX;
	b = 8'bX;
	flag = 8'bX;
	#1ns
	//End reset
	
	op = LSL1;
	b = 8'bX;
	
	a = 8'b1111;
	flagIn = 1;
	#1ns
	a = 8'b1111;
	flagIn = 0;
	#1ns
	a = 8'b1000;
	flagIn = 1;
	#1ns
	a = 8'b1000;
	flagIn = 0;
	#1ns
	a = 8'b11110000;
	flagIn = 1;
	#1ns
	a = 8'b11110000;
	flagIn = 0;
	#1ns
	
	//Reset
	op = doNothing;
	a = 8'bX;
	b = 8'bX;
	flag = 8'bX;
	#1ns
	//End reset
	
	op = min;
	
	a = 8'd5;
	b = 8'd12;
	#1ns
	a = 8'd15;
	b = 8'd2;
	#1ns
	a = -8'd5;
	b = 8'd12;
	#1ns
	a = 8'd127;
	b = 8'd128;
	#1ns
	a = 8'd255;
	b = 8'd0;
	#1ns
	
	
	//Reset
	op = doNothing;
	a = 8'bX;
	b = 8'bX;
	flag = 8'bX;
	#1ns
	//End reset
	
	//Reset
	op = doNothing;
	a = 8'bX;
	b = 8'bX;
	flag = 8'bX;
	#1ns
	//End reset
	
	//Reset
	op = doNothing;
	a = 8'bX;
	b = 8'bX;
	flag = 8'bX;
	#1ns
	//End reset
	
	//Reset
	op = doNothing;
	a = 8'bX;
	b = 8'bX;
	flag = 8'bX;
	#1ns
	//End reset
	;
  end

endmodule 