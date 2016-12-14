// program counter example
module pc (
  input	clk,
  input flag,
  input reset,
  input halt,
  input [1:0] branchType,
  input [6:0] startAddress,
  input [6:0] sevenBitAddress,
  input signed[2:0] threeBitOffset,
  input signed[5:0] sixBitOffset,
  output logic[6:0] address);

  
  always_ff @(posedge clk) begin
	if(reset)
		address = startAddress;
	else if (halt)
		address = address;
	else
		case({branchType})
		  'b00: address = (address + 7'b0000001);
		  'b01: address = sevenBitAddress;
		  'b10: 
				if (!flag)
					address = address + 7'(signed'(threeBitOffset));
				else
					address = (address + 7'b0000001);
		  'b11:
				if (!flag)
					address = address + 7'(signed'(sixBitOffset)); 
				else
					address = (address + 7'b0000001);
		endcase
		
		end
		
		

 endmodule