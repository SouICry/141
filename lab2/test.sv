`timescale 1ns / 1ps
import definitions::*;
module test;

	



	logic[6:0]    start;
	logic         clock;
	logic        halt;
	logic        reset;
CPU CPU(
.start(start), .clock(clock), .reset(reset), .halt(halt)
);

		//$display("PC: %d", address);

  initial 
  begin
  start = 7'd0;
  reset = 1;
  #15ns;
  reset = 0;
  
  end
  
	
always begin
  clock = 0;#10ns ;
  clock = 1;#10ns ;
end
  

endmodule 