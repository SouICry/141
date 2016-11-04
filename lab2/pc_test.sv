module pc_test;
// DUT Input Drivers
	bit CLK;	      // bit can be only 0, 1 (no x or z)
   bit reset;
   bit [1:0] branchType;
   bit [6:0] startAddress;
   bit [2:0] threeBitOffset;
   bit [5:0] sixBitOffset;
   bit [6:0] address;

// Instantiate the Unit Under Test (UUT)

	pc test(
	  .clk(CLK),
	  .reset(reset),
     .branchType(branchType),
     .startAddress(startAddress),
     .threeBitOffset(threeBitOffset),
     .sixBitOffset(sixBitOffset),
     .address(address)
	);

	initial begin
		#20ns;
		reset = 1'b1;
		startAddress = 7'h36;
		#20ns;
		reset = 1'b0;
		branchType = 2'b10;
		#20ns;
		branchType = 2'b10;
		#20ns;
		branchType = 2'b10;
		#20ns;
		branchType = 2'b00;
		threeBitOffset = 3'h2;
		#20ns;
		branchType = 2'b01;
		sixBitOffset = 6'h12;
		#20ns
		branchType = 2'b00;
		threeBitOffset = 3'b111;
		#20ns
		$stop;
	  
	end
always begin
  #10ns CLK = 1;
  #10ns CLK = 0;
end      
endmodule