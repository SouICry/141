//This file defines the parameters used in the alu
package definitions;
    
// ALU instruction map
    const logic [3:0]doNothing  = 4'd0;
    const logic [3:0]absDiff  = 4'd1;
    const logic [3:0]LSR1  = 4'd2;
    const logic [3:0]oneLSL  = 4'd3;
    const logic [3:0]oneLSLMinus1  = 4'd4;
    const logic [3:0]strMatch  = 4'd5;
	 const logic [3:0]add  = 4'd6;
	 const logic [3:0]increment  = 4'd7;
	 const logic [3:0]setNegative  = 4'd8;
	 const logic [3:0]LSL1  = 4'd9;
	 const logic [3:0]min  = 4'd10;
	 const logic [3:0]decrementSetZero  = 4'd11;
	 const logic [3:0]decrementSetOne  = 4'd12;
	 const logic [3:0]addTwo  = 4'd13;
endpackage // defintions
