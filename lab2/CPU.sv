import definitions::*;
module CPU(
	input[6:0]    start,
	input         clock,
	output        halt
);
  
  
   //PC
   wire reset;	//
   wire [1:0] branchType;//-
	//wire [6:0] sevenBitAddress; //
   wire [2:0] threewireOffset;	//-
   wire [5:0] sixwireOffset;	//-
	
   //INST_MEM
	wire [6:0] InstAddress;	//-
	wire [8:0] InstOut;	//-
	
	//FLAG
	wire		  flagIn;	//-
	wire		  flagOut;	//-
	
   //CONTROL, or directly assigned to values
	wire [7:0] intermediate; //The intermediate value, if any
	wire [3:0] aluASrc; //The source which alu should get data for A
	wire [3:0] aluBSrc; //The source which alu should get data for B
	wire dataMemAddressSrc; //The data which data_mem should use as address
	
	//REG
	wire [2:0] srcA;	//-
	wire [2:0] srcB;	//-
	wire [7:0] regA;	//-
   wire [7:0] regB;	//-
   wire       regWrite;	//-
   wire [2:0] srcWrite;	//-
	
	//DATA_MEM
   wire 		  dataWrite;	//-
   logic [7:0] dataAddress;	//-
	wire [7:0] dataOut;	//-
	wire 		  memOffsetWrite;//-
	
	//ALU
	wire[3:0] aluOP;	//-
	logic[7:0] aluA;	//-
	logic[7:0] aluB;	//-
	wire[7:0] aluOut;	//-

	
// Multiplexors for data sources	
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
		.OPCODE(InstOut[2:0]),
		.A(InstOut[5:3]),
		.B(InstOut[8:6]),
		.flag(flagOut),
		.srcA(srcA),
		.srcB(srcB),
		.srcWrite(srcWrite),
		.dataWrite(dataWrite),
		.aluOp(aluOP),
		.branchType(branchType),
		.threewireOffset(threewireOffset),
		.sixwireOffset(sixwireOffset),
		.memOffsetWrite(memOffsetWrite),
		.programCounter(InstAddress)
		
	);
	
	pc PC(
	  .clk(clock),
	  .flag(flagOut),
	  .reset(reset),
     .branchType(branchType),
     .startAddress(start),
	  .sevenBitAddress(regA),//
	  //.sevenBitAddress(sevenBitAddress),
     .threewireOffset(threewireOffset),
     .sixwireOffset(sixwireOffset),
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
	  .memOffsetIn(regA)
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