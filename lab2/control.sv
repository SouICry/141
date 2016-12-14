import definitions::*;
module control(
	input [2:0] OPCODE,
	input [2:0] A,
	input [2:0] B,
	input flag,
	output logic halt,
	//REG
	output logic [2:0] srcA,
	output logic [2:0] srcB,
   output logic regWrite,
	output logic [2:0]srcWrite,
	//DATA_MEM
	output logic dataWrite,
	//ALU
	output logic [3:0] aluOp,
	//PC
	input logic [6:0] programCounter,
	output logic [1:0] branchType,
	output logic [2:0] threewireOffset,
	output logic [5:0] sixwireOffset,
	
	//MEM_OFFSET
	output logic memOffsetWrite,
	
	//CONTROL
	output logic [7:0] intermediate,
	output logic [3:0] aluA,
	output logic [3:0] aluB,
	output logic dataMemAddress
);
	
	
always_comb	
	begin
	branchType = 2'b0;
	threewireOffset = 3'b0;
	sixwireOffset = 6'b0;
	srcA = 2'b0;
	srcB = 2'b0;
	regWrite = 0;
	srcWrite = 0;
	halt = 0;
	dataWrite = 0;
	
	aluOp = doNothing;
	
	memOffsetWrite = 0;
	
	intermediate = 0;
	aluA = 0;
	aluB = 0;
	dataMemAddress = 0;
	
	  case(OPCODE)
	  	 decrementAndBranchIfNotZero : begin
			branchType = 2'b10;
			threewireOffset = B;
			srcA = A;
			regWrite = 1;
			srcWrite = A;
			aluOp = decrementSetZero;
			aluA = regAOut;
			end
	  	 loadAndAbsDiff : begin
			srcA = A;
			srcB = B;
			regWrite = 1;
			srcWrite = 0;
			aluOp = absDiff;
			aluA = dataMemOut;
			aluB = regBOut;
			dataMemAddress = regAData;
			end
	  	 BN : begin
			branchType = 2'b11;
			sixwireOffset = {A, B};//little endian
			end
	  	 copy : begin
			srcA = A;
			regWrite = 1;
			srcWrite = B;
			end
	  	 type1Operandless : begin
			case(A)
				LSR1 : begin
					srcA = 0;
					regWrite = 1;
					srcWrite = 0;
					aluOp = aluLSR1;
					aluA = regAOut;
					end
				memOffset : begin
					memOffsetWrite = 1;
					end
				HALT : begin
				halt = 1;
					end
			endcase
		 end
	  	 type1Intermediate : begin
			case(A)
				loadImmOneLSLMinusOne : begin
					regWrite = 1;
					srcWrite = 0;
					aluOp = oneLSLMinus1;
					aluA = intermediateOut;
					intermediate = B;
					end
				store : begin
					dataWrite = 1;
					srcA = 0;
					intermediate = B;
					dataMemAddress = intermediateData;
					end
				loadFromAddress : begin
					regWrite = 1;
					srcWrite = 0;
					aluOp = doNothing;
					aluA = dataMemOut;
					intermediate = B;
					dataMemAddress = intermediateData;
					end
				loadImmOneLSL : begin
					regWrite = 1;
					srcWrite = 0;
					aluOp = oneLSL;
					aluA = intermediateOut;
					intermediate = B;
					end
				loadImm : begin
					regWrite = 1;
					srcWrite = 0;
					intermediate = B;
					aluOp = doNothing;
					aluA = intermediateOut;
					end
			endcase
		 end
	  	 type1Register : begin
			case(A)
				load : begin
					srcA = B;
					regWrite = 1;
					srcWrite = 0;
					aluOp = doNothing;
					aluA = dataMemOut;
					dataMemAddress = regAData;
					end
				loadAndSetStringMatchR2 : begin
					srcA = B;
					srcB = 2;
					aluOp = strMatch;
					aluA = regBOut;
					aluB = dataMemOut;
					dataMemAddress = regAData;
					end
				clear : begin
					regWrite = 1;
					srcWrite = B;
					intermediate = 0;
					aluA = intermediateOut;
					end
				addTo : begin
					srcA = 0;
					srcB = B;
					regWrite = 1;
					srcWrite = B;
					aluOp = addu;
					aluA = regAOut;
					aluB = regBOut;
					end
				incrementIfSet : begin
					srcA = B;
					regWrite = 1;
					srcWrite = B;
					aluOp = aluIncrementIfSet;
					aluA = regAOut;
					end
				setIsNegative : begin
					srcA = B;
					aluOp = setNegative;
					aluA = regAOut;
					end
				leftShift1 : begin
					srcA = B;
					regWrite = 1;
					srcWrite = B;
					aluOp = LSL1;
					aluA = regAOut;
					end
				writeMinTo : begin
					srcA = B;
					srcB = 0;
					regWrite = 1;
					srcWrite = B;
					aluOp = min;
					aluA = regAOut;
					aluB = regBOut;
					end
			endcase
		 end
		 type1Register2 : begin
			case(A)
				decrementAndSetIsOne : begin
					srcA = B;
					regWrite = 1;
					srcWrite = B;
					aluOp = decrementSetOne;
					aluA = regAOut;
					end
				decrement : begin
					srcA = B;
					regWrite = 1;
					srcWrite = B;
					aluOp = decrementSetZero;
					aluA = regAOut;
					end
				storePCPlusTwo : begin
					regWrite = 1;
					srcWrite = B;
					aluOp = adduTwo;
					aluA = intermediateOut;
					intermediate = programCounter;
					end
				Return : begin
					branchType = 2'b01;
					srcA = B;
					end
			endcase
		 end
	endcase
end

endmodule