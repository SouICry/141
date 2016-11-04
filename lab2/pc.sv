// program counter example
module pc (
  input	clk,
  input reset,
  input [1:0] branchType,
  input [6:0] startAddress,
  input signed[2:0] threeBitOffset,
  input signed[5:0] sixBitOffset,
  output logic[6:0] address);

  
  always_ff @(posedge clk) 
    if(reset)
	  address <= startAddress;
	else
    case({branchType})
     'b00: address <= address + 7'(signed'(threeBitOffset));
	  'b01: address <= address + 7'(signed'(sixBitOffset)); 
	  'b10: address <= (address + 7'b0000001);
	  'b11: address <= (address + 7'b0000001);
	 endcase
 
 endmodule