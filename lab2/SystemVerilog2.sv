module memOffset(
  input   clock,
  input 	 memOffsetWrite
  input 	 memOffsetIn,
  output  memOffsetOut
);

logic flagVal;

assign flagOut = flagVal;

always_ff @(posedge clock)
	flagVal <= flagIn;

endmodule 