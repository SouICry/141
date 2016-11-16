module CPU(
	input         start,
	input         clock,
	output        halt);
  
  
	logic[3:0] op;
	logic[7:0] a,b, out;
	logic flag;
	logic flagIn;


alu ALU(
	.operation(op),
	.A(a),
	.B(b),
	.flagIn(flagIn),
	.out(out),
	.flag(flag)
);

	bit CLK;	      // bit can be only 0, 1 (no x or z)
   bit reset;
   bit [1:0] branchType;
   bit [6:0] startAddress;
   bit [2:0] threeBitOffset;
   bit [5:0] sixBitOffset;
   bit [6:0] address;

	pc PC(
	  .clk(clock),
	  .reset(reset),
     .branchType(branchType),
     .startAddress(startAddress),
     .threeBitOffset(threeBitOffset),
     .sixBitOffset(sixBitOffset),
     .address(address)
	);
  
  
   bit       RegWrite,
				 flagWrite;   // bit self-initializes to 0, not x (handy)
	bit		 flagIn;
	logic		 flagOut;
	bit [2:0] srcA,
	          srcB,
             writeReg;
	bit [7:0] writeValue;

// DUT Outputs
	wire [7:0] ReadA,
              ReadB;

// Instantiate the Unit Under Test (UUT)

	reg_file REG(
	  .clock(clock),
	  .enableWrite(RegWrite),
	  .registerA(srcA),
	  .registerB(srcB), 
	  .registerWrite(writeReg),
	  .dataIn(writeValue),
	  .regA(ReadA),
	  .regB(ReadB),
	  .flagWrite(flagWrite),
	  .flagIn(flagIn),
	  .flagOut(flagOut)
	);
	
	bit [6:0] InstAddress;
   bit [8:0] InstOut;

	InstROM INST_MEM(
	  .InstAddress(InstAddress),
	  .InstOut(InstOut)
	);
	
	
	
   bit enableWrite,
   bit [7:0]  address,
   bit [7:0]  dataIn,
	bit [7:0] dataOut
	dataMem DATA_MEM(
     .clock(clock),
     .enableWrite(enableWrite),
     .address(address),
     .dataIn(dataIn),
	  .dataOut(dataOut)
	);
endmodule