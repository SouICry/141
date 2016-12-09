module flag(
  input   clock,
  input 	 flagIn,
  output  flagOut
);

logic flagVal;

initial 
	flagVal = 1'd0;

assign flagOut = flagVal;

always_ff @(posedge clock)
	flagVal <= flagIn;

endmodule 