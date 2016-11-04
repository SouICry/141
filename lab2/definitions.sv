//This file defines the parameters used in the alu
package definitions;
    
// ALU instruction map
    const logic [3:0]doNothing  = 4'b0000;
    const logic [3:0]absDiff  = 4'b0001;
    const logic [3:0]LSR1  = 4'b0010;
    const logic [3:0]oneLSL  = 4'b0011;
    const logic [3:0]oneLSLMinus1  = 4'b0100;
    const logic [3:0]strMatch  = 4'b0101;
	 const logic [3:0]addu  = 4'b0110;
	 const logic [3:0]incrementIfSet  = 4'b0111;
	 const logic [3:0]setNegative  = 4'b1000;
	 const logic [3:0]LSL1  = 4'b1001;
	 const logic [3:0]min  = 4'b1010;
	 const logic [3:0]decrementSetZero  = 4'b1011;
	 const logic [3:0]decrementSetOne  = 4'b1100;
	 const logic [3:0]adduTwo  = 4'b1101;
	 
endpackage // defintions
