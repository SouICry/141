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
     'b00: address <= address + 1;
	  'b01: address <= address + threeBitOffset;
	  'b10: address <= address + sixBitOffset; 
	  default: address <= address + 1;
	endcase
 
 endmodule