import definitions::*;
module ALU(
  input [ 3:0] operation,
  input [7:0] A,
  input [7:0] B,
  output logic [7:0] out,
  output logic flag
    
);
logic signed [7:0] A_S;
logic signed [7:0] B_S;

	
  always_comb begin
	A_S = A;
	B_S = B;
	case(operation)
	  doNothing: out <= A;
	  absDiff: out <= A_S > B_S ? A_S - B_S : B_S - A_S;
	  LSR1: out <= A >> 1;
	  oneLSL: out <= 1 << A;
	  oneLSLMinus1: out <= (1 << A) - 1;
	  strMatch: 
	  begin
		flag = 
			(A^(B & 8'b00001111)) == 0 |
			((A << 1)^(B & 8'b00011110)) == 0 |
			((A << 2)^(B & 8'b00111100)) == 0 |
			((A << 3)^(B & 8'b01111000)) == 0 |
			((A << 4)^(B & 8'b11110000)) == 0;
	  end
	  
	  add: {flag, out} = A + B;
	  increment: {flag, out} = A + 1;
	  setNegative: flag = A_S < 0;
	  LSL1: out = A << 1;
	  min: out = A < B ? A : B;
	  decrementSetZero:  
	  begin
		out = A - 1;
		flag = (out == 0);
	  end
	  decrementSetOne:  
	  begin
		out = A - 1;
		flag = (out == 1);
	  end
	  addTwo: out = A + 2;
	endcase
  end

endmodule