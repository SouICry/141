import definitions::*;
module CPU(
	input[6:0]    start,
	input         clock,
	input reset,
	output        halt
);
  
	  
   logic [1:0] branchType;//-
	//logic [6:0] sevenBitAddress; //
   logic [2:0] threelogicOffset;	//-
   logic [5:0] sixlogicOffset;	//-
	
   //INST_MEM
	logic [6:0] InstAddress;	//-
	logic [8:0] InstOut;	//-
	
	//FLAG
	logic		  flagIn;	//-
	logic		  flagOut;	//-
	
   //CONTROL, or directly assigned to values
	logic [7:0] intermediate; //The intermediate value, if any
	logic [3:0] aluASrc; //The source which alu should get data for A
	logic [3:0] aluBSrc; //The source which alu should get data for B
	logic dataMemAddressSrc; //The data which data_mem should use as address

	
	
	//REG
	logic [2:0] srcA;	//-
	logic [2:0] srcB;	//-
	logic [7:0] regA;	//-
   logic [7:0] regB;	//-
   logic       regWrite;	//-
   logic [2:0] srcWrite;	//-
	
	//DATA_MEM
   logic 		  dataWrite;	//-
   logic [7:0] dataAddress;	//-
	logic [7:0] dataOut;	//-
	logic 		  memOffsetWrite;//-
	
	//ALU
	logic[3:0] aluOP;	//-
	logic[7:0] aluA;	//-
	logic[7:0] aluB;	//-
	logic[7:0] aluOut;	//-

	
// Multiplexors for data sources	
/*
initial begin
	InstAddress = 0;
	reset = 0;
	flagIn = 0;
	flagOut = 0;
	regA = 0;
	regB = 0;
	dataOut = 0;
	dataAddress = 0;
	aluB = 0;
	aluOut = 0;
end
*/
always_comb	begin

	case(aluASrc)
		regAOut: begin
			aluA <= regA;
			end
		regBOut: begin
			aluA <= regB; 
			end
		intermediateOut: begin
			aluA <= intermediate;
			end
		dataMemOut: begin	
			aluA <= dataOut;
			end
	endcase
	
	case(aluBSrc)
		regAOut: begin
			aluB <= regA;
			end
		regBOut: begin
			aluB <= regB; 
			end
		intermediateOut: begin
			aluB <= intermediate;
			end
		dataMemOut: begin	
			aluB <= dataOut;
			end
	endcase
	
	case (dataMemAddressSrc)
		regAData: begin	
			dataAddress = regA;
			end
		intermediateData: begin
			dataAddress = intermediate;
			end
	endcase
end
	
	
	flag FLAG(
		.clock(clock),
		.flagIn(flagIn),
		.flagOut(flagOut)
	);
		
		
		
   control CONTROL(
		.OPCODE(InstOut[8:6]),
		.A(InstOut[5:3]),
		.B(InstOut[2:0]),
		.flag(flagOut),
		.srcA(srcA),
		.srcB(srcB),
		.regWrite(regWrite),
		.srcWrite(srcWrite),
		.dataWrite(dataWrite),
		.aluOp(aluOP),
		.programCounter(InstAddress),
		.branchType(branchType),
		.threewireOffset(threelogicOffset),
		.sixwireOffset(sixlogicOffset),
		.memOffsetWrite(memOffsetWrite),
		.intermediate(intermediate),
		.aluA(aluASrc),
		.aluB(aluBSrc),
		.dataMemAddress(dataMemAddressSrc)
		
	);
	
	pc PC(
	  .clk(clock),
	  .flag(flagOut),
	  .reset(reset),
     .branchType(branchType),
     .startAddress(start),
	  .sevenBitAddress(regA[6:0]),//
	  //.sevenBitAddress(sevenBitAddress),
     .threeBitOffset(threelogicOffset),
     .sixBitOffset(sixlogicOffset),
     .address(InstAddress)
	);
	
	InstROM INST_MEM(
	  .InstAddress(InstAddress),
	  .InstOut(InstOut)
	);
	
	reg_file REG(
	  .clock(clock),
	  .enableWrite(regWrite),
	  .registerA(srcA),
	  .registerB(srcB), 
	  .registerWrite(srcWrite),
	  .dataIn(aluOut),//
	  .regA(regA),
	  .regB(regB)
	);
	
	dataMem DATA_MEM(
     .clock(clock),
     .enableWrite(dataWrite),
     .address(dataAddress),
     .dataIn(aluOut),//
	  .dataOut(dataOut),
	  .memOffsetWrite(memOffsetWrite),
	  .memOffsetIn(regA[6:0])
	);

	alu ALU(
		.operation(aluOP),
		.A(aluA),
		.B(aluB),
		.out(aluOut),
		.flagIn(flagOut),
		.flag(flagIn)
	);
endmodule