// program counter example
module pc (
  input	clk,
  input reset,
  input [1:0] branchType,
  input signed[2:0] threeBitOffset,
  input signed[5:0] sixBitOffset,
  output logic[9:0] p_ct);

  always_ff @(posedge clk) 
    if(reset)
	  p_ct <= 0;
	else
    case({branchType})
     'b00: p_ct <= p_ct + 1;
	  'b01: p_ct <= p_ct + threeBitOffset;
	  'b10: p_ct <= p_ct + sixBitOffset; 
	endcase
 
 endmodule