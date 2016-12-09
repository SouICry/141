module flag(
  input   clock,
  input 	 flagIn,
  output  flagOut
);

logic flagVal;

assign flagOut = flagVal;

always_ff @(posedge clock)
	flagVal <= flagIn;

endmodule 