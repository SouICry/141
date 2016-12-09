//This file defines the parameters used in the alu
package definitions;

// ALU instruction map
const logic [3:0]doNothing  = 4'b0000;
const logic [3:0]absDiff  = 4'b0001;
const logic [3:0]aluLSR1  = 4'b0010;
const logic [3:0]oneLSL  = 4'b0011;
const logic [3:0]oneLSLMinus1  = 4'b0100;
const logic [3:0]strMatch  = 4'b0101;
const logic [3:0]addu  = 4'b0110;
const logic [3:0]aluIncrementIfSet = 4'b0111;
const logic [3:0]setNegative  = 4'b1000;
const logic [3:0]LSL1  = 4'b1001;
const logic [3:0]min  = 4'b1010;
const logic [3:0]decrementSetZero  = 4'b1011;
const logic [3:0]decrementSetOne  = 4'b1100;
const logic [3:0]adduTwo  = 4'b1101;

// CPU instruction map

//opcodes
const logic [2:0]decrementAndBranchIfNotZero = 3'b000;
const logic [2:0]loadAndAbsDiff = 3'b001;
const logic [2:0]BN = 3'b010;
const logic [2:0]copy = 3'b011;
const logic [2:0]type1Operandless = 3'b100;
const logic [2:0]type1Intermediate = 3'b101;
const logic [2:0]type1Register = 3'b110;
const logic [2:0]type1Register2 = 3'b111;

//function codes
const logic [2:0]LSR1 = 3'b000;
const logic [2:0]memOffset = 3'b001;
const logic [2:0]HALT = 3'b010;

const logic [2:0]loadImmOneLSLMinusOne = 3'b000;
const logic [2:0]store = 3'b001;
const logic [2:0]loadFromAddress = 3'b010;
const logic [2:0]loadImmOneLSL = 3'b100;
const logic [2:0]loadImm = 3'b101;

const logic [2:0]load = 3'b000;
const logic [2:0]loadAndSetStringMatchR2 = 3'b001;
const logic [2:0]clear = 3'b010;
const logic [2:0]addTo = 3'b011;
const logic [2:0]incrementIfSet = 3'b100;
const logic [2:0]setIsNegative = 3'b101;
const logic [2:0]leftShift1 = 3'b110;
const logic [2:0]writeMinTo = 3'b111;

const logic [2:0]decrementAndSetIsOne = 3'b000;
const logic [2:0]decrement = 3'b001;
const logic [2:0]storePCPlusTwo = 3'b010;
const logic [2:0]Return = 3'b011;


//ALU source
const logic [3:0]regAOut = 3'b000;
const logic [3:0]regBOut = 3'b001;
const logic [3:0]intermediateOut = 3'b010;
const logic [3:0]dataMemOut = 3'b011;

//DATA_MEM address source
const logic regAData = 1'b0;
const logic intermediateData = 1'b1;

endpackage // defintions
